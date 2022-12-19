package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import Urls.{sUrls}
//import UrlsT
import com.avonsystem.utilities.{DateTime, LogUtil, Setting, FilesUtil}
import FilesUtil.{createDir, openFile}
import LogUtil.{logdb, log}
import Setting.{archivePath, imagesPath}

object ParserData extends App with UrlsT {

  args match {
    case Array(date, _*) => 
      DateTime.dateParse(date) match { 
        case Success(d) => // Date received successfully. Дата получена успешно.
          thisDayParse(d)
        case Failure(err) => 
          logdb(3, s"Неверный формат даты. Введите дату в формате ГГГГ-ММ-ДД.", "parserdata.scala", List(err))
      }     
    case _ => // Daily data collection. Ежедневный сбор данных.
      sUrls match {
        case Some(x) if (x.nonEmpty) => 
          logdb(1, s"Сбор данных и сохранение в файлы на диске.", "parserdata.scala")
          dailyParse(x)
        case None => 
          logdb(3, s"Ошибка получения списка url. Работа программы прекращена.", "parserdata.scala")
        case _ => 
          logdb(2, s"В списке url отсутствуют данные.", "parserdata.scala")
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
  def dailyParse(urls: List[UrlsT]) = {
    val dateStart = DateTime.dateNow
    val datePath = archivePath + dateStart + "/"
    val countries = urls.map({case (dn, lang, _, _, _, _, _, _, _, _, _, _, _) => (dn, lang) }).distinct

    for (cd <- countries) {
      val (dn, lang) = cd
      val dp = s"$datePath$dn/$lang"
      createDir(dp + "/main/") 
      createDir(dp + "/promo/")
      createDir(dp + "/promotions/")
      createDir(dp + "/products/")
      createDir(s"$imagesPath$dn/$lang/promotions/")
    }

    new SaveDataFromUrl(dateStart).openUrlSaveData(urls)
    // на этом месте будет скачивание файлов продуктов, промоакций, изображений
  }

  // обработка данных за определенную дату
  def thisDayParse(date: java.time.LocalDate) = {
    val datePath = archivePath + date + "/"

    sUrls match {
      case Some(x) if (x.nonEmpty) => 
        for (i <- x) {
          val (dirname, lang, url_type, parse_type, urls_id, countries_id, languages_id, id, url, date_add, iteration, date_iteration, no_iteration) = i
          val file = s"$datePath$dirname/$lang/$url_type/$id.json"

          openFile(file) match {
            case Success(data) => toDB(data)
            case Failure(err) =>
              openFile(s"$datePath$dirname/$url_type/$id.json") match {
                case Success(data) => toDB(data)
                case Failure(err) =>
                  logdb(2, s"Не удалось считать данные из файла $file.", "parserdata.scala", List(err))
              }
          }

          def toDB(data: List[String]) = {
            val file = s"$datePath$dirname/$lang/$url_type/$id.json"
            new AddToDB(url_type, countries_id, languages_id, date).add(data.head) match {
              case Success(msg) => msg match {
                case 1 => log("info", s"Парсинг данных файла $file прошел успешно. Данные в базе обновлены.")
                case 0 => log("info", s"Парсинг данных файла $file прошел успешно. Данных для обновления не обнаружено.")
                case _ => logdb(3, s"Неизвестный формат данных файла $file", "parserdata.scala toDB")
              }
              case Failure(err) => logdb(3, s"Не удалось распарсить данные из файла $file", "parserdata.scala toDB", List(err))
            }
          }
        }
        case None => 
          logdb(3, s"Ошибка получения списка url.", "parserdata.scala thisDayParse")
        case _ => 
          logdb(2, s"В списке url отсутствуют данные.", "parserdata.scala thisDayParse")

    }

  }

}