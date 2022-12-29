package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime }
import DateTime.dateNow
import LogUtil.logdb
import DbConn.select

object Urls {

  def sUrls(no_iteration: Boolean = true) = {

    def where = if (no_iteration == true) s"WHERE no_iteration = true" else ""
//    def where = if (no_iteration == true) s"WHERE no_iteration = true" else s"WHERE countries_id = 1"

    val sql = s"""
      SELECT c.dirname, l.code, u.url_type, u.parse_type, u.urls_id, u.countries_id, u.languages_id, u.id, u.url, u.no_iteration FROM urls AS u
        INNER JOIN countries AS c USING (countries_id)
        INNER JOIN languages AS l USING (languages_id) 
        $where ORDER BY url_type ASC;
  	"""

  	select(sql) match {
  		case Success(res) => Some(res.map(col => {
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
          s"",
          col.getBoolean("no_iteration")
        )
  		}).toList)
  		case Failure(err) => 
        logdb(2, "Не удалось получить данные из таблицы urls.", "urls.scala sUrls", List(err))
  			None
  	}
  }

}
