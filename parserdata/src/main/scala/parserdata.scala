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

/*
  def promotions = {

    def toDB(data: List[String]) = new AddToDB("promotions").add(data.head) match {
        case Success(msg) => log("info", s"OK")
        case Failure(err) => log("warn", s"Не удалось распарсить данные", true, List(err))
    }

    openFile("/home/sw/projects/avonsystemdata/archive/2022-01-01/russia/promotions/10960.json") match {
        case Success(data) => toDB(data); log("info", s"10960")
        case Failure(err) => log("warn", s"Не удалось открыть файл 10960", true, List(err))
    }
    openFile("/home/sw/projects/avonsystemdata/archive/2022-01-01/russia/promotions/10969.json") match {
        case Success(data) => toDB(data); log("info", s"10969")
        case Failure(err) => log("warn", s"Не удалось открыть файл 10969", true, List(err))
    }
    openFile("/home/sw/projects/avonsystemdata/archive/2022-01-01/russia/promotions/10974.json") match {
        case Success(data) => toDB(data); log("info", s"10974")
        case Failure(err) => log("warn", s"Не удалось открыть файл 10974", true, List(err))
    }
    openFile("/home/sw/projects/avonsystemdata/archive/getdetails.json") match {
        case Success(data) => toDB(data); log("info", s"getdetails")
        case Failure(err) => log("warn", s"Не удалось открыть файл getdetails", true, List(err))
    }
  }
*/

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
              log("WARN", s"Не удалось считать данные из файла за дату $date, $country $language $url_type $id", true, List(err))
          }
      }

      def toDB(data: List[String]) = new AddToDB(url_type).add(data.head) match {
        case Success(msg) => msg match {
          case true => log("info", s"Парсинг данных файла $datePath$country/$language/$url_type/$id.json прошел успешно.")
          case false => log("warn", s"Неизвестный формат данных файла $datePath$country/$language/$url_type/$id.json", true)
        }
        case Failure(err) => log("warn", s"Не удалось распарсить данные из файла $datePath$country/$language/$url_type/$id.json", true, List(err))
      }
    }
  }

}