package com.avonsystem.utilities

trait AIO {
  def aioMs[T](s: T)   = s.asInstanceOf[Map[String, Any]]
  def aioL[T](s: T)   = s.asInstanceOf[List[Any]]
  def aioS[T](s: T)   = s.asInstanceOf[String]
  def aioD[T](s: T)   = s.asInstanceOf[Double]
  def aioI[T](s: T)   = s.asInstanceOf[Int]
  def aioB[T](s: T)   = s.asInstanceOf[Boolean]
  def aioDI[T](s: T) = if (s != null) aioD(s).toInt else null
  def aioDSh[T](s: T) = if (s != null) aioD(s).toShort else null
}