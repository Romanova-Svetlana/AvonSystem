package com.avonsystem.utilities

import java.io.{File, PrintWriter}
import scala.util.{Try,Success,Failure}
import scala.io.Source

object FilesUtil {

  // create directory
  def createDir(path: String) = {
    val dir = new File(path)
    dir.mkdirs() match {
      case true => // created
        true
      case false if (new File(path).exists == true) => // already exists
        true
      case _ => // error
        false
    }
  }

  // reading data from a file
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

  // saving data to a file on disk
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
  
}