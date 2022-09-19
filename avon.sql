	// TABLE country
	// country_id			Short 	-> Primary Key
	// name	 					String
	// name_en 				String
	// code 					String
	// url 						String
	// parse_type 		Byte
	// img_url 				String
	// product_url 		String
	// promotion_url 	String

		// TABLE url_tmp
	// url_tmp_id			Short 	-> Primary Key
	// country_id			Short		-> url_tmp.country_id = country.country_id
	// url_tmp.url 		String
	// url_type 			String
	// parse_type			Byte
	// num						Int
	// date_add				Date
	// iteration 			Byte
	// date_iteration	Date
	// no_iteration		Boolean

	// TABLE url
	// url_id				Short 	-> Primary Key
	// country_id		Short		-> country.country_id = url.country_id
	// url.url 	String
	// url_type 		String
	// parse_type		Byte
	// num					Int


-- СОЗДАНИЕ ТАБЛИЦ


CREATE TABLE tmp_countries ( -- страны
	countries_id smallserial,
	name varchar(255),
	name_en varchar(255),
	code varchar(255), -- код страны
	PRIMARY KEY ("countries_id")
);

CREATE TABLE tmp_countries_urls (
	countries_urls_id smallserial,
	countries_id smallint,
	language varchar(4),
	alternative_language boolean,
	url varchar(255),
	img_url(255),
	product_url(255),
	PRIMARY KEY ("countries_urls_id")
);

ALTER TABLE "tmp_countries_urls" ADD CONSTRAINT "tmp_countries_urls_fk_countries_id" 
FOREIGN KEY ("countries_id") REFERENCES "tmp_countries"("countries_id");

CREATE TABLE tmp_categories (
	categories_id serial,
	country_id smallint,
	name varchar(255),
	namemobile varchar(255),
	description varchar(255),
	searchwords varchar(255),
	slug varchar(255),
	id int,
	image varchar(255),
	categorytype int,
	active boolean,
	imagewidth int,
	parent_id int,
	PRIMARY KEY ("categories_id")
);

ALTER TABLE "tmp_categories" ADD CONSTRAINT "tmp_categories_fk_countries_id" 
FOREIGN KEY ("countries_id") REFERENCES "tmp_countries"("countries_id");

CREATE TABLE tmp_products ( -- продукты
	products_id serial,
	countries_id smallint, -- внешний ключ
	id int, -- main
	productid int, -- main, products
	name varchar(255), -- main, products
	slug varchar(255), -- main, products
	unitpricemeasureunit varchar(255), -- main, products
	unitpricetext varchar(255), -- main, products
	socialsharingdescription varchar(255), -- main, products
	shortdescription varchar(255), -- main, products
	istryitonproduct boolean, -- main, products
	shortname varchar(255), -- main, products
	conditional varchar(255), -- main, products
	marketingLabel1 varchar(255), -- main, products
	marketingLabel2 varchar(255), -- main, products
	customization varchar(255), -- main, products
	singlevariantfsc varchar(255), -- main, products
	singlevariantsku varchar(255), -- main, products
	containerinformation varchar(255), -- main, products
	priceperunitinformation varchar(255), -- main, products
	isconditional boolean(255), -- main, products
	conditionalclass varchar(255), -- main, products
	searchwords varchar(255), -- main, products
	profilenumber varchar(255), -- main, products
	hasactivevariant boolean, -- main, products
	badgeid varchar(255), -- main, products
	badgetext varchar(255), -- main, products
	metatitle varchar(255), -- main, products
	metadescription varchar(255), -- main, products
	category varchar(255), -- main, products
	brand varchar(255), -- main, products
	isshadevariant boolean, -- main, products
	issizevariant boolean, -- main, products
	media varchar(2040), -- products
	ingredients varchar(2040), -- products
	description varchar(2040), -- products
	shortdescription varchar(255), -- products
	PRIMARY KEY ("products_id")
);

ALTER TABLE "tmp_products" ADD CONSTRAINT "tmp_products_fk_countries_id" 
FOREIGN KEY ("countries_id") REFERENCES "tmp_countries"("countries_id");

CREATE TABLE tmp_products_variants (
	products_variants_id serial,
	products_id int,
	displaylinenumber varchar(255),
	name varchar(255),
	sku varchar(255),
	fsc varchar(255),
	type varchar(255),
	colorhex varchar(255),
	tryitonmakeupsku varchar(255),
	PRIMARY KEY ("tmp_products_variants_id")
);

ALTER TABLE "tmp_products_variants" ADD CONSTRAINT "tmp_products_variants_fk_products_id" 
FOREIGN KEY ("products_id") REFERENCES "tmp_products"("products_id");

CREATE TABLE tmp_products_variants_everyday (
	products_variants_everyday_id serial,
	products_variants_id int,
	availability int,
	isavailable boolean,
	availabilityreason varchar(255),
	quantity int,
	PRIMARY KEY ("tmp_products_variants_everyday_id")
);

ALTER TABLE "tmp_products_variants_everyday" ADD CONSTRAINT "tmp_products_variants_everyday_fk_products_variants_id" 
FOREIGN KEY ("products_variants_id") REFERENCES "tmp_products_variants"("products_variants_id");

CREATE TABLE tmp_products_everyday ( -- продукты каждый день
	products_everyday_id serial,
	products_id int,  -- внешний ключ
	date date, 
	availability int, -- main, products
	listprice decimal, -- main, products
	saleprice decimal, -- main, products
	unitprice decimal, -- main, products
	discountpriceformatted varchar(255), -- main, products
	isnew boolean, -- main, products
	isbestseller boolean, -- main, products
	salecaption varchar(255), -- main, products
	istryitonproduct boolean, -- main, products
	conditional varchar(255), -- main, products
	availabilityreason varchar(255), -- main, products
	isonsale boolean, -- main, products
	marketingLabel1 varchar(255), -- main, products
	marketingLabel2 varchar(255), -- main, products
	rating decimal, -- main, products
	customization varchar(255), -- main, products
	quantity int, -- main, products
	promotions varchar(255), -- main, products
	isconditional boolean(255), -- main, products
	conditionalclass varchar(255), -- main, products
	haspromotion boolean, -- main, products
	deliverytype int, -- main, products
	hasactivevariant boolean, -- main
	ratingcount int, -- main, products
	currency varchar(255), -- main, products
	isoutofstock boolean, -- main, products
	isnotavailable boolean, -- main, products
	PRIMARY KEY ("products_everyday_id")
);

ALTER TABLE "tmp_products_everyday" ADD CONSTRAINT "tmp_products_everyday_fk_products_id" 
FOREIGN KEY ("products_id") REFERENCES "tmp_products"("products_id");


----


CREATE TABLE countries ( -- страны
	countries_id smallserial,
	name varchar(255),
	name_en varchar(255),
	code varchar(5), -- код страны
	PRIMARY KEY ("countries_id")
);

INSERT INTO countries VALUES (DEFAULT, 'Россия', 'Russia', 'RU');
INSERT INTO countries VALUES (DEFAULT, 'UK', 'UK', 'GB');
INSERT INTO countries VALUES (DEFAULT, 'España', 'Spain', 'ES');
INSERT INTO countries VALUES (DEFAULT, 'Deutschland', 'Germany', 'DE');
INSERT INTO countries VALUES (DEFAULT, 'Italia', 'Italia', 'IT');
INSERT INTO countries VALUES (DEFAULT, 'Portugal', 'Portugal', 'PT');
INSERT INTO countries VALUES (DEFAULT, 'България', 'Bulgaria', 'BG');
INSERT INTO countries VALUES (DEFAULT, 'Česká republika', 'Czech', 'CZ');
INSERT INTO countries VALUES (DEFAULT, 'Eesti', 'Estonia', 'EE');
INSERT INTO countries VALUES (DEFAULT, 'Suomi', 'Finland', 'FI');
INSERT INTO countries VALUES (DEFAULT, 'საქართველოს', 'Georgia', 'GE');
INSERT INTO countries VALUES (DEFAULT, 'Ελλάδα', 'Greece', 'GR');
INSERT INTO countries VALUES (DEFAULT, 'Magyarország', 'Hungary', 'HU');
INSERT INTO countries VALUES (DEFAULT, 'Lietuva', 'Lithuania', 'LT');
INSERT INTO countries VALUES (DEFAULT, 'Latvija', 'Latvia', 'LV');
INSERT INTO countries VALUES (DEFAULT, 'Polska', 'Poland', 'PL');
INSERT INTO countries VALUES (DEFAULT, 'România', 'Romania', 'RO');
INSERT INTO countries VALUES (DEFAULT, 'Srbija', 'Serbia', 'RS');
INSERT INTO countries VALUES (DEFAULT, 'Slovensko', 'Slovakia', 'SK');
INSERT INTO countries VALUES (DEFAULT, 'Türkiye', 'Turkey', 'TR');
INSERT INTO countries VALUES (DEFAULT, 'Україна', 'Ukraine', 'UA');
INSERT INTO countries VALUES (DEFAULT, 'Казахстан', 'Kazakhstan', 'KZ');
INSERT INTO countries VALUES (DEFAULT, 'Chili', 'Chili', 'CL');
INSERT INTO countries VALUES (DEFAULT, 'Ecuador', 'Ecuador', 'EC');
INSERT INTO countries VALUES (DEFAULT, 'Perú', 'Peru', 'PE');
INSERT INTO countries VALUES (DEFAULT, 'Colombia', 'Colombia', 'CO');
INSERT INTO countries VALUES (DEFAULT, 'India', 'India', 'IN');
INSERT INTO countries VALUES (DEFAULT, 'South Africa', 'South Africa', 'ZA');

/*
 countries_id |      name       |   name_en    | code 
--------------+-----------------+--------------+------
            1 | Россия          | Russia       | RU
            2 | UK              | UK           | GB
            3 | España          | Spain        | ES
            4 | Deutschland     | Germany      | DE
            5 | Italia          | Italia       | IT
            6 | Portugal        | Portugal     | PT
            7 | България        | Bulgaria     | BG
            8 | Česká republika | Czech        | CZ
            9 | Eesti           | Estonia      | EE
           10 | Suomi           | Finland      | FI
           11 | საქართველოს     | Georgia      | GE
           12 | Ελλάδα          | Greece       | GR
           13 | Magyarország    | Hungary      | HU
           14 | Lietuva         | Lithuania    | LT
           15 | Latvija         | Latvia       | LV
           16 | Polska          | Poland       | PL
           17 | România         | Romania      | RO
           18 | Srbija          | Serbia       | RS
           19 | Slovensko       | Slovakia     | SK
           20 | Türkiye         | Turkey       | TR
           21 | Україна         | Ukraine      | UA
           22 | Казахстан       | Kazakhstan   | KZ
           23 | Chili           | Chili        | CL
           24 | Ecuador         | Ecuador      | EC
           25 | Perú            | Peru         | PE
           26 | Colombia        | Colombia     | CO
           27 | India           | India        | IN
           28 | South Africa    | South Africa | ZA
*/

CREATE TABLE countries_urls (
	countries_urls_id smallserial,
	countries_id smallint,
	language varchar(5),
	alternative_language boolean,
	url varchar(255),
	img_url varchar(255),
	product_url varchar(255),
	promotion_url varchar(255),
	PRIMARY KEY ("countries_urls_id")
);

ALTER TABLE "countries_urls" ADD CONSTRAINT "countries_urls_fk_countries_id" 
FOREIGN KEY ("countries_id") REFERENCES "countries"("countries_id");

INSERT INTO countries_urls VALUES (
	DEFAULT, 1, 'ru', false, 'https://my.avon.ru/', 
	'https://emear-static.avon.com/assets/ru-ru/images/', 
	'https://my.avon.ru/tovar/', 
	'https://my.avon.ru/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 2, 'en', false, 'https://www.shopwithmyrep.co.uk/', 
	'https://www.shopwithmyrep.co.uk//assets/en-gb/images/', 
	'https://www.shopwithmyrep.co.uk/product/', 
	'https://www.shopwithmyrep.co.uk//api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 3, 'es', false, 'https://www.avon.es/', 
	'https://www.avon.es/assets/es-es/images/', 
	'https://www.avon.es/product/', 
	'https://www.avon.es/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 4, 'de', false, 'https://www.avon.de/', 
	'https://www.avon.de/assets/de-de/images/', 
	'https://www.avon.de/product/', 
	'https://www.avon.de/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 5, 'it', false, 'https://www.avon.it/', 
	'https://www.avon.it/assets/it-it/images/', 
	'https://www.avon.it/product/', 
	'https://www.avon.it/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 6, 'pt', false, 'https://www.avon.com.pt/', 
	'https://www.avon.com.pt/assets/pt-pt/images/', 
	'https://www.avon.com.pt/product/', 
	'https://www.avon.com.pt/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 7, 'bg', false, 'https://www.avon.bg/', 
	'https://www.avon.bg/assets/bg-bg/images/', 
	'https://www.avon.bg/prodykt/', 
	'https://www.avon.bg/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 8, 'cs', false, 'https://www.avon.cz/', 
	'https://www.avon.cz/assets/cs-cz/images/', 
	'https://www.avon.cz/vyrobek/', 
	'https://www.avon.cz/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 9, 'et', false, 'https://my.avon.ee/', 
	'https://my.avon.ee/assets/et-ee/images/', 
	'https://my.avon.ee/toode/', 
	'https://my.avon.ee/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 10, 'fi', false, 'https://www.avon.fi/', 
	'https://www.avon.fi/assets/fi-fi/images/', 
	'https://www.avon.fi/tuote/', 
	'https://www.avon.fi/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 11, 'ka', false, 'https://my.avon.ge/', 
	'https://my.avon.ge/assets/ka-ge/images/', 
	'https://my.avon.ge/product/', 
	'https://my.avon.ge/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 12, 'el', false, 'https://www.avoncosmetics.gr/', 
	'https://www.avoncosmetics.gr/assets/el-gr/images/', 
	'https://www.avoncosmetics.gr/product/', 
	'https://www.avoncosmetics.gr/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 13, 'hu', false, 'https://avononline.avon.hu/', 
	'https://avononline.avon.hu/assets/hu-hu/images/', 
	'https://avononline.avon.hu/termek/', 
	'https://avononline.avon.hu/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 14, 'lt', false, 'https://my.avon.lt/', 
	'https://www.avon.lt/assets/lt-lt/images/', 
	'https://www.avon.lt/gaminys/', 
	'https://www.avon.lt/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 15, 'lv', false, 'https://my.avon.lv/', 
	'https://my.avon.lv/assets/lv-lv/images/', 
	'https://my.avon.lv/produkts/', 
	'https://my.avon.lv/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 16, 'pl', false, 'https://www.avon.pl/', 
	'https://www.avon.pl/assets/pl-pl/images/', 
	'https://www.avon.pl/produkt/', 
	'https://www.avon.pl/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 17, 'ro', false, 'https://www.avon.ro/', 
	'https://www.avon.ro/assets/ro-ro/images/', 
	'https://www.avon.ro/produs/', 
	'https://www.avon.ro/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 18, 'sr', false, 'https://www.avon.rs/', 
	'https://www.avon.rs/assets/sr-latn-rs/images/', 
	'https://www.avon.rs/proizvod/', 
	'https://www.avon.rs/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 19, 'sk', false, 'https://avononline.avon.sk/', 
	'https://avononline.avon.sk/assets/sk-sk/images/', 
	'https://avononline.avon.sk/vyrobok/', 
	'https://avononline.avon.sk/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 20, 'tr', false, 'https://kozmetik.avon.com.tr/', 
	'https://kozmetik.avon.com.tr/assets/tr-tr/images/', 
	'https://kozmetik.avon.com.tr/urun/', 
	'https://kozmetik.avon.com.tr/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 21, 'uk', false, 'https://my.avon.ua/', 
	'https://my.avon.ua/assets/uk-ua/images/', 
	'https://my.avon.ua/produkt/', 
	'https://my.avon.ua/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 22, 'ru', false, 'https://my.kz.avon.com/', 
	'https://my.kz.avon.com//assets/ru-kz/images/', 
	'https://my.kz.avon.com/tovar/', 
	'https://my.kz.avon.com/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 23, 'es', false, 'https://www.avon.cl/', 
	'https://www.avon.cl/assets/es-cl/images/', 
	'https://www.avon.cl/product/', 
	''
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 24, 'es', false, 'https://www.avon.com.ec/', 
	'https://www.avon.com.ec/assets/es-ec/images/', 
	'https://www.avon.com.ec/product/', 
	'https://www.avon.com.ec/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 25, 'es', false, 'https://www.avon.com.pe/', 
	'https://www.avon.com.pe/assets/es-pe/images/', 
	'https://www.avon.com.pe/product/', 
	'https://www.avon.com.pe/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 26, 'es', false, 'https://www.avon.co/', 
	'https://www.avon.co/assets/es-co/images/', 
	'https://www.avon.co/product/', 
	'https://www.avon.co/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 27, 'en', false, 'https://www.avon.co.in/', 
	'https://www.avon.co.in/assets/en-in/images/', 
	'https://www.avon.co.in/product/', 
	''
);

INSERT INTO countries_urls VALUES (
	DEFAULT, 28, 'en', false, 'https://my.avon.co.za/', 
	'https://my.avon.co.za/assets/en-za/images/', 
	'https://my.avon.co.za/product/', 
	'https://my.avon.co.za/api/specialoffersapi/getdetails?promotionId='
);

/*
 countries_urls_id | countries_id | language |               url                
-------------------+--------------+----------+----------------------------------
                 1 |            1 | ru       | https://my.avon.ru/
                 2 |            2 | en       | https://www.shopwithmyrep.co.uk/
                 3 |            3 | es       | https://www.avon.es/
                 4 |            4 | de       | https://www.avon.de/
                 5 |            5 | it       | https://www.avon.it/
                 6 |            6 | pt       | https://www.avon.com.pt/
                 7 |            7 | bg       | https://www.avon.bg/
                 8 |            8 | cs       | https://www.avon.cz/
                 9 |            9 | et       | https://my.avon.ee/
                10 |           10 | fi       | https://www.avon.fi/
                11 |           11 | ka       | https://my.avon.ge/
                12 |           12 | el       | https://www.avoncosmetics.gr/
                13 |           13 | hu       | https://avononline.avon.hu/
                14 |           14 | lt       | https://my.avon.lt/
                15 |           15 | lv       | https://my.avon.lv/
                16 |           16 | pl       | https://www.avon.pl/
                17 |           17 | ro       | https://www.avon.ro/
                18 |           18 | sr       | https://www.avon.rs/
                19 |           19 | sk       | https://avononline.avon.sk/
                20 |           20 | tr       | https://kozmetik.avon.com.tr/
                21 |           21 | uk       | https://my.avon.ua/
                22 |           22 | ru       | https://my.kz.avon.com/
                23 |           23 | es       | https://www.avon.cl/
                24 |           24 | es       | https://www.avon.com.ec/
                25 |           25 | es       | https://www.avon.com.pe/
                26 |           26 | es       | https://www.avon.co/
                27 |           27 | en       | https://www.avon.co.in/
                28 |           28 | en       | https://my.avon.co.za/
*/

CREATE TABLE urls (
	urls_id serial,
	countries_urls_id smallint,
	id int,
	url varchar(255) UNIQUE,
	url_type varchar(255),
	PRIMARY KEY ("urls_id")
);

ALTER TABLE "urls" ADD CONSTRAINT "urls_fk_countries_urls_id" 
FOREIGN KEY ("countries_urls_id") REFERENCES "countries_urls"("countries_urls_id");

INSERT INTO urls VALUES (
	DEFAULT, 1, 856, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 301, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 584, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 302, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 303, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 341, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 1002, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 555, 
	'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 1, 19, 
	'https://my.avon.ru/api/specialoffersapi/getcategorypromotions?promoCategoryId=19', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 655, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:655', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 301, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 302, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 304, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 306, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 855, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:855', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 313, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:313', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 310, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 312, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 307, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 308, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 311, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:311', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 314, 
	'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:314', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 2, 15, 
	'https://www.shopwithmyrep.co.uk/api/specialoffersapi/getcategorypromotions?promoCategoryId=15', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 301, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 302, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 303, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 304, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 309, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 306, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 307, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 308, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 310, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 312, 
	'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 3, 12, 
	'https://www.avon.es/api/specialoffersapi/getcategorypromotions?promoCategoryId=12', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 302, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 304, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 303, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 305, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 5837, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5837', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 310, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 308, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 539, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:539', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 309, 
	'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 4, 81, 
	'https://www.avon.de/api/specialoffersapi/getcategorypromotions?promoCategoryId=81', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 301, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 302, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 303, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 304, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 309, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 657, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:657', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 306, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 307, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 308, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 310, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 312, 
	'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 5, 1, 
	'https://www.avon.it/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 301, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 302, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 303, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 304, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 309, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 304, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 309, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 306, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 307, 
	'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 6, 23, 
	'https://www.avon.com.pt/api/specialoffersapi/getcategorypromotions?promoCategoryId=23', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 302, 
	'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 304, 
	'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 305, 
	'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 309, 
	'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 310, 
	'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 7, 6, 
	'https://www.avon.bg/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 303, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 302, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 304, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 305, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 306, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 310, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 308, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 309, 
	'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 8, 15, 
	'https://www.avon.cz/api/specialoffersapi/getcategorypromotions?promoCategoryId=15', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 5661, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5661', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 3456, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3456', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 3472, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3472', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 3476, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3476', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 1604, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1604', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 1163, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1163', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 3473, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3473', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 771, 
	'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:771', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 9, 113, 
	'https://my.avon.ee/api/specialoffersapi/getcategorypromotions?promoCategoryId=113', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 302, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 304, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 306, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 303, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 305, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 309, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 310, 
	'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 10, 6, 
	'https://www.avon.fi/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 856, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 301, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 584, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 302, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 303, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 341, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 555, 
	'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 11, 22, 
	'https://my.avon.ge/api/specialoffersapi/getcategorypromotions?promoCategoryId=22', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 301, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 302, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 303, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 304, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 309, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 306, 
	'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 12, 34, 
	'https://www.avoncosmetics.gr/api/specialoffersapi/getcategorypromotions?promoCategoryId=34', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 302, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 5676, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5676', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 304, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 305, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 306, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 309, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 310, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 308, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 539, 
	'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:539', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 13, 76, 
	'https://avononline.avon.hu/api/specialoffersapi/getcategorypromotions?promoCategoryId=76', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 14, 141, 
	'https://www.avon.lt/api/specialoffersapi/getcategorypromotions?promoCategoryId=141', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 302, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 303, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 304, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 306, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 305, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 309, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 310, 
	'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 4622, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:4622', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 1059, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1059', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 1060, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1060', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 2204, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:2204', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 2449, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:2449', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 4345, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:4345', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 6971, 
	'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:6971', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 15, 106, 
	'https://my.avon.lv/api/specialoffersapi/getcategorypromotions?promoCategoryId=106', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 303, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 302, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 305, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 304, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 306, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 309, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 308, 
	'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 16, 6, 
	'https://www.avon.pl/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 303, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 302, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 304, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 305, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 309, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 310, 
	'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 17, 11, 
	'https://www.avon.ro/api/specialoffersapi/getcategorypromotions?promoCategoryId=11', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 302, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 303, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 305, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 306, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 310, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 308, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 309, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 565, 
	'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:565', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 18, 6, 
	'https://www.avon.rs/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 303, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 302, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 304, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 305, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 306, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 310, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 308, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 309, 
	'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 19, 47, 
	'https://avononline.avon.sk/api/specialoffersapi/getcategorypromotions?promoCategoryId=47', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 301, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 302, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 303, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 304, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 305, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 854, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:854', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 1204, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1204', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 1249, 
	'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1249', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 20, 1, 
	'https://kozmetik.avon.com.tr/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 856, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 301, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 302, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 303, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 341, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 1002, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 555, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 21, 584, 
	'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 303, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 301, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 584, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 856, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 302, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 341, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 1002, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 555, 
	'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 22, 26, 
	'https://my.kz.avon.com/api/specialoffersapi/getcategorypromotions?promoCategoryId=26', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 481, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:481', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 482, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:482', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 483, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:483', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 485, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:485', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 486, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:486', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 487, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:487', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 489, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:489', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 23, 607, 
	'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:607', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 303, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 304, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 541, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 575, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 309, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 310, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 312, 
	'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 24, 3, 
	'https://www.avon.com.ec/api/specialoffersapi/getcategorypromotions?promoCategoryId=3', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 303, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 304, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 541, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 575, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 309, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 310, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 312, 
	'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 25, 2, 
	'https://www.avon.com.pe/api/specialoffersapi/getcategorypromotions?promoCategoryId=2', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 303, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 304, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 541, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 575, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 309, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 310, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 312, 
	'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 26, 1, 
	'https://www.avon.co/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
	'promo'
);

INSERT INTO urls VALUES (
	DEFAULT, 27, 301, 
	'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 27, 302, 
	'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 27, 304, 
	'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 27, 303, 
	'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 27, 373, 
	'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:373', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 301, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 302, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 304, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 305, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 303, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 306, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 433, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:433', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 653, 
	'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:653', 
	'main'
);

INSERT INTO urls VALUES (
	DEFAULT, 28, 1, 
	'https://my.avon.co.za/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
	'promo'
);








 url_id | country_id | num  |
 url
  url_type | parse_type 



url_tmp_id 
country_id 
num
url                                        |  
url_type
parse_type
date_add
iteration
date_iteration
no_iteration 