package com.avonsystem.parserdata

trait UrlT {
	type UrlT = (Int, String, String, Int, String, String, Short, String)
//  type PromoT = (Int, Int, Boolean, String, String, String, String, String, String, Boolean)
}

trait ParseT {
	type CategoryT = (String, String, String, String, Int, String, Short, Boolean, Short, Int)
	type ProductsPromotionsT = (String, Double, String, Double)
}

