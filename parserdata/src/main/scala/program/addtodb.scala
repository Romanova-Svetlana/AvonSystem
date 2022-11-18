package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import com.avonsystem.utilities.{LogUtil, DbConn}
import LogUtil.log
import DbConn.update

class AddToDB(url_type: String, countries_id: Short, languages_id: Short) {

	def add(d: String) = try {
  		val data = Json.parserJson(d)
  		val dp = new DataProcessing(data)
      val dbu = new DBUpdate(countries_id, languages_id)

  		url_type match {
  			case "main" => 
//            ${dbu.brandsSQL(dp.brands())} 
          val sql = s"""
            ${dbu.categoriesSQL(dp.categoriesList())}
          """
          dp.productsCard
          dp.productsPromotions
          dp.productsVariants
          dp.productsCategories
//          println(sql)
          update(sql)
//          Success(0)
        case "promo" =>
          dp.promo
          Success(0)
        case "products" => 
          dp.product
          dp.productV
          Success(0)
        case "promotions" => 
          dp.promotions
          Success(0)
        case _ => 
          Success(-1)
  		}
    } catch {
      case err : Throwable => Failure(err)
    }



    // на этом месте будет обработка файлов main и promo за определенную дату
    // необходимо: открыть файл, разобрать его через парсер, положить в базу
	
}