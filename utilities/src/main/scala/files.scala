package com.avonsystem.utilities

import com.avonsystem.utilities.LogUtil.log
import java.io.{File, PrintWriter}
import scala.util.{Try,Success,Failure}
import scala.io.Source

object FilesUtil {

  def fileExists(path: String) = new File(path).exists

  // Сreate directory. Создание директории.
  def createDir(path: String) = {
    val dir = new File(path)
    dir.mkdirs() match {
      case true => // created
        log("info", s"Директория $path успешно создана.")
        true
      case false if (fileExists(path) == true) => // already exists
        log("info", s"Директория $path уже существует.")
        true
      case _ => 
        log("warn", s"Не удалось создать директорию $path", true, List("utilities.FilesUtil.createDir"))
        false
    }
  }

  // Reading data from a file. Считывание данных из файла.
  
  def openFile(path: String) = {

    def openFileTry = try {
      val res = Source.fromFile(path, "UTF-8").getLines.toList
      Success(res)
    } catch {
      case err : Throwable => Failure(err)
    }

    fileExists(path) match {
      case true => openFileTry match {
        case Success(data) => data
        case Failure(err) => 
          log("warn", s"Невозможно получить данные из файла $path", true, List("utilities.FilesUtil.openFile", err))
          List()
      }
      case false => 
        log("warn", s"Файл не найден: $path", true, List("utilities.FilesUtil.openFile", err))
        List()
    }
  }

  // Saving data to a file. Сохранение данных в файл.
  def saveFile[T](path: String, data: List[T]) = {
    
    def saveFileTry = try { 
      val out = new PrintWriter(path) 
      try {
        for (d <- data) out.println(d)
        Success(true)
      } catch {
        case err : Throwable => 
          Failure(err)
      } finally { 
        out.close() 
      }
    } catch {
      case err : Throwable => 
        Failure(err)
    }

    saveFileTry match {
      case Success(t) => true
      case Failure(err) => 
        log("warn", s"Невозможно сохранить данные в файл $path", true, List("utilities.FilesUtil.saveFile", err))
        false
      }
  }

  
  // получение данных по url с сайта
  def openUrl(url: String) = {
    def openUrlTry = try {
      val res = Source.fromURL(url, "UTF-8").getLines.toList
      Success(res)
    } catch {
      case err : Throwable => {
        log("warn", s"Невозможно получить данные из $url", true, List("utilities.FilesUtil.openUrl", err))
        Failure(err)
      }
    }

    openUrlTry match {
      case Success(data) => data
      case Failure(err) => List()
    }
  }


  // сохранение бинарного файла из URL
  def copyFileFromUrl(url: String, path: String, name: String) = {
    val filePath = s"$path$name.${url.split("\\.").last}"

    def copyFileFromUrlTry = try {
      import scala.language.postfixOps
      import sys.process._
      new java.net.URL(url) #> new File(filePath) !! ;
      Success(true)
    } catch {
      case err : Throwable => 
        log("warn", s"Невозможно скопировать файл из $url на диск", true, List("utilities.FilesUtil.copyFileFromUrl", err))
        Failure(err)
    }

    fileExists(filePath) match {
      case false => copyFileFromUrlTry match {
        case Success(t) => true
        case Failure(err) => false
      }
      case true => false
    }
  }

}