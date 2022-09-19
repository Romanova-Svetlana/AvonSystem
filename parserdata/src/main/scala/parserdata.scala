package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import com.avonsystem.utilities.{DateTime, LogUtil, Setting, FilesUtil}
import FilesUtil.createDir
import LogUtil.log
import com.avonsystem.utilities.dbschema.{Countries, Url}

object ParserData extends App {

  args match {
    case Array(date, _*) => 
      DateTime.dateParse(date) match { 
        case Success(d) => // Date received successfully. Дата получена успешно.
          thisDayParse(d)
        case Failure(err) => 
          log("ERROR", "Invalid date format. Enter the date in YYYY-MM-DD format. Неверный формат даты. Введите дату в формате ГГГГ-ММ-ДД.", true, List(err))
      }     
    case _ => // Daily data collection. Ежедневный сбор данных.
      Countries.namesDir match {
        case c if (c.nonEmpty) => 
          log("info", "Data collection and saving to disk files. Сбор данных и сохранение в файлы на диске.", true)
          dailyParse(c)
        case _ => 
          log("ERROR", "Error getting list of countries. The program has been terminated. Ошибка получения списка стран. Работа программы прекращена.", true)
      }
    }

  // Daily data collection. Ежедневный сбор данных.
  def dailyParse(countries: List[String]) = {
    val dateStart = DateTime.dateNow
    val datePath = Setting.archivePath + dateStart + "/"

    for (cd <- countries) {
      createDir(datePath + cd + "/main/") 
      createDir(datePath + cd + "/promo/")
      createDir(datePath + cd + "/promotions/")
      createDir(datePath + cd + "/products/")
    }

    //saveUrltoFile.start(urlList)
    //saveUrltoFile.start(UrlTmp.sUrl)
  }

  // обработка данных за определенную дату
  def thisDayParse(date: java.time.LocalDate) = {
    val datePath = Setting.archivePath + date + "/"
  }

}