package com.avonsystem.parserdata

trait UrlT {
	type UrlT = (Int, String, String, Int, String, String, Short, String)
//  type PromoT = (Int, Int, Boolean, String, String, String, String, String, String, Boolean)
}

trait UrlsT {
	type UrlsT = (String, String, String, Short, Int, Short, Short, Int, String, java.time.LocalDate, Short, java.time.LocalDate, Boolean)
}

trait ParseT {
	type CategoryT = (Int, String, String, Int)
	type ProductT = (String, Int, (String, String), (Int, String, String, String, String, String, String), (Short, Double, Double, Double, Boolean, Boolean, Double, Int, Boolean, Boolean), String)
	type ProductsListT = List[(String, Int, Map[String, Any])]
	type ProductsPromotionsT = (String, Int, String, Double)
	type PromoT = (Boolean, Int, String, String, String, String)
}

