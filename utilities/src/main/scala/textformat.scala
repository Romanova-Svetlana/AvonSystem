package com.avonsystem.utilities

trait TextFormat {
  def quotes(s: String) = s.replaceAll("""["„“](.*)["„“]""", "$1")
  def crupStr(s: String) = if (s != null) s.tail.init else ""
  def toCapitalLetter(s: String) = s.toLowerCase.split(" ").map(_.capitalize).mkString(" ")
  def tagP(s: String)= s.replaceAll("""<p>(.*)</p>""", "$1")

  def replaceSql(s: String) = {
    val rep = for { 
      i <- s
      c = i.toString match {
        case "'" => "''"
        case x => x
      }
    } yield c
    rep.mkString 
  }

}