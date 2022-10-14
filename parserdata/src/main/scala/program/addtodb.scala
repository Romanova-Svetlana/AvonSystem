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
          dp.brands
          dp.categoriesList()
          dp.productsList
          dp.productsCategories
          dp.productsVariants.flatten.flatten
          dp.productsPromotions()
          Success("Парсинг данных прошел успешно")
        case _ => 
          log("warn", "Неизвестный формат данных", true)
          Success("Не удалось распарсить данные")
  		}
    } catch {
      case err : Throwable => Failure(err)
    }


    // на этом месте будет обработка файлов main и promo за определенную дату
    // необходимо: открыть файл, разобрать его через парсер, положить в базу
	
}