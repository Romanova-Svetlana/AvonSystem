package com.avonsystem.utilities

object Timeout {

	val random = new scala.util.Random
	val minute = 60000
	// val second = 1000
 	def timeout(tm: Int, rm: Int) = {
		Thread.sleep(minute * tm + random.nextInt(minute * rm))
	}

}