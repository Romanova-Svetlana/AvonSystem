package com.avonsystem.utilities

trait TextFormat {
  def quotes(s: String) = s.replaceAll("""["„“](.*)["„“]""", "$1")
  def crupString(s: String) = s.tail.init
  def toCapitalLetter(s: String) = s.toLowerCase.split(" ").map(_.capitalize).mkString(" ")
}