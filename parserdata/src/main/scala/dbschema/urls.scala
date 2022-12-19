package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime }
import DateTime.dateNow
import LogUtil.logdb
import DbConn.select

object Urls {

  def sUrls = {
    val sql = s"""
      SELECT c.dirname, l.code, u.url_type, u.parse_type, u.urls_id, u.countries_id, u.languages_id, u.id, u.url, u.no_iteration FROM urls AS u
        INNER JOIN countries AS c USING (countries_id)
        INNER JOIN languages AS l USING (languages_id);
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
          dateNow,
          1.toShort,
          dateNow,
          col.getBoolean("no_iteration")
        )
  		}).toList)
  		case Failure(err) => 
        logdb(2, "Не удалось получить данные из таблицы urls.", "urls.scala sUrls", List(err))
  			None
  	}
  }

}
