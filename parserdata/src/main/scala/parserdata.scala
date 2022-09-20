package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import com.avonsystem.utilities.{DateTime, LogUtil, Setting, FilesUtil}
import FilesUtil.createDir
import LogUtil.log
import com.avonsystem.utilities.dbschema.{Countries, Urls}

object ParserData extends App {

  args match {
    case Array(date, _*) => 
      DateTime.dateParse(date) match { 
        case Success(d) => // Date received successfully. Дата получена успешно.
          thisDayParse(d)
        case Failure(err) => 
          log("ERROR", "Неверный формат даты. Введите дату в формате ГГГГ-ММ-ДД.", true, List(err))
      }     
    case _ => // Daily data collection. Ежедневный сбор данных.
      Countries.namesDir match {
        case Nil => 
          log("ERROR", "Ошибка получения списка стран. Работа программы прекращена.", true)
        case c => 
          log("info", "Сбор данных и сохранение в файлы на диске.", true)
          dailyParse(c)
      }
    }

  // Daily data collection. Ежедневный сбор данных.
  def dailyParse(countries: List[(String, String)]) = {
    val dateStart = DateTime.dateNow
    val datePath = Setting.archivePath + dateStart + "/"

    for (cd <- countries) {
      val (name, lang) = cd
      val dp = s"$datePath$name/$lang"
      createDir(dp + "/main/") 
      createDir(dp + "/promo/")
      createDir(dp + "/promotions/")
      createDir(dp + "/products/")
    }

    new SaveDataFromUrl(dateStart).openUrlSaveData(Urls.sUrls)

  }

  // обработка данных за определенную дату
  def thisDayParse(date: java.time.LocalDate) = {
    val datePath = Setting.archivePath + date + "/"
  }

}