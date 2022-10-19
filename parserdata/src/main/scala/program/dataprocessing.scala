package com.avonsystem.parserdata

import scala.util.{Try, Success, Failure}
import com.avonsystem.utilities.{AIO, TextFormat, LogUtil}
import LogUtil.log

class DataProcessing[T](d: T) extends AIO with TextFormat with ParseT {

  val all = aioMs(d)
  def data = aioMs(all("\"Data\""))
  def facets = aioL(data("\"Facets\""))
  def categories = aioL(data("\"Categories\"")).map(x => (aioMs(x), 0))
  def products = aioL(data("\"Products\"")).map(x => aioMs(x))

  def brands(facet: List[Any] = facets, brand: List[String] = List()): List[String] = facet match {
    case Nil => brand
    case h :: t => 
      val mh = aioMs(h)
      aioDSh(mh("\"FacetType\"")) match {
        case 1 => brands(t, brand ::: aioL(mh("\"Entries\"")).map(x => toCapitalLetter(quotes(crupStr(aioS(aioMs(x)("\"Value\"")))))))
        case _ => brands(t, brand)
      }
  }

  def categoriesList(cat: List[(Map[String, Any], Int)] = categories, res: List[CategoryT] = List()): List[CategoryT] = cat match {
    case Nil => res.reverse
    case h :: t => 
      val (m, p) = h
      val id = aioDI(m("\"Id\""))
      val r: CategoryT = (
        id, 
        crupStr(aioS(m("\"Name\""))), 
        crupStr(aioS(m("\"SearchWords\""))), 
        p
      )
      aioL(m("\"Children\"")) match {
        case Nil => categoriesList(t, r :: res)
        case l => categoriesList(t ::: l.map(x => (aioMs(x), id)), r :: res)
      }
  }

  def productsCard = for {
    p <- products
    pn = crupStr(aioS(p("\"ProfileNumber\""))) // есть всегда
    id = aioDI(p("\"Id\"")) // есть всегда
    prod = (
      (
        pn,
        id,
        aioDI(p("\"ProductId\"")), 
        crupStr(aioS(p("\"SingleVariantFsc\""))),
        crupStr(aioS(p("\"SingleVariantSku\""))),
        aioB(p("\"IsShadeVariant\"")),
        aioB(p("\"IsSizeVariant\"")), 
        crupStr(aioS(p("\"Name\""))), // Название
        crupStr(aioS(p("\"SocialSharingDescription\""))), // Краткое описание, включает в себя HTML-теги
        crupStr(aioS(p("\"SearchWords\""))), // поисковые слова, есть не везде
        toCapitalLetter(crupStr(aioS(p("\"Brand\"")))),
        crupStr(aioS(p("\"UnitPriceText\""))).toLowerCase, // мера измерения граммы и мл 
        crupStr(aioS(p("\"PricePerUnitInformation\""))).toLowerCase // ml, piece(s), grams (south_africa), N, gm, g (india), Und, PAIR (colombia)
      ),
      (
        pn,
        id,
        aioDSh(p("\"Availability\"")), // доступность, разные небольшие числа, есть всегда // 2 AvailableSoon (Скоро будет доступно), 3 NoLongerAvailable (Больше недоступно), 0,NotForIndividualSale
        aioD(p("\"ListPrice\"")), // основная цена, есть всегда
        aioD(p("\"SalePrice\"")), // цена по скидке, бывает равна 0.0 если нет скидки
        aioD(p("\"UnitPrice\"")), // цена за юнит, бывает равна 0.0 если нет юнита
        aioB(p("\"IsNew\"")), // новинка
        aioD(p("\"Rating\"")), // рейтинг
        aioB(p("\"HasPromotion\"")), 
        aioDI(p("\"RatingCount\"")), // количество проголосовавших в рейтинге
        crupStr(aioS(p("\"Currency\""))), // валюта, есть всегда
        aioB(p("\"IsOutOfStock\"")), // нет в наличии
        aioB(p("\"IsNotAvailable\"")), // Не доступен
        crupStr(aioS(p("\"UnitPriceMeasureUnit\""))), // цена за юнит
      ),
    )
  } yield prod


  def productsList(section: String, products: List[Any] = products, res: ProductsListT = List()): ProductsListT = products match {
    case Nil => res
    case h :: t => 
      val mProducts = aioMs(h)
      aioL(mProducts(s"\"$section\"")) match {
        case Nil => productsList(section, t, res)
        case null => productsList(section, t, res)
        case d => 
          val pn = crupStr(aioS(mProducts("\"ProfileNumber\"")))
          val id = aioDI(mProducts("\"Id\""))
          val resItem = d.map(x => (pn, id, aioMs(x)))
          productsList(section, t, res ::: resItem)
      }
  }


  def productsPromotions = productsList("Promotions").map({ 
    case (pn, id, x) => (pn, id, crupStr(aioS(x("\"Description\""))), aioDI(x("\"Id\""))) 
    })

  def productsCategories = productsList("Categories").map({
    case (pn, id, x) => 

      def levels(level1: String, level2: String) = {
        val l = aioMs(x(s"\"$level1\""))
        val ct = aioDSh(l("\"CategoryType\""))
        (
          pn, 
          id, 
          ct,
          aioDI(l("\"Id\"")),
          toCapitalLetter(crupStr(aioS(l("\"Name\"")))),
          if (ct != 1 || level2 == "none") 0 else aioDI(aioMs(x(s"\"$level2\""))("\"Id\""))
        )
      }

      x("\"Dept\"") match {
        case null => x("\"PDept\"") match {
          case null => x("\"Level2\"") match {
            case null => (pn, id, 0, 0, "", 0)
            case _ => levels("Level2", "none")
          }
          case _ => levels("PDept", "Level2")
        }
        case _ => levels("Dept", "PDept")
      }
  })

  def productsVariants = productsList("VariantGroups").map({ 
    case (pn, id, x) => aioL(x("\"Variants\"")).map({
      case variants =>
        val mVariants = aioMs(variants)
        (
          pn,
          id,
          aioDSh(mVariants("\"Availability\"")), // доступность, разные небольшие числа, есть всегда
          crupStr(aioS(mVariants("\"DisplayLineNumber\""))),
          crupStr(aioS(mVariants("\"Name\""))).replaceAll("/", " / "),
          crupStr(aioS(mVariants("\"Sku\""))),
          crupStr(aioS(mVariants("\"Fsc\""))),
          crupStr(aioS(mVariants("\"Type\""))),
          crupStr(aioS(mVariants("\"Image\"")))
        )        
    }) 
  }).flatten

  def product = {
    val p = aioMs(all("\"Product\""))
    (
      crupStr(aioS(p("\"ProfileNumber\""))),
      aioDI(p("\"Id\"")),
      crupStr(aioS(all("\"Description\""))),
      crupStr(aioS(all("\"Ingredients\"")))
    )
  }

  def productV = {
    val p = aioMs(all("\"Product\""))
    val pn = crupStr(aioS(p("\"ProfileNumber\"")))
    val id = aioDI(p("\"Id\""))
    aioL(all("\"AllVariants\"")).map({
      case x => 
        val mVariants = aioMs(x)
        (
          pn,
          id,
          aioDSh(mVariants("\"Availability\"")), // доступность, разные небольшие числа, есть всегда
          crupStr(aioS(mVariants("\"DisplayLineNumber\""))),
          crupStr(aioS(mVariants("\"Name\""))).replaceAll("/", " / "),
          crupStr(aioS(mVariants("\"Sku\""))),
          crupStr(aioS(mVariants("\"Fsc\""))),
          crupStr(aioS(mVariants("\"Type\""))),
          crupStr(aioS(mVariants("\"Image\"")))
        )        
    })
  }

  def promo = aioL(all("\"Data\"")).map({
    case x => 
      val mPromo = aioMs(x)
      (
        if (mPromo("\"Url\"") != null) true else false,
        crupStr(aioS(mPromo("\"PromotionId\""))).toInt,
        crupStr(aioS(mPromo("\"Name\""))),
        tagP(crupStr(aioS(mPromo("\"Headline\"")))),
        tagP(crupStr(aioS(mPromo("\"BodyText\"")))),
        crupStr(aioS(mPromo("\"Image\"")))
      )
  })

  def promotions = if (all("\"ErrorMessage\"") == null) {
    (
      aioDI(data("\"PromotionId\"")),
      crupStr(aioS(data("\"PromoFullDesc\""))),
      aioDI(data("\"AwardProductId\"")),
      aioL(data("\"BuyList\"")).map(x => aioDI(x)),
      aioL(data("\"GetList\"")).map(x => aioDI(x)),
      aioS(data("\"AttachedCustomer\"")),
      aioD(data("\"ConditionMinAmount\"")),
      aioDI(data("\"ConditionProductId\"")),
      aioS(data("\"ConditionMaxQuantity\"")),
      aioDSh(data("\"DeliveryType\"")),
      aioDSh(data("\"PromotionListType\"")),
      aioDSh(data("\"PromotionType\"")),
    )
  } else (0, "", 0, List(), List(), "", 0.0, 0, "", 0, 0, 0)

}