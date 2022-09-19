package com.avonsystem.utilities

import com.avonsystem.utilities.Setting.logPath
import com.avonsystem.utilities.FilesUtil.saveFile

object LogUtil {
  def dateTimeNow = java.util.Calendar.getInstance().getTime().toString

  def log(res: String, msg: String, file: Boolean = false, err: List[Any] = List()) = {
    println(s"[$res] $msg")
    for (e <- err) println(s"[$res] $e")
    if (file == true) {
      val m = msg.take(50)
      val logFile = logPath + s"[$res] $m.txt"
      saveFile(logFile, List(s"[$res] $msg", dateTimeNow) ::: err)
    }
  }
}