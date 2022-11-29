package com.avonsystem.parserdata

trait UrlT {
	type UrlT = (Int, String, String, Int, String, String, Short, String)
//  type PromoT = (Int, Int, Boolean, String, String, String, String, String, String, Boolean)
}

trait UrlsT {
	type UrlsT = (String, String, String, Int, Short, Short, Short, Int, String, java.time.LocalDate, Short, java.time.LocalDate, Boolean)
}

trait ParseT {
	type CategoryT = (Int, String, String, Int)
	type ProductsT = (Int, String, (Int, String, String, Boolean, Boolean, String, String, String, String), (String, String), (Int, Double, Double, Double, Boolean, Double, Boolean, Int, Boolean, Boolean, String), String)
	type ProductsListT = List[(String, Int, Map[String, Any])]
	type ProductsPromotionsT = (String, Int, String, Double)
}

