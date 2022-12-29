package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import java.io.File

import com.avonsystem.utilities.{ LogUtil, DateTime, FilesUtil, Setting, Timeout }
import Setting.archivePath
import FilesUtil.{openUrl, saveFile}
import LogUtil.{log, logdb}
import DateTime.dateNow
import Timeout.timeout

class SaveDataFromUrl(dataDate: java.time.LocalDate) extends UrlsT {

  val startDate = dateNow

  def openUrlSaveData(urlList: List[UrlsT], errList: List[UrlsT] = List()): Unit = {

    urlList match {

      case Nil => 
        errList match {
          case Nil => 
            logdb(4, s"Сбор данных прошел успешно.", "savedatafromurl.scala openUrlSaveData")
          case _ if (startDate == dateNow) => 
            logdb(1, s"Повторный проход. Не удалось скачать файлы со станиц.", "savedatafromurl.scala openUrlSaveData", errList)
            log("info", "Таймаут 30 минут.")
            timeout(30, 1)
            openUrlSaveData(errList.reverse, List())
          case _ => 
            timeoutFinish
        }

      case h :: t if (startDate == dateNow) => 
        val (dirname, code, url_type, parse_type, urls_id, countries_id, languages_id, id, url, date_add, iteration, date_iteration, no_iteration) = h
        val path = s"$archivePath$date_add/$dirname/$code/$url_type/$id.json"

        url_type match {
          case x if (x == "main" || x == "promo") => 
            no_iteration match {
              case true => 
                openSaveFile match {
                  case Some(data) => 
                    openUrlSaveData(t, errList)
                  case None => 
                    openUrlSaveData(t, h :: errList)
              }
              case false => 
                log("info", s"Cкачивание данных не производится: $url.")
                openUrlSaveData(t, errList)
            }
          case _ => 
            openUrlSaveData(t, errList)
        }

        def openSaveFile = {
          new File(path).exists match {
            case false => // Скачиваем данные, кладем в файл
              log("info", "Таймаут 1-2 минуты.")
              timeout(1, 1)
              openUrl(url) match {
                case Success(data) => 
                  saveFile(path, List(data)) match {
                    case Success(sf) => 
                      log("info", s"Данные из $url успешно сохранены в файл $sf")
                      Some(data)
                    case Failure(err) => 
                      logdb(2, s"Не удалось сохранить данные из $url в файл $path", "savedatafromurl.scala openSaveFile", List(err))
                      None
                  }
                case Failure(err) => 
                  logdb(3, s"Не удалось получить данные из $url", "savedatafromurl.scala openSaveFile", List(err))
                  None                
              }
            case true => 
              log("info", s"Файл $path уже существует, скачивание данных из $url не требуется.")
              //DataToDB.fromFile(List(path))
              openUrlSaveData(t, errList)            }
          }

      case _ => 
        timeoutFinish
    }

    def timeoutFinish = {
      val list = (urlList ::: errList.reverse).map({ case 
        (dirname, code, url_type, parse_type, urls_id, countries_id, languages_id, id, url, date_add, iteration, date_iteration, no_iteration) => 
          s"$dirname, $code, $url_type, $parse_type, $urls_id, $countries_id, $languages_id, $id, $url, $date_add, $iteration, $date_iteration, $no_iteration" 
        })
      logdb(2, s"Сбор данных завершен по таймауту. Список необработанных страниц в логе.", "savedatafromurl.scala timeoutFinish", list)
    }

  }

}
