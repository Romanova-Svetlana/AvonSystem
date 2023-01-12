package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import Urls.{sUrls, sUrlsItems}
//import UrlsT
import com.avonsystem.utilities.{DateTime, LogUtil, Setting, FilesUtil, AIO}
import DateTime.{dateParse, dateNow, dateToInt}
import FilesUtil.{createDir, openFile}
import LogUtil.log
import Setting.{archivePath, imagesPath}

object ParserData extends App with UrlsT with AIO {

  args match {
    case Array(date, _*) => 
      dateParse(date) match { 
        case Success(d) => // Date received successfully. Дата получена успешно.
          thisDayParse(d)
          log("SUCCESS", s"Парсинг данных за $date завершен", true, List("parserdata.ParserData"))
        case Failure(err) => 
          log("error", s"Неверный формат даты. Введите дату в формате ГГГГ-ММ-ДД", true, List("parserdata.ParserData", err))
      }     
    case _ => // Daily data collection. Ежедневный сбор данных.

      sUrls() match {
        case List() => 
          log("error", s"Ошибка получения списка url. Работа программы прекращена", true, List("parserdata.ParserData"))
        case x => 
          log("info", s"Сбор данных и сохранение в файлы на диске", true, List("parserdata.ParserData"))
          dailyParse(x)
      }

/*
      val sui = sUrlsItems match {
        case List() => 
          logdb(3, s"Ошибка получения списка urls_items. Работа программы прекращена.", "parserdata.scala")
        case x => 
          logdb(1, s"Сбор данных и сохранение в файлы на диске.", "parserdata.scala")
//          dailyParse(x)
          new SaveDataFromUrl(dateNow).openUrlSaveData(x)
      }
      println(aioS(su) + aioS(sui))
*/
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
    val dateStart = dateNow
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

    def sdfu(u: List[UrlsT]) = new SaveDataFromUrl(dateStart).openUrlSaveData(urls)
    new SaveDataFromUrl(dateStart).openUrlSaveData(urls) match {
      case true => new SaveDataFromUrl(dateStart).openUrlSaveData(sUrlsItems) match {
        case true => println("OK Items")
        case false => 
          println("OK Urls")
          println("NOT Items")
      }
      case false => println("NOT URLS")
    }
    
    // на этом месте будет скачивание файлов продуктов, промоакций, изображений
  }

  // обработка данных за определенную дату
  def thisDayParse(date: java.time.LocalDate) = {
    val datePath = archivePath + date + "/"

    sUrls(false) match {
      case List() =>
        log("error", s"Ошибка получения списка url. Работа программы прекращена", true, List("parserdata.ParserData.thisDayParse")) 
      case url => 
        for (u <- url) {
          val (dirname, lang, url_type, parse_type, urls_id, countries_id, languages_id, id, url, date_add, iteration, date_iteration, no_iteration) = u
          val file = s"$datePath$dirname/$lang/$url_type/$id.json"

          openFile(file) match {
            case Nil => 
              openFile(s"$datePath$dirname/$url_type/$id.json") match {
                case Nil => log("warn", s"Невозможно обработать данные из файла $file.", true, List("parserdata.ParserData.thisDayParse"))
                case data => toDB(data)
              }
            case data => toDB(data)
          }

          def toDB(data: List[String]) = {
            val file = s"$datePath$dirname/$lang/$url_type/$id.json"
            new AddToDB(url_type, parse_type, countries_id, languages_id, dateToInt(date.toString)).add(data.head) match {
              case Success(msg) => msg match {
                case m if (m > 0) => log("info", s"Парсинг данных файла $file прошел успешно. Данные в базе обновлены.")
                case 0 => log("info", s"Парсинг данных файла $file прошел успешно. Данных для обновления не обнаружено", true)
                case _ => log("warn", s"Неизвестный формат данных файла $file", true, List("parserdata.scala toDB"))
              }
              case Failure(err) => log("warn", s"Не удалось распарсить данные из файла $file", true, List("parserdata.ParserData.thisDayParse.toDB", err)) 
            }
          }
        }
    }

  }

}