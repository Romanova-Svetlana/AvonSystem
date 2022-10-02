package com.avonsystem.utilities

trait TextFormat {
  def quotes(s: String) = s.replaceAll("""["„“](.*)["„“]""", "$1")
  def crupStr(s: String) = if (s != null) s.tail.init else ""
  def toCapitalLetter(s: String) = s.toLowerCase.split(" ").map(_.capitalize).mkString(" ")
}