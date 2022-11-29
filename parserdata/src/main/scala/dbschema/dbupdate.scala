package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime, TextFormat }
import LogUtil.log
import DbConn.select

// Update in the database received by parsing data. Обновление в базе полученных парсингом данных.
class DBUpdate(countries_id: Short, languages_id: Short) extends ParseT with TextFormat {

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
    val categoriesSelect: Map[Int, (String, String, Int)] = {
      val sql = s"""SELECT id, name, search_words, categories_id FROM categories_tmp WHERE countries_id = $countries_id and languages_id = $languages_id"""
      select(sql) match {
        case Success(res) => res.map(col =>
          col.getInt("id") ->
          (
            col.getString("name"),
            col.getString("search_words"),
            col.getInt("categories_id")
          )
        ).toMap
        case Failure(err) => 
          log("warn", "Не удалось получить список категорий для страны $countries_id и языка $languages_id.", true, List(err))
          Map(0 -> ("", "", 0))
      }
    }

    // SQL-код для добавления данных в таблицу categories_tmp
    def categoriesUpdate(category: List[CategoryT], sql: List[String] = List()): String = category match {
      case Nil => sql.mkString
      case (new_id, new_name, new_search_words, _) :: t => categoriesSelect.get(new_id) match {
        case Some((name, search_words, _)) if (name == new_name && search_words == new_search_words) => categoriesUpdate(t, sql)
        case Some((_, _, categories_id)) => 
          val sqlUpdate = s"""
          UPDATE categories_tmp 
          SET (name, search_words) = ('${replaceSql(new_name)}', '${replaceSql(new_search_words)}') 
          WHERE categories_id = $categories_id;"""
          categoriesUpdate(t, sqlUpdate :: sql)
        case None => 
          val sqlInsert = s"""
          INSERT INTO categories_tmp 
          VALUES (DEFAULT, $countries_id, $languages_id, $new_id, '${replaceSql(new_name)}', '${replaceSql(new_search_words)}');"""
          categoriesUpdate(t, sqlInsert :: sql)
      }
    }

    categoriesSelect.get(0) match {
      case None => categoriesUpdate(categories)
      case Some(x) => ""
    }
  }

  def categoriesParentSQL(categories: List[CategoryT]) = {

    val categoriesSelect = {
      val sql = s"""
        SELECT c.id AS id, cp.parent_id AS parent_id
        FROM categories_parent_tmp as cp
        INNER JOIN categories_tmp AS c USING (categories_id)
        WHERE c.countries_id = $countries_id AND c.languages_id = $languages_id;
      """
      select(sql) match {
        case Success(res) => res.map(col =>
          (
          col.getInt("id"),
          col.getInt("parent_id")
          )
        ).toList
        case Failure(err) => 
          log("warn", "Не удалось получить данные из базы: categories_parent_tmp, categories_tmp.", true, List(err))
          List((0, 0))
      }
    }

    val categoriesAllSelect = {
      val sql = s"SELECT categories_id, id FROM categories_tmp WHERE countries_id = $countries_id AND languages_id = $languages_id;"
      select(sql) match {
        case Success(res) => res.map(col =>
          col.getInt("categories_id") -> col.getInt("id")
        ).toMap
        case Failure(err) => 
          log("warn", "Не удалось получить данные из базы: categories_tmp.", true, List(err))
          Map(0 -> 0)
      }
    }

    val categoriesParentSelect = categoriesSelect.map({case (id, pid) => (id, categoriesAllSelect.getOrElse(pid, 0))})
    val categoriesAllId = categoriesAllSelect.map({case (x, y) => (y, x)})

    def categoriesParentUpdate(categories: List[CategoryT], sql: List[String] = List()): String = categories match {
      case Nil => sql.mkString
      case (new_id, _, _, new_parent) :: t => categoriesParentSelect.contains((new_id, new_parent)) match {
        case true => categoriesParentUpdate(t, sql)
        case false => 
          if (new_parent != 0) {
            val sqlInsert = s"""
              INSERT INTO categories_parent_tmp 
              VALUES (DEFAULT, ${categoriesAllId(new_id)}, ${categoriesAllId(new_parent)});"""
            categoriesParentUpdate(t, sqlInsert :: sql)
          } else categoriesParentUpdate(t, sql)
      }
    }

    categoriesSelect match {
      case ((0, 0)) :: t => 
        log("WARN", "Пропущена обработка родительских категорий. Нет данных из таблиц categories_parent_tmp и categories_tmp.", true)
        ""
      case _ => categoriesAllSelect.get(0) match {
        case None => categoriesParentUpdate(categories)
        case Some(_) => 
          log("WARN", "Пропущена обработка родительских категорий. Нет данных из таблицы categories_tmp.", true)
          ""
      }

    }

  }



/*

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