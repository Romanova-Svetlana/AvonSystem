package com.avonsystem.utilities

import com.avonsystem.utilities.LogUtil.log
import java.io.{File, PrintWriter}
import scala.util.{Try,Success,Failure}
import scala.io.Source

object FilesUtil {

  // Сreate directory. Создание директории.
  def createDir(path: String) = {
    val dir = new File(path)
    dir.mkdirs() match {
      case true => // created
        log("info", s"Директория $path успешно создана.")
        true
      case false if (new File(path).exists == true) => // already exists
        log("info", s"Директория $path уже существует.")
        true
      case _ => // error
        log("warn", s"Не удалось создать директорию $path.", true)
        false
    }
  }

  // Reading data from a file. Считывание данных из файла.
  def openFile(path: String, mkStr: Boolean = true) = try {
      val source = Source.fromFile(path, "UTF-8")
      val data = mkStr match {
        case true => List(source.mkString)
        case false => source.getLines.toList
      }
      Success(data)
    } catch {
      case err : Throwable => Failure(err)
  }

  // Saving data to a file. Сохранение данных в файл.
  def saveFile[T](path: String, text: List[T]) = try { 
      val out = new PrintWriter(path) 
      try {
        for (t <- text) out.println(t)
        Success(path)
      } catch {
        case err : Throwable => Failure(err)
      } finally { 
        out.close() 
      }
    } catch {
      case err : Throwable => Failure(err)
    }
  
  // получение данных по url с сайта
  def openUrl(link: String) = { 
    try {
      val urlData = Source.fromURL(link, "UTF-8").mkString
      Success(urlData)
    } catch {
      case err : Throwable => { 
        Failure(err)
      }
    }
  }
}