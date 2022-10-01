package com.avonsystem.parserdata

import com.avonsystem.utilities.{AIO, TextFormat, LogUtil}
import LogUtil.log

class DataProcessing[T](d: T) extends AIO with TextFormat with ParseT{

  def all = aioMs(d)
  def data = aioMs(all("\"Data\""))
  def facets = aioL(data("\"Facets\""))
  def categories = aioMs(data("\"Categories\""))

// поискать более красивое решение
  def brands = {
    val entries = for {
      f <- facets
      fm = aioMs(f)
    } yield if (aioD(fm("\"FacetType\"")).toInt == 1) aioL(fm("\"Entries\"")) else List()

    entries.find(_.nonEmpty) match {
      case Some(bs) => for { b <- bs } yield toCapitalLetter(quotes(crupString(aioS(aioMs(b)("\"Value\"")))))
      case None => List()
    }
  }


//  def categoriesList[T](cat: T = categories) = println(cat) //cat match {
//    case List() => 
//    case h :: t => 
//  } List[CategoryT]


//  def productsList[T](d: T) = aioL(data(d)("\"Products\""))
//	def promoList[T](d: T) = aioL(all(d)("\"Data\""))

}