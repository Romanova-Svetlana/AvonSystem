package com.avonsystem.parserdata

import com.avonsystem.utilities.{AIO, LogUtil}
import LogUtil.log

class DataProcessing[T](d: T) extends AIO {

  def all = aioMs(d)
  def data = aioMs(all("\"Data\""))
  def facets = aioL(data("\"Facets\""))

// поискать более красивое решение
  def brands = {
    val entries = for {
      f <- facets
      fm = aioMs(f)
      fe = if (aioD(fm("\"FacetType\"")).toInt == 1) aioL(fm("\"Entries\"")) else List() 
    } yield fe

    entries.find(_.nonEmpty) match {
      case Some(bs) => for { b <- bs } yield quotes(aioS(aioMs(b)("\"Value\""))).toLowerCase.split(" ").map(_.capitalize).mkString(" ")
      case None => List()
    }
  }


//  def productsList[T](d: T) = aioL(data(d)("\"Products\""))
//	def promoList[T](d: T) = aioL(all(d)("\"Data\""))

}