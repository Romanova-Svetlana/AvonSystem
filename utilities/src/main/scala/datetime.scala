package com.avonsystem.utilities

import java.time.{LocalDate, LocalTime}
import scala.util.{Try,Success,Failure}

object DateTime {

  def dateNow = LocalDate.now
  def timeNow = LocalTime.now

  // конвертирует строку в формат даты
  def dateParse(date: String): Try[java.time.LocalDate] = 
    try {
      val d = LocalDate.parse(date); 
      Success(d) 
    } catch {
      case err : Throwable => Failure(err)
    }

  // прибавляет или вычитает дни из даты
  def datePlus(date: java.time.LocalDate, days: Int) = date.plusDays(days)

  // конвертация даты и времени в целочисленные типы и обратно в строковые
  def dateTimeToLong(datetime: String) = datetime.replaceAll("[-:\\.]", "").toLong
  def dateToInt(date: String) = date.replaceAll("-", "").toInt

  def intToDate(num: Int) = {
    val s = num.toString
    s"${s(0)}${s(1)}${s(2)}${s(3)}-${s(4)}${s(5)}-${s(6)}${s(7)}"
  }

}