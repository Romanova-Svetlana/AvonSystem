package com.avonsystem.parserdata

import scala.util.{Try, Success, Failure}
import com.avonsystem.utilities.{AIO, TextFormat, LogUtil}
import LogUtil.log

class DataProcessing[T](d: T) extends AIO with TextFormat with ParseT {

  val all = aioMs(d)
  def data = aioMs(all("\"Data\""))
  def facets = aioL(data("\"Facets\""))
  def categories = aioL(data("\"Categories\"")).map(x => (x, 0))
  def products = aioL(data("\"Products\""))

  def brands = {
    val entries = for {
      f <- facets
      fm = aioMs(f)
    } yield if (aioD(fm("\"FacetType\"")).toInt == 1) aioL(fm("\"Entries\"")) else List()

    entries.find(_.nonEmpty) match {
      case Some(bs) => for { b <- bs } yield toCapitalLetter(quotes(crupStr(aioS(aioMs(b)("\"Value\"")))))
      case None => List()
    }
  }

  def categoriesList[T](cat: List[(T, Int)] = categories, res: List[CategoryT] = List()): List[CategoryT] = cat match {
    case Nil => res.reverse
    case h :: t => 
      val (a, p) = h
      val m = aioMs(a)
      val id = aioD(m("\"Id\"")).toInt
      val r: CategoryT = (
        crupStr(aioS(m("\"Name\""))), 
        crupStr(aioS(m("\"NameMobile\""))), 
        crupStr(aioS(m("\"Description\""))), 
        crupStr(aioS(m("\"SearchWords\""))), 
        id, 
        crupStr(aioS(m("\"Image\""))), 
        aioD(m("\"CategoryType\"")).toShort, 
        aioB(m("\"Active\"")), 
        aioD(m("\"ImageWidth\"")).toShort,
        p
      )
      aioL(m("\"Children\"")) match {
        case Nil => categoriesList(t, r :: res)
        case l => categoriesList(t ::: l.map(x => (x, id)), r :: res)
      }
  }

  def productsList = for {
    p <- products
    pl = aioMs(p)
    prod = (
      crupStr(aioS(pl("\"ProfileNumber\""))), // есть всегда
      aioDI(pl("\"Id\"")), // есть всегда
      (
        aioDI(pl("\"ProductId\"")), 
        crupStr(aioS(pl("\"SingleVariantFsc\""))),
        crupStr(aioS(pl("\"SingleVariantSku\""))),
        aioB(pl("\"IsShadeVariant\"")),
        aioB(pl("\"IsSizeVariant\"")), 
        crupStr(aioS(pl("\"Name\""))), // Название
        crupStr(aioS(pl("\"SocialSharingDescription\""))), // Краткое описание, включает в себя HTML-теги
        crupStr(aioS(pl("\"SearchWords\""))), // поисковые слова, есть не везде
        toCapitalLetter(crupStr(aioS(pl("\"Brand\"")))),
        crupStr(aioS(pl("\"UnitPriceText\""))).toLowerCase, // мера измерения граммы и мл 
        crupStr(aioS(pl("\"PricePerUnitInformation\""))).toLowerCase // ml, piece(s), grams (south_africa), N, gm, g (india), Und, PAIR (colombia)
      ),
      (
        aioDSh(pl("\"Availability\"")), // доступность, разные небольшие числа, есть всегда // 2 AvailableSoon (Скоро будет доступно), 3 NoLongerAvailable (Больше недоступно), 0,NotForIndividualSale
        aioD(pl("\"ListPrice\"")), // основная цена, есть всегда
        aioD(pl("\"SalePrice\"")), // цена по скидке, бывает равна 0.0 если нет скидки
        aioD(pl("\"UnitPrice\"")), // цена за юнит, бывает равна 0.0 если нет юнита
        aioB(pl("\"IsNew\"")), // новинка
        aioD(pl("\"Rating\"")), // рейтинг
        aioB(pl("\"HasPromotion\"")), 
        aioDI(pl("\"RatingCount\"")), // количество проголосовавших в рейтинге
        crupStr(aioS(pl("\"Currency\""))), // валюта, есть всегда
        aioB(pl("\"IsOutOfStock\"")), // нет в наличии
        aioB(pl("\"IsNotAvailable\"")), // Не доступен
        crupStr(aioS(pl("\"UnitPriceMeasureUnit\""))), // цена за юнит
      ),
    )
  } yield prod

  def productsCategories = for {
    p <- products
    pl = aioMs(p)
    pn = crupStr(aioS(pl("\"ProfileNumber\"")))
    id = aioDI(pl("\"Id\""))

    cl = for {
      c <- aioL(pl("\"Categories\""))
      cm = aioMs(c)
      cat = aioMs(cm("\"Dept\"")) match {
        case null => aioMs(cm("\"PDept\"")) match {
          case null => aioMs(cm("\"Level2\"")) match {
            case null => log("warn", s"Невозможно определить категорию товара $id", true)
            case ctl => (aioDI(ctl("\"CategoryType\"")), crupStr(aioS(ctl("\"Name\""))), 0)
          }
          case pd => aioDI(pd("\"CategoryType\"")) match {
            case 1 => (1, aioDI(pd("\"Id\"")), toCapitalLetter(crupStr(aioS(pd("\"Name\"")))), aioDI(aioMs(cm("\"Level2\""))("\"Id\"")))
            case ctpd => (ctpd, aioDI(pd("\"Id\"")), crupStr(aioS(pd("\"Name\""))), 0)
          }
        }
        case d => aioDI(d("\"CategoryType\"")) match {
          case 1 => (1, aioDI(d("\"Id\"")), toCapitalLetter(crupStr(aioS(d("\"Name\"")))), aioDI(aioMs(cm("\"PDept\""))("\"Id\"")))
          case ctd => (ctd, aioDI(d("\"Id\"")), crupStr(aioS(d("\"Name\""))), 0)
        }
      }
    } yield cat

  } yield (pn, id, cl)

  def productsVariants = for {
    p <- products
    pl = aioMs(p)
    pn = crupStr(aioS(pl("\"ProfileNumber\""))) // есть всегда
    id = aioDI(pl("\"Id\"")) // есть всегда

    variant = aioL(pl("\"VariantGroups\"")) match {
      case Nil => List()
      case vg => for {
        v <- vg
        vl = aioL(aioMs(v)("\"Variants\""))
        vr = for {
          i <- vl
          ai = aioMs(i)
          vi = (
            aioDSh(ai("\"Availability\"")), // доступность, разные небольшие числа, есть всегда
            crupStr(aioS(ai("\"DisplayLineNumber\""))),
            crupStr(aioS(ai("\"Name\""))).replaceAll("/", " / "),
            crupStr(aioS(ai("\"Sku\""))),
            crupStr(aioS(ai("\"Fsc\""))),
            crupStr(aioS(ai("\"Type\""))),
            crupStr(aioS(ai("\"Image\"")))
          )
        } yield (pn, id, vi)
      } yield vr
    } 
  } yield variant

}