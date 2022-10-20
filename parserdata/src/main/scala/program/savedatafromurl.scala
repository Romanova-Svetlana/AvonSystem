package com.avonsystem.parserdata

import scala.util.{Success, Failure}

import com.avonsystem.utilities.{ LogUtil, DateTime, FilesUtil, Setting, Timeout }
import Setting.archivePath
import FilesUtil.{openUrl, saveFile}
import LogUtil.log
import DateTime.dateNow
import Timeout.timeout

class SaveDataFromUrl(dataDate: java.time.LocalDate) extends UrlT {

  val startDate = dateNow

  def openUrlSaveData(urlList: List[UrlT], errList: List[UrlT] = List()): Unit = {

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
            timeoutEnd
        }

      case h :: t => 
        log("info", "Таймаут 1-2 минуты.")
        timeout(1, 1)
        val (urls_id, url, url_type, id, country, language, country_id, udate) = h

        FilesUtil.openUrl(url) match {
          case Success(data) => 
            saveFile(s"$archivePath$udate/$country/$language/$url_type/$id.json", List(data)) match {
              case Success(sf) => 
                log("info", s"Данные из $url успешно сохранены в файл $sf")
                openUrlSaveData(t, errList)
              case Failure(err) => 
                log("warn", s"Не удалось сохранить данные из $url в файл $archivePath$udate/$country/$language/$url_type/$id.json", true, List(err))
                openUrlSaveData(t, h :: errList)
            }
          case Failure(err) => 
            log("warn", s"Не удалось получить данные из $url", true, List(err))
            openUrlSaveData(t, h :: errList)
        }

      case _ => 
        timeoutEnd
    }

    def timeoutEnd = {
      val list = (urlList ::: errList.reverse).map({ case (uid, u, ut, id, c, l, cid, d) => s"$uid $u $ut $id $c $l $cid $d" })
      log("WARN", s"Сбор данных завершен по таймауту. Список необработанных страниц в лог-файле.", true, list)
    }

  }

}
