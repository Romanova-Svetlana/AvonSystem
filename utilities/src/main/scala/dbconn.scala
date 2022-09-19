package com.avonsystem.utilities

import com.avonsystem.utilities.Setting.conStr
import java.sql.{Connection, DriverManager, ResultSet}
import scala.util.{Try,Success,Failure}

object DbConn {  

//  val conStr = "jdbc:postgresql://localhost:порт/имя_базы_данных?user=пользователь&password=пароль"
  def conn = DriverManager.getConnection(conStr)

  def select(query: String): Try[Stream[ResultSet]] = {
    try {
      val stm = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY)
      val rs = stm.executeQuery(query)
      Success(resultSetItr(rs))
    } catch {
      case err : Throwable => Failure(err)
    } finally {
      conn.close()
    }
  }

  def resultSetItr(resultSet: ResultSet): Stream[ResultSet] = {
    new Iterator[ResultSet] {
      def hasNext = resultSet.next()
      def next() = resultSet
    }.toStream
  }

  def update(query: String) = {
    try {
      val stm = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE)
      val res = stm.executeUpdate(query)
      Success(res)
    } catch {
      case err : Throwable => Failure(err)
    } finally {
      conn.close()
    }
  }  

}