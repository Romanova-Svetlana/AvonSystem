package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime, TextFormat }
import DateTime.{dateNow, dateToInt}
import LogUtil.log
import DbConn.{select, update}

// https://my.avon.ru/assets/ru-ru/images/product/prod_9804561aa_1_310x310.jpg
// https://my.avon.ru/assets/ru-ru/images/product/prod_9803272aa_2_613x613.jpg

// Update in the database received by parsing data. Обновление в базе полученных парсингом данных.
class DBUpdate(parse_type: Short, countries_id: Short, languages_id: Short, date: Int) extends ParseT with TextFormat {

  val dateNowInt = dateToInt(dateNow.toString)

  def sCountriesProductsUrls = select(s"SELECT img_url, product_url FROM countries_urls WHERE countries_id = $countries_id AND languages_id = $languages_id;") match {
    case Success(res) => Some(res.map(col => 
      (
        col.getString("img_url"),
        col.getString("product_url")
      )
    ).toList)
  case Failure(err) => 
    log("warn", s"Не удалось получить данные из таблицы countries_urls", true, List("parserdata.DBUpdate.sCountriesProductsUrls"))
    None
  }

  def sCountriesUrls = {
    val sql = s"""
        SELECT cu.url AS url, cu.promotion_url AS promotion_url, c.dirname AS dirname, l.code AS code
        FROM countries_urls AS cu
        INNER JOIN countries AS c USING (countries_id)
        INNER JOIN languages AS l USING (languages_id)
        WHERE cu.countries_id = $countries_id AND cu.languages_id = $languages_id;
      """

    select(sql) match {
      case Success(res) => Some(res.map(col => 
        (
          col.getString("url"),
          col.getString("promotion_url"),
          col.getString("dirname"),
          col.getString("code")
        )
      ).toList)
      case Failure(err) => 
        log("warn", s"Не удалось получить данные из таблицы countries_urls", true, List("parserdata.DBUpdate.sCountriesUrls"))
        None
    }
  }

  // обработка данных из списка промоакций
  def promoSQL(promo: List[PromoT]) = {

    // URL сайта страны и json промоакций для этой страны
    def sqlCountriesUrls = s"""
      SELECT url, promotion_url FROM countries_urls
      WHERE countries_id = $countries_id AND languages_id = $languages_id;
    """

    def countriesUrlsDB = select(sqlCountriesUrls) match {
      case Success(res) => Some(res.map(col => 
        (
          col.getString("url"),
          col.getString("promotion_url")
        )
      ).toList)
      case Failure(err) => 
        log("warn", s"Не удалось получить данные из таблицы countries_urls", true, List("parserdata.DBUpdate.countriesUrlsDB"))
        None
    }

    val (cUrl, cPromoUrl) = countriesUrlsDB.getOrElse(List(("", ""))).head

    // имеющиеся в базе промоакции
    def sqlSelect = s"""
        SELECT promotions_id, url, id, name, head_line, body_text, image
        FROM promotions_tmp 
        WHERE countries_id = $countries_id AND languages_id = $languages_id 
        AND id IN (${promo.map({ case (_, id, _, _, _, _) => id }).mkString(", ")});
      """

    def promoDB = select(sqlSelect) match {
      case Success(res) => Some(res.map(col =>
        col.getInt("id") ->
        (
          col.getBoolean("url"),
          col.getString("name"),
          col.getString("head_line"),
          col.getString("body_text"),
          col.getString("image"),
          col.getString("promotions_id")
        )
      ).toMap)

      case Failure(err) => 
        log("warn", s"Не удалось получить данные из таблицы promotions_tmp", true, List("parserdata.DBUpdate.promoDB"))
        None
    }

    def sqlInsertDaily(pid: String) = s"""
      INSERT INTO promotions_daily_tmp
      VALUES (DEFAULT, $pid, $date)
      ON CONFLICT (promotions_id, date_check) DO NOTHING
    """

    def sqlInsertImage(img: String, pid: String) = s"""
      INSERT INTO urls_items 
      VALUES(DEFAULT, $countries_id, $languages_id, $pid, '$cUrl${img.tail}', 'imagepromo', $parse_type, $date, 1, $dateNowInt, false)
      ON CONFLICT (url, date_add) DO NOTHING;
    """

    def sqlInsertUrl(pid: Int) = s"""
      INSERT INTO urls_items 
      VALUES(DEFAULT, $countries_id, $languages_id, $pid, '$cPromoUrl$pid', 'promotions', $parse_type, $date, 1, $dateNowInt, false)
      ON CONFLICT (url, date_add) DO NOTHING;
    """

    def sqlInsertNew(p: PromoT) = {
      val (url, id, name, head_line, body_text, image) = p
      val idnew = s"(SELECT promotions_id FROM p)"
      val sql1 = s"""
        WITH p AS (
          INSERT INTO promotions_tmp
          VALUES (DEFAULT, $countries_id, $languages_id, $url, $id, '${replaceSql(name)}', '${replaceSql(head_line)}', '${replaceSql(body_text)}', '${replaceSql(image)}')
          RETURNING promotions_id
        )
      """ 
      val sql2 = if (image != "") {
        s""", 
        pd AS (
          ${sqlInsertDaily(idnew)}
          RETURNING promotions_id
        )
        ${sqlInsertImage(image, idnew)}
        """
      } else {
        s"${sqlInsertDaily(idnew)};"
      }
      val sql3 = if (url == true) sqlInsertUrl(id) else s""
      sql1 + sql2 + sql3
    }

    def sqlUpdateOld(p: PromoT, pid: String) = {
      val (url, id, name, head_line, body_text, image) = p
      val (url1, url2) = if (url == true) (s"url, ", s"true, ") else ("", "")
      val (img1, img2) = if (image != "") (s", image", s", '$image'") else ("", "")
      s"""
        UPDATE promotions_tmp 
        SET (${url1}id, name, head_line, body_text$img1) = ($url2$id, '${replaceSql(name)}', '${replaceSql(head_line)}', '${replaceSql(body_text)}'$img2) 
        WHERE promotions_id = $pid;
      """
    }



    // сборка sql-запроса для добавления или обновления промоакций в базе
    promoDB match {
      case Some(x) if (x.nonEmpty) => 
        update(promo.map({ case p => 
          val (url, id, name, head_line, body_text, image) = p
          x.get(id) match {
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db))
              if (url == url_db && name == name_db && head_line == head_line_db && body_text == body_text_db && image == image_db) => 
                s"${sqlInsertDaily(promotions_id_db)};"
            case None => 
              sqlInsertNew(p)
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) => 
              val upold = sqlUpdateOld(p, promotions_id_db) + sqlInsertDaily(promotions_id_db)
              val insurl = if (url_db == false && url == true) sqlInsertUrl(id) else ""
              val insimg = if (image != image_db) sqlInsertImage(image, promotions_id_db) else ""
              s"$upold; $insurl $insimg"
            }
          }).mkString)
      case Some(x) => 
        update(promo.map({ case p => sqlInsertNew(p) }).mkString)
      case None => Success(-1)
    }

  }

/*
  // обработка данных из списка промоакций
  def promoSQL(promo: List[PromoT]) = {

    // ссылки на сайт страны и json промоакций для этой страны
    def sqlCountriesUrls = s"""
      SELECT url, promotion_url FROM countries_urls
      WHERE countries_id = $countries_id AND languages_id = $languages_id;
    """

    def countriesUrlsDB = select(sqlCountriesUrls) match {
      case Success(res) => Some(res.map(col => 
        (
          col.getString("url"),
          col.getString("promotion_url")
        )
      ).toList)
      case Failure(err) => 
        logdb(2, "Не удалось получить данные из таблицы countries_urls.", "DBUpdate promoSQL countriesUrlsDB", List(err))
        None
    }

    val (cUrl, cPromoUrl) = countriesUrlsDB.getOrElse(List(("", ""))).head

    // имеющиеся в базе промоакции
    def sqlSelect = s"""
        SELECT promotions_id, url, id, name, head_line, body_text, image
        FROM promotions_tmp 
        WHERE countries_id = $countries_id AND languages_id = $languages_id 
        AND id IN (${promo.map({ case (_, id, _, _, _, _) => id }).mkString(", ")});
      """

    def promoDB = select(sqlSelect) match {
      case Success(res) => Some(res.map(col =>
        col.getInt("id") ->
        (
          col.getBoolean("url"),
          col.getString("name"),
          col.getString("head_line"),
          col.getString("body_text"),
          col.getString("image"),
          col.getString("promotions_id")
        )
      ).toMap)

      case Failure(err) => 
        logdb(2, "Не удалось получить данные из таблицы promotions_tmp.", "dbupdate.scala promoSQL promoDB", List(err))
        None
    }

    // части sql-запросов для добавления или обновления промоакций в базе
    def sqlInsertDaily(pid: String) = s"""
      INSERT INTO promotions_daily_tmp
      VALUES (DEFAULT, $pid, '$date')
      ON CONFLICT (promotions_id, date_check) DO NOTHING;
    """

    def sqlInsertImage(img: String, pid: String) = s"""
      INSERT INTO urls_items 
      VALUES(DEFAULT, $countries_id, $languages_id, $pid, '$cUrl${img.tail}', 'imagepromo', '$date', 1, '$dateNow', false)
      ON CONFLICT (url, date_add) DO NOTHING;
    """

    def sqlInsertUrl(id: Int) = s"""
      INSERT INTO urls_items 
      VALUES(DEFAULT, $countries_id, $languages_id, $id, '$cPromoUrl$id', 'promotions', '$date', 1, '$dateNow', false)
      ON CONFLICT (url, date_add) DO NOTHING;
    """

    def sqlInsertNew(p: PromoT) = {
      val (url, id, name, head_line, body_text, image) = p
      val idnew = s"(SELECT promotions_id FROM inspromo)"
      s"""
        WITH inspromo AS (
          INSERT INTO promotions_tmp
          VALUES (DEFAULT, $countries_id, $languages_id, $url, $id, '${replaceSql(name)}', '${replaceSql(head_line)}', '${replaceSql(body_text)}', '${replaceSql(image)}')
          RETURNING promotions_id
        )
        ${sqlInsertDaily(idnew)}
        ${if (image != "") sqlInsertImage(image, idnew) else s""}
        ${if (url == true) sqlInsertUrl(id) else s""}
      """ 
    }

    def sqlUpdateOld(p: PromoT, pid: String) = {
      val (url, id, name, head_line, body_text, image) = p
      val (url1, url2) = if (url == true) (s"url, ", s"true, ") else ("", "")
      val (img1, img2) = if (image != "") (s", image", s", '$image'") else ("", "")
      s"""
        UPDATE promotions_tmp 
        SET (${url1}id, name, head_line, body_text$img1) = ($url2$id, '${replaceSql(name)}', '${replaceSql(head_line)}', '${replaceSql(body_text)}'$img2) 
        WHERE promotions_id = $pid;
      """
    }

    // сборка sql-запроса для добавления или обновления промоакций в базе
    promoDB match {
      case Some(x) if (x.nonEmpty) => 
        promo.map({ case p => 
          val (url, id, name, head_line, body_text, image) = p
          x.get(id) match {
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db))
              if (url == url_db && name == name_db && head_line == head_line_db && body_text == body_text_db && image == image_db) => 
                update(sqlInsertDaily(promotions_id_db))
            case None => update(sqlInsertNew(p))
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) => 
              val upold = sqlUpdateOld(p, promotions_id_db) + sqlInsertDaily(promotions_id_db)
              val insurl = if (url_db == false && url == true) sqlInsertUrl(id) else ""
              val insimg = if (image != image_db) sqlInsertImage(image, promotions_id_db) else ""
              update(s"$upold $insurl $insimg")
          }
        }).mkString
      case Some(x) => println(promo.map({ case p => sqlInsertNew(p) }).mkString); Success(0)
      case None => Success(-1)
    }

      // + проверка наличия промоакции в базе
      // если есть: при несовпадении любого из полей обновляем информацию
      // + если нет: добавляем запись
      // если не совпадает поле изображение или новая запись, добавляем в таблицу очереди на скачивание файла с promotion_id
      // + ежедневное наличие акции
  }
*/


/*


        def mkSql = for {
          p <- promo
          (url, id, name, head_line, body_text, image) = p
          sql = x.get(id) match {
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) 
              if (url == url_db && name == name_db && head_line == head_line_db && body_text == body_text_db && image == image_db) => 
                sqlInsertDaily(promotions_id_db)
            case None => sqlInsertNew(p)
            case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) => 
              val upold = sqlUpdateOld(p, promotions_id_db) + sqlInsertDaily(promotions_id_db)
              val insurl = if (url_db == false && url == true) sqlInsertUrl(id) else ""
              val insimg = if (image != image_db) sqlInsertImage(promotions_id_db, image) else ""
              s"$upold $insurl $insimg"
          }
        } yield sql

        def makeSql(p: List[PromoT], sql: List[String] = List()): String = promo match {
          case Nil => sql.reverse.mkString
          case h :: t => 
            val (url, id, name, head_line, body_text, image) = h
            x.get(id) match {
              case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) if (url == url_db && name == name_db && head_line == head_line_db && body_text == body_text_db && image == image_db) => 
                makeSql(t, sqlInsertDaily(promotions_id_db) :: sql)
              case None => makeSql(t, sqlInsertNew(h) :: sql)
              case Some((url_db, name_db, head_line_db, body_text_db, image_db, promotions_id_db)) => 
                val upold = sqlUpdateOld(h) + sqlInsertDaily(promotions_id_db)
                val insurl = if (url_db == false && url == true) sqlInsertUrl(id) else ""
                val insimg = if (image != image_db) sqlInsertImage(promotions_id_db, image) else ""
                makeSql(t, s"$upold $insurl $insimg" :: sql)
          }
        }
        mkSql.mkString
*/


/*

	def brandsSQL(brands: List[String]) = {
    select(s"SELECT name FROM brands_tmp WHERE countries_id = $countries_id AND languages_id = $languages_id;") match {
      case Success(res) => 
        val brandsDB = res.map(col => col.getString("name")).toList
        brands.partition(brandsDB.contains(_))._2.map(x => s"INSERT INTO brands_tmp VALUES (DEFAULT, $countries_id, $languages_id, '$x');").mkString
      case Failure(err) => 
        log("warn", "Не удалось получить список брендов для страны $countries_id и языка $languages_id.", true, List(err))
        ""
    }
	}

  // обновление данных в таблице categories_tmp
  def categoriesSQL(categories: List[CategoryT]) = {

    // получение данных из таблицы categories_tmp
    def categoriesSelect = {
      val sql = s"""
        SELECT id, name, search_words, categories_id 
        FROM categories_tmp 
        WHERE countries_id = $countries_id AND languages_id = $languages_id"""
      select(sql) match {
        case Success(res) => Some(res.map(col =>
          col.getInt("id") ->
          (
            col.getString("name"),
            col.getString("search_words"),
            col.getInt("categories_id")
          )
        ).toMap)
        case Failure(err) => 
          log("warn", "Не удалось получить список категорий для страны $countries_id и языка $languages_id.", true, List(err))
          None
      }
    }

    categoriesSelect match {
      case Some(categoriesSelect) => 
  
    // SQL-код для добавления данных в таблицу categories_tmp
        def categoriesUpdate(category: List[CategoryT], sql: List[String] = List()): String = category match {
          case Nil => sql.mkString
          case (new_id, new_name, new_search_words, _) :: t => categoriesSelect.get(new_id) match {
            case Some((name, search_words, _)) if (name == new_name && search_words == new_search_words) => categoriesUpdate(t, sql)
            case None => 
              val sqlInsert = s"""
              INSERT INTO categories_tmp 
              VALUES (DEFAULT, $countries_id, $languages_id, $new_id, '${replaceSql(new_name)}', '${replaceSql(new_search_words)}');"""
              categoriesUpdate(t, sqlInsert :: sql)
            case Some((_, _, categories_id)) => 
              val sqlUpdate = s"""
              UPDATE categories_tmp 
              SET (name, search_words) = ('${replaceSql(new_name)}', '${replaceSql(new_search_words)}') 
              WHERE categories_id = $categories_id;"""
              categoriesUpdate(t, sqlUpdate :: sql)
          }
        }

        Some(categoriesUpdate(categories))
      case None => None
    }
  }

  def categoriesParentSQL(categories: List[CategoryT]) = {

    def categoriesSelect = {
      val sql = s"""
        SELECT c.id AS id, cp.parent_id AS parent_id
        FROM categories_parent_tmp as cp
        INNER JOIN categories_tmp AS c USING (categories_id)
        WHERE c.countries_id = $countries_id AND c.languages_id = $languages_id;
      """
      select(sql) match {
        case Success(res) => Some(res.map(col =>
          (
          col.getInt("id"),
          col.getInt("parent_id")
          )
        ).toList)
        case Failure(err) => 
          log("warn", "Не удалось получить данные из базы: categories_parent_tmp, categories_tmp.", true, List(err))
          None
      }
    }

    def categoriesAllSelect = {
      val sql = s"SELECT categories_id, id FROM categories_tmp WHERE countries_id = $countries_id AND languages_id = $languages_id;"
      select(sql) match {
        case Success(res) => Some(res.map(col =>
          col.getInt("categories_id") -> col.getInt("id")
        ).toMap)
        case Failure(err) => 
          log("warn", "Не удалось получить данные из базы: categories_tmp.", true, List(err))
          None
      }
    }

    categoriesSelect match {
      case Some(categoriesSelect) => categoriesAllSelect match {
        case Some(categoriesAllSelect) => 

          val categoriesParentSelect = categoriesSelect.map({case (id, pid) => (id, categoriesAllSelect.getOrElse(pid, 0))})
          val categoriesAllId = categoriesAllSelect.map({case (x, y) => (y, x)})

          def categoriesParentUpdate(categories: List[CategoryT], sql: List[String] = List()): String = categories match {
            case Nil => sql.mkString
            }.mkString
            case (new_id, _, _, new_parent) :: t if (new_parent != 0)=> categoriesParentSelect.contains((new_id, new_parent)) match {
              case true => categoriesParentUpdate(t, sql)
              case false => 
                  val sqlInsert = s"""
                    INSERT INTO categories_parent_tmp 
                    VALUES (DEFAULT, ${categoriesAllId(new_id)}, ${categoriesAllId(new_parent)});"""
                  categoriesParentUpdate(t, sqlInsert :: sql)
            case _ => categoriesParentUpdate(t, sql)
            }
          }

        case None => None
      }
      case None => None
    }
  }

  def productsSQL(productsCards: List: [ProductT]): String = {

    val productsSelect = select(s"SELECT profile_number FROM products_tmp;") match {
      case Success(res) => res.map(col => col.getString("profile_number")).toList
      case Failure(err) => 
        log("warn", "Не удалось получить данные из базы: products_tmp.", true, List(err))
        List("None")
    }

    def productsUpdate(products: List: [ProductT], sql: List[String] = List()): String = products match {
      case Nil => sql.mkString
      case ((new_profile_number, _*)) => productsSelect.contains(new_profile_number) match {
        case true => productsUpdate(t, sql)
        case false => 
          val sqlInsert = s"INSERT INTO categories_tmp VALUES (DEFAULT, '$new_profile_number');"
          productsUpdate(t, sqlInsert :: sql)
      }
    }

    productsSelect match {
      case "None" :: t => 
        log("WARN", "Пропущена обработка profile_number продукта. Нет данных из таблицы products_tmp.", true)
        ""
      case _ => productsUpdate(productsCards)
    }

  }


  def measuresVariantsDB = select(s"SELECT name FROM measures_variants;") match {
    case Success(res) => res.map(col => col.getString("name")).toList
    case Failure(err) => log("warn", "Не удалось получить список мер измерения.", true, List(err))
      List()
  }


  def productsSQL(products: List[ProductsT]) = {
    
  }

//  def productsCardsSQL(products: List[ProductT]) = {


    
    // val measuresVariants = products.map({ case (pn, id, (m1, m2), pc, ed, cr) => List(m1, m2) }).flatten.distinct
    // val measuresVariantsSQL = if (measuresVariantsDB.nonEmpty) measuresVariants.partition(measuresVariantsDB.contains(_))._2.map(x => 
//      s"INSERT INTO measures_variants VALUES (DEFAULT, 0, 0, 1, '$x');").mkString else ""

    

//    measuresVariantsSQL
//  }

*/
}