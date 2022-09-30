package com.avonsystem.parserdata

import scala.util.parsing.combinator._
import scala.util.{Failure, Success, Try}

import com.avonsystem.utilities.LogUtil


class Json extends JavaTokenParsers {
	def obj			: Parser[Map[String, Any]]	= "{"~> repsep(member, ",") <~"}" ^^ (Map() ++ _)
	def arr			: Parser[List[Any]] 				= "["~> repsep(value, ",") <~"]"
	def member	: Parser[(String, Any)] 		= stringLiteral~":"~value 				^^ { case name~":"~value => (name, value) } 

	def value		: Parser[Any] 							= ( 
																						  obj 
																						| arr 
																						| stringLiteral 
																						| floatingPointNumber ^^ (_.toDouble)
																						| "null" 	^^ (x => null)
																						| "true" 	^^ (x => true)
																						| "false" 	^^ (x => false)
																					   )
}

object Json extends Json {

	def parserJson(json: String) = parseAll(value, json) match {
    case Success(result, n) => result
    case Failure(msg, n) => LogUtil.log("warn", "Не удалось конвертировать JSON в данные.", true, List(msg))
  }

}