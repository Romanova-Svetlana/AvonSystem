package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import com.avonsystem.utilities.{DateTime, LogUtil, Setting, FilesUtil}
import FilesUtil.{createDir, openFile}
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
    // на этом месте будет скачивание файлов продуктов, промоакций, изображений
  }

  // обработка данных за определенную дату
  def thisDayParse(date: java.time.LocalDate) = {
    val datePath = Setting.archivePath + date + "/"

    for (i <- Urls.sUrls) {
      val (urls_id, url, url_type, id, country, language, country_id, udate) = i

      openFile(s"$datePath$country/$language/$url_type/$id.json") match {
        case Success(data) => toDB(data)
        case Failure(err) =>
          openFile(s"$datePath$country/$url_type/$id.json") match {
            case Success(data) => toDB(data)
            case Failure(err) =>
              log("WARN", s"Не удалось получить данные за дату $date, $country $language $url_type $id.json", true, List(err))
          }
      }

      def toDB(data: List[String]) = {
        println(s"$date $country $language $url_type $id $country_id")
        println(data.head)
      }
    }
    // на этом месте будет обработка файлов main и promo за определенную дату
    // необходимо: открыть файл, разобрать его через парсер, положить в базу
  }

}