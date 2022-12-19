package com.avonsystem.utilities

import DateTime.{dateNow, timeNow, dateTimeToLong}

object LogUtil extends AIO {
  def dateTimeNow = java.util.Calendar.getInstance().getTime().toString

  def log(res: String, msg: String, file: Boolean = false, err: List[Any] = List()) = {
    println(s"[$res] $msg")
    for (e <- err) println(s"[$res] $e")
    if (file == true) {
      val m = msg.take(50)
      val logFile = Setting.logPath + s"[$res] $m.txt"
      FilesUtil.saveFile(logFile, List(s"[$res] $msg", dateTimeNow) ::: err)
    }
  }

  def logdb(res: Byte, msg: String, file: String, err: List[Any] = List()) = {
    val e = aioLs(err).mkString("\n")
    val r = res match {
      case 2 => "warn"
      case 3 => "error"
      case 4 => "success"
      case _ => "info"
    }
    DbConn.update(s"INSERT INTO logs VALUES (DEFAULT, $res, '$msg', '$file', '$e', ${dateTimeToLong(s"$dateNow$timeNow")});")
    println(s"[$r] $msg")
    println(file)
    println(e)
  }
}