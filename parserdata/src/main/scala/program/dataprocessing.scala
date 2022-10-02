package com.avonsystem.parserdata

import scala.util.{Try,Success,Failure}
import com.avonsystem.utilities.{AIO, TextFormat, LogUtil}
import LogUtil.log

class DataProcessing[T](d: T) extends AIO with TextFormat with ParseT {

  def all = aioMs(d)
  def data = aioMs(all("\"Data\""))
  def facets = aioL(data("\"Facets\""))
  def categories = aioL(data("\"Categories\"")).map(x => (x, 0))

  def brands = {
    val entries = for {
      f <- facets
      fm = aioMs(f)
    } yield if (aioD(fm("\"FacetType\"")).toInt == 1) aioL(fm("\"Entries\"")) else List()

    entries.find(_.nonEmpty) match {
      case Some(bs) => for { b <- bs } yield toCapitalLetter(quotes(crupStr(aioS(aioMs(b)("\"Value\"")))))
      case None => List()
    }
  }

  def categoriesList[T](cat: List[(T, Int)] = categories, res: List[CategoryT] = List()): List[CategoryT] = cat match {
    case Nil => res.reverse
    case h :: t => 
      val (a, p) = h
      val m = aioMs(a)
      val id = aioD(m("\"Id\"")).toInt
      val r: CategoryT = (
        crupStr(aioS(m("\"Name\""))), 
        crupStr(aioS(m("\"NameMobile\""))), 
        crupStr(aioS(m("\"Description\""))), 
        crupStr(aioS(m("\"SearchWords\""))), 
        id, 
        crupStr(aioS(m("\"Image\""))), 
        aioD(m("\"CategoryType\"")).toShort, 
        aioB(m("\"Active\"")), 
        aioD(m("\"ImageWidth\"")).toShort,
        p
      )
      aioL(m("\"Children\"")) match {
        case Nil => categoriesList(t, r :: res)
        case l => categoriesList(t ::: l.map(x => (x, id)), r :: res)
      }
  }

}