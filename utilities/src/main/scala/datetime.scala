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

  def dateToInt(date: java.time.LocalDate) = date.toString.replaceAll("-", "").toInt
  def timeToInt(time: java.time.LocalTime) = time.toString.replaceAll("[:\\.]", "").toInt

}