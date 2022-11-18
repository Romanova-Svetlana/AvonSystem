package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime, TextFormat }
import LogUtil.log
import DbConn.select

class DBUpdate(countries_id: Short, languages_id: Short) extends ParseT with TextFormat {

	def brandsSQL(brands: List[String]) = {
    select(s"SELECT name FROM brands_tmp WHERE countries_id = $countries_id AND languages_id = $languages_id;") match {
      case Success(res) => 
        val brandsDB = res.map(col => col.getString("name")).toList
        brands.filter(!brandsDB.contains(_)).map(x => s"INSERT INTO brands_tmp VALUES (DEFAULT, $countries_id, $languages_id, '$x');").mkString(" ")
      case Failure(err) => 
        log("warn", "Не удалось получить список брендов для страны $countries_id и языка $languages_id.", true, List(err))
        ""
    }
	}

  def categoriesSQL(categories: List[CategoryT]) = {

    val sqlSelect = s"""
      SELECT c.id AS id, (SELECT id FROM categories_tmp WHERE categories_tmp.categories_id = p.parent_id) AS parent_id, 
      c.name AS name, c.search_words AS search_words, 
      c.categories_id AS categories_id, p.categories_parent_id AS categories_parent_id
      FROM categories_tmp AS c
      LEFT JOIN categories_parent_tmp AS p USING (categories_id) 
      WHERE countries_id = $countries_id AND languages_id = $languages_id;"""

    val catSel: Map[(Int, Int), (String, String, Int)] = select(sqlSelect) match {
      case Success(res) => res.map(col => 
        (  
          col.getInt("Id"), 
          col.getInt("parent_id")
        )
          -> 
        (
          col.getString("name"),
          col.getString("search_words"),
          col.getInt("categories_id"), 
        )
      ).toMap
      case Failure(err) => 
        log("warn", "Не удалось получить список категорий для страны $countries_id и языка $languages_id.", true, List(err))
        Map()
    }

    def sqlUpdate(cat: List[CategoryT], sql: List[String] = List()): String = cat match {
      case Nil => sql.mkString(" ")
      case (id, name, search_words, parent_id) :: t => catSel.get(id, parent_id) match {
        case Some((n, sw, cid)) => parent_id match {
          case x if (n == name && sw == search_words) => sqlUpdate(t, sql)
          case _ => sqlUpdate(t, s"UPDATE categories_tmp SET (name, search_words) = ('$name', '$search_words') WHERE categories_id = $cid;" :: sql)
        }
        case None => catSel.keys.map({ case (x, y) => x }).find(_ == id) match {
          case Some(x) => 
            val updC = s"""
              UPDATE categories_tmp SET (name, search_words) = ('$name', '$search_words') 
                WHERE id = $id AND countries_id = $countries_id AND languages_id = $languages_id;"""
            val insP = s"""
              INSERT INTO categories_parent_tmp 
                VALUES (DEFAULT, 
                (SELECT categories_id FROM categories_tmp WHERE id = $id AND countries_id = $countries_id AND languages_id = $languages_id),
                (SELECT categories_id FROM categories_tmp WHERE id = $parent_id AND countries_id = $countries_id AND languages_id = $languages_id))"""
            sqlUpdate(t, (if (parent_id != 0) s"$updC $insP;" else s"$updC;") :: sql)
          case None => 
            val insC = s"INSERT INTO categories_tmp VALUES (DEFAULT, $countries_id, $languages_id, $id, '$name', '$search_words')"
            val insCP = s"""
              WITH catid AS (
                $insC
                RETURNING categories_id
              )
              INSERT INTO categories_parent_tmp 
                VALUES (DEFAULT, (SELECT categories_id FROM catid), 
                (SELECT categories_id FROM categories_tmp WHERE id = $parent_id AND countries_id = $countries_id AND languages_id = $languages_id))"""
            sqlUpdate(t, (if (parent_id != 0) s"$insCP;" else s"$insC;") :: sql)
        }
      }
    }

    sqlUpdate(categories)
  }


}