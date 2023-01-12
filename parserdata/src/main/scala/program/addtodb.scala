package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import com.avonsystem.utilities.{LogUtil, DbConn}
import LogUtil.log
import DbConn.update

class AddToDB(url_type: String, parse_type: Short, countries_id: Short, languages_id: Short, date: Int) {

	def add(d: String) = try {
  		val dp = new DataProcessing(Json.parserJson(d))
      val dbu = new DBUpdate(parse_type, countries_id, languages_id, date)

  		url_type match {
  			case "main" => 




/*
          val categories = dp.categoriesList()
//            dbu.categoriesSQL(categories)
// dbu.categoriesParentSQL(categories)
          val productsCards = dp.productsCards

          val sqlCategories = dbu.categoriesSQL(categories) match {
            case Some(categoriesQuery) if (categoriesQuery != "") =>
              update(categoriesQuery)
              dbu.categoriesParentSQL(categories) match {
                case Some(categoriesParentQuery) => categoriesQuery + categoriesParentQuery
                case None => 
              }
            case Some(_) => 
            case None => 
          }

//          val sql = dbu.productsSQL(productsCards)


//            ${dbu.productsSQL(dp.productsCards, dp.productsPromotions, dp.productsVariants, dp.productsCategories)}
          
//          dp.productsPromotions
//          dp.productsVariants
//          dp.productsCategories
//          println(sql)
//          println(dbu.categoriesParentSQL(categories))
          println(sql)
//          update(sql)
*/
          Success(0)
        case "promo" =>
          dp.promo match {
            case Nil => Success(-1)
            case p => 
              dbu.promoSQL(p)
          }

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