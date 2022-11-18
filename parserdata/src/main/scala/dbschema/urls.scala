package com.avonsystem.parserdata

import java.sql.ResultSet
import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime }
import LogUtil.log
import DbConn.select

object Urls {

  def sUrls = {
    val sql = s"""
      SELECT dirname, languages.code, url_type, urls_id, countries_urls_id, countries_id, languages_id, id, urls.url FROM urls 
        INNER JOIN countries_urls USING (countries_urls_id) 
        INNER JOIN countries USING (countries_id) 
        INNER JOIN languages USING (languages_id);
  	"""
  	select(sql) match {
  		case Success(res) => res.map(col => {
        (
          col.getString("dirname"),
          col.getString("code"),
          col.getString("url_type"),
          col.getInt("urls_id"),
          col.getShort("countries_urls_id"),
          col.getShort("countries_id"),
          col.getShort("languages_id"),
          col.getInt("id"),
          col.getString("url"),
          DateTime.dateNow,
          1.toShort,
          DateTime.dateNow,
          true
        )
  		}).toList
  		case Failure(err) => 
  			log("warn", "Не удалось получить список основных url для парсинга.", true, List(err))
  			List()
  	}
  }
}
