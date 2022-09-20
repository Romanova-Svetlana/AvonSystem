package com.avonsystem.utilities

import scala.util.{Success, Failure}
import FilesUtil.{createDir, openFile}

object Setting {

  val mainPath = "/home/sw/projects/avonsystem"
  val dataPath = mainPath + "data/"
  val archivePath = dataPath + "archive/"
  val logPath = dataPath + "log/"
  val logFolder = createDir(logPath)

	val conStr = { 
    openFile(dataPath + "set/dbs.txt", false) match {
      case Success(c) => s"jdbc:postgresql://${c(0)}/${c(1)}?user=${c(2)}&password=${c(3)}"
      case Failure(err) => 
        LogUtil.log("ERROR", "Не удалось получить параметры соединения с базой данных.", true, List(err))
        ""
    }
  }

}