package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import java.io.File

import com.avonsystem.utilities.{LogUtil, DateTime, FilesUtil, Setting, Timeout, DbConn}
import Setting.archivePath
import FilesUtil.{openUrl, saveFile, fileExists}
import LogUtil.log
import DateTime.{dateNow, dateToInt}
import Timeout.timeout
import DbConn.update

class SaveDataFromUrl(dataDate: java.time.LocalDate) extends UrlsT {

  val startDate = dateNow

  def openUrlSaveData(urlList: List[UrlsT], errList: List[UrlsT] = List()): Boolean = {

    def toFileDb(h: UrlsT) = {
      val (dirname, code, url_type, parse_type, urls_id, countries_id, languages_id, id, url, date_add, iteration, date_iteration, no_iteration) = h
      val path = s"$archivePath$date_add/$dirname/$code/$url_type/$id.json"

      def openSaveFile = fileExists(path) match {
        case false => // Скачиваем данные, кладем в файл
          log("info", "Таймаут 1-2 минуты.")
          timeout(1, 1)
          openUrl(url) match {
            case Nil => 
              log("warn", s"Не удалось получить данные из $url", true, List("parserdata.SaveDataFromUrl.openSaveFile"))
              (false, List())
            case data => saveFile(path, data) match {
              case true => 
                log("info", s"Данные успешно сохранены: $url")
                (true, data)
              case false => (false, List())
            }
          }
        case true => 
          log("info", s"Файл $path уже существует, скачивание данных из $url не требуется.")
          (true, List())
      }

      def addToDB(data: String) = new AddToDB(url_type, parse_type, countries_id, languages_id, dateToInt(startDate.toString)).add(data) match {
        case Success(msg) => 
          msg match {
            case m if (m > 0) => 
              log("info", s"Парсинг данных файла $path прошел успешно. Данные в базе обновлены.")
            case 0 => 
              log("info", s"Парсинг данных файла $path прошел успешно. Данных для обновления не обнаружено.")
            case _ => 
              log("warn", s"Неизвестный формат данных файла $path", true, List("parserdata.SaveDataFromUrl.addToDB"))
          }
          true
        case Failure(err) => 
          log("warn", s"Не удалось распарсить данные из файла $path", true, List("parserdata.SaveDataFromUrl.addToDB"))
          false
      }

      def changeIteration(i: Int) = i match {
        case 0 => s"UPDATE urls_items SET iteration = 0 WHERE urls_items_id = $urls_id;"
        case 1 => 
          val it = if (iteration < 30) iteration + 1 else -1
          s"UPDATE urls_items SET iteration = $it WHERE urls_items_id = $urls_id;"
        case _ => s""
      }

      openSaveFile match {
        case (false, _) => 
          if (url_type != "main" && url_type != "promo") update(changeIteration(1))
          false
        case (true, Nil) => true
        case (true, data) => 
          url_type match {
            case "main" => true
            case "promo" => addToDB(data.mkString)
            case "promotions" => 
              update(changeIteration(0))
              true
            case _ => 
              log("info", s"Cкачивание данных не производится: $url.")
              true
          }
      }
    }


    urlList match {
      case Nil => 
        errList match {
          case Nil => 
            log("success", s"Сбор данных прошел успешно", true)
            true
          case _ => 
            log("warn", s"Повторный проход. Не удалось скачать файлы со станиц", true, List("parserdata.SaveDataFromUrl.openUrlSaveData", errList))
            log("info", "Таймаут 30 минут.")
            timeout(30, 1)
            openUrlSaveData(errList.reverse, List())
        }

      case h :: t if (startDate == dateNow) => toFileDb(h) match {
        case true => openUrlSaveData(t, errList)
        case false => openUrlSaveData(t, h :: errList)
      }

      case _ => 
        log("warn", s"Сбор данных завершен по таймауту. Список необработанных страниц", true, List("savedatafromurl.scala openUrlSaveData") ::: urlList ::: errList.reverse)
        false
    }
  }
}



