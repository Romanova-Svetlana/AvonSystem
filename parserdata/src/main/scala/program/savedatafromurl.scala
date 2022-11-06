package com.avonsystem.parserdata

import scala.util.{Success, Failure}
import java.io.File

import com.avonsystem.utilities.{ LogUtil, DateTime, FilesUtil, Setting, Timeout }
import Setting.archivePath
import FilesUtil.{openUrl, saveFile}
import LogUtil.log
import DateTime.dateNow
import Timeout.timeout

class SaveDataFromUrl(dataDate: java.time.LocalDate) extends UrlsT {

  val startDate = dateNow

  def openUrlSaveData(urlList: List[UrlsT], errList: List[UrlsT] = List()): Unit = {

    urlList match {

      case Nil => 
        errList match {
          case Nil => 
            log("SUCCESS", s"Сбор данных прошел успешно.", true)
          case _ if (startDate == dateNow) => 
            log("INFO", "Повторный проход. Не удалось скачать файлы со станиц.", true, errList)
            log("info", "Таймаут 30 минут.")
            timeout(30, 1)
            openUrlSaveData(errList.reverse, List())
          case _ => 
            timeoutFinish
        }

      case h :: t => 
//        val (urls_id, url, url_type, id, country, language, country_id, udate) = h
        val (dirname, lang, url_type, urls_id, countries_urls_id, countries_id, languages_id, id, url, dateUrl, iteration, dateIteration, noIteration) = h

        val path = s"$archivePath$dateUrl/$dirname/$lang/$url_type/$id.json"

        new File(path).exists match {
          case false => openSaveFile // Скачиваем данные, кладем в файл
          case true => 
            log("info", s"Файл $path уже существует, скачивание данных из $url не требуется.")
            openUrlSaveData(t, errList)
        }

        def openSaveFile = {
          log("info", "Таймаут 1-2 минуты.")
          timeout(1, 1)
          openUrl(url) match {
            case Success(data) => 
              saveFile(s"$archivePath$dateUrl/$dirname/$lang/$url_type/$id.json", List(data)) match {
                case Success(sf) => 
                  log("info", s"Данные из $url успешно сохранены в файл $sf")
                  openUrlSaveData(t, errList)
                case Failure(err) => 
                  log("warn", s"Не удалось сохранить данные из $url в файл $archivePath$dateUrl/$dirname/$lang/$url_type/$id.json", true, List(err))
                  openUrlSaveData(t, h :: errList)
              }
            case Failure(err) => 
              log("warn", s"Не удалось получить данные из $url", true, List(err))
              openUrlSaveData(t, h :: errList)
          }
        }

      case _ => 
        timeoutFinish
    }

    def timeoutFinish = {
      val list = (urlList ::: errList.reverse).map({ case 
        (dirname, lang, url_type, urls_id, countries_urls_id, countries_id, languages_id, id, url, dateUrl, iteration, dateIteration, noIteration) => 
          s"$dirname, $lang, $url_type, $urls_id, $countries_urls_id, $countries_id, $languages_id, $id, $url, $dateUrl, $iteration, $dateIteration, $noIteration" 
        })
      log("WARN", s"Сбор данных завершен по таймауту. Список необработанных страниц в лог-файле.", true, list)
    }

  }

}
