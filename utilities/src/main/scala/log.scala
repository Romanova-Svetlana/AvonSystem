package com.avonsystem.utilities

object LogUtil {
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
}