package com.avonsystem.utilities.dbschema

import java.sql.ResultSet
import scala.util.{Try,Success,Failure}

import com.avonsystem.utilities.{ LogUtil, DbConn, DateTime }
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

TABLE countries_urls (
  countries_urls_id smallserial,
  countries_id smallint,
  language varchar(5),
  alternative_language boolean,
  url varchar(255),
  img_url varchar(255),
  product_url varchar(255),
  promotion_url varchar(255),
  PRIMARY KEY ("countries_urls_id")
);

TABLE urls (
	urls_id serial,
	countries_urls_id smallint,
	id int,
	url varchar(255) UNIQUE,
	url_type varchar(255),
	PRIMARY KEY ("urls_id")
);
*/

object Urls {
  def sUrls = {
    select(s"SELECT urls_id, urls.url, url_type, id, name_en, language, countries_urls_id FROM urls INNER JOIN countries_urls USING (countries_urls_id) INNER JOIN countries USING (countries_id);") match {
      case Success(urls) => urls.map(col => {
        (
          col.getInt("urls_id"),
          col.getString("url"),
          col.getString("url_type"),
          col.getInt("id"),
          col.getString("name_en").toLowerCase.replaceAll(" ", "_"),
          col.getString("language"),
          col.getShort("countries_urls_id")
        )
      }).toList.map({ case (uid, u, ut, id, c, l, cuid) => (uid, u, ut, id, c, l, cuid, DateTime.dateNow.toString) })
      case Failure(err) => 
        log("warn", "Не удалось получить список основных страниц сайтов.", true, List(err))
        List()
    }
  }
}