package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime }
import DateTime.{dateNow, dateToInt, intToDate}
import LogUtil.log
import DbConn.select

object Urls {

  def sUrls(no_iteration: Boolean = true) = {

    def where = if (no_iteration == true) s"WHERE no_iteration = true" else ""
//    def where = if (no_iteration == true) s"WHERE no_iteration = true" else s"WHERE countries_id = 1"

    val sql = s"""
      SELECT c.dirname, l.code, u.url_type, u.parse_type, u.urls_id, u.countries_id, u.languages_id, u.id, u.url, u.no_iteration FROM urls AS u
        LEFT JOIN countries AS c USING (countries_id)
        LEFT JOIN languages AS l USING (languages_id) 
        $where ORDER BY url_type ASC;
  	"""

  	select(sql) match {
  		case Success(res) => res.map(col => {
        (
          col.getString("dirname"),
          col.getString("code"),
          col.getString("url_type"),
          col.getShort("parse_type"),
          col.getInt("urls_id"),
          col.getShort("countries_id"),
          col.getShort("languages_id"),
          col.getInt("id"),
          col.getString("url"),
          dateNow.toString,
          1.toShort,
          0,
          col.getBoolean("no_iteration")
        )
  		}).toList
  		case Failure(err) => 
        log("warn", s"Не удалось получить данные из таблицы urls", true, List("parserdata.Urls.sUrls", err))
  			List()
  	}
  }

  def sUrlsItems = {

    val sql = s"""
      SELECT c.dirname, l.code, u.url_type, u.parse_type, u.urls_items_id, u.countries_id, u.languages_id, u.id, u.url, u.date_add, u.iteration, u.date_iteration, u.no_iteration 
        FROM urls_items AS u
        LEFT JOIN countries AS c USING (countries_id)
        LEFT JOIN languages AS l USING (languages_id) 
        WHERE url_type = 'promotions' AND iteration > 0 AND date_iteration <= ${dateToInt(dateNow.toString)}
        ORDER BY iteration ASC, date_add DESC;
    """

    select(sql) match {
      case Success(res) => res.map(col => {
        (
          col.getString("dirname"),
          col.getString("code"),
          col.getString("url_type"),
          col.getShort("parse_type"),
          col.getInt("urls_items_id"),
          col.getShort("countries_id"),
          col.getShort("languages_id"),
          col.getInt("id"),
          col.getString("url"),
          intToDate(col.getInt("date_add")),
          col.getShort("iteration"),
          col.getInt("date_iteration"),
          col.getBoolean("no_iteration")
        )
      }).toList
      case Failure(err) => 
        log("warn", s"Не удалось получить данные из таблицы urls_items", true, List("parserdata.Urls.sUrlsItems", err))
        List()
    }
  }

}
