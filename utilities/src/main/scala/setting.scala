package com.avonsystem.utilities

object Setting {

  val mainPath = "/home/sw/projects/avonsystem"
  val dataPath = mainPath + "data/"
  val archivePath = dataPath + "archive/"
  val logPath = dataPath + "log/"
  val logFolder = FilesUtil.createDir(logPath)

	val conStr = "jdbc:postgresql://localhost:5432/"
}