package com.avonsystem.parserdata

trait UrlT {
	type UrlT = (Int, String, String, Int, String, String, Short, String)
//  type PromoT = (Int, Int, Boolean, String, String, String, String, String, String, Boolean)
}

trait ParseT {
	type CategoryT = (Int, String, String, Int)
	type ProductsListT = List[(String, Int, Map[String, Any])]
	type ProductsPromotionsT = (String, Int, String, Double)
}

