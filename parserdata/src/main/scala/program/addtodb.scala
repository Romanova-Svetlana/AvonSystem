package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import com.avonsystem.utilities.{LogUtil}
import LogUtil.log


class AddToDB(url_type: String) {

	def add(d: String) = try {
  		val data = Json.parserJson(d)
  		val dp = new DataProcessing(data)

  		url_type match {
  			case "main" => 
          dp.brands()
          dp.categoriesList()
          dp.productsCard
          dp.productsPromotions
          dp.productsVariants
          dp.productsCategories
          Success("true")
        case "promo" =>
          dp.promo
          Success("true")
        case "products" => 
          dp.product
          dp.productV
          Success("true")
        case _ => 
          Success("false")
  		}
    } catch {
      case err : Throwable => Failure(err)
    }


    // на этом месте будет обработка файлов main и promo за определенную дату
    // необходимо: открыть файл, разобрать его через парсер, положить в базу
	
}