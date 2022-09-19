package com.avonsystem.utilities.dbschema

import java.sql.ResultSet
import scala.util.{Try,Success,Failure}
import com.avonsystem.utilities.{ LogUtil, DbConn }
import LogUtil.log
import DbConn.select

/*
TABLE countries ( -- страны
  countries_id smallserial,
  name varchar(255),
  name_en varchar(255),
  code varchar(5), -- код страны
  PRIMARY KEY ("countries_id")
);
*/

object Countries {
  def namesDir = { // Names of directories. Названия директорий.
    select(s"SELECT name_en FROM country") match {
      case Success(s) => s.map(col => {
        col.getString("name_en").toLowerCase.replaceAll(" ", "_")
      }).toList
      case Failure(err) => 
        log("warn", "Failed to get list of countries. Не удалось получить список стран.", true, List(err))
        List()
    }
  }
}