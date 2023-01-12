package com.avonsystem.utilities

import FilesUtil.{createDir, openFile}

object Setting {

  val mainPath = "/home/sw/projects/avonsystem"
  val webPath = s"$mainPath/www"
  val imagesPath = s"$webPath/images/"
  val dataPath = mainPath + "data/"
  val archivePath = dataPath + "archive/"
  val logPath = dataPath + "log/" + DateTime.dateNow + "/"
  val logFolder = createDir(logPath)

  val conStr = openFile(s"${dataPath}set/dbs.php") match {
    case Nil => 
      LogUtil.log("ERROR", "Не удалось получить параметры соединения с базой данных.", true)
      s""
    case c => s"jdbc:postgresql://${c(0)}/${c(1)}?user=${c(2)}&password=${c(3)}"
  }

}