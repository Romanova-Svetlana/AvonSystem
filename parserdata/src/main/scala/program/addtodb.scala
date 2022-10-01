package com.avonsystem.parserdata

import com.avonsystem.utilities.{LogUtil}
import LogUtil.log


class AddToDB(url_type: String) {

	def add(d: String) = {
		val data = Json.parserJson(d)
		val dp = new DataProcessing(data)

		url_type match {
			case "main" => 
        println(dp.brands)
//        dp.categories
//        dp.categoriesList()
      case _ => log("warn", "Неизвестный формат данных", true)
		}

	}


    // на этом месте будет обработка файлов main и promo за определенную дату
    // необходимо: открыть файл, разобрать его через парсер, положить в базу
	
}