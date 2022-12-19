CREATE TABLE countries_urls (
	countries_urls_id smallserial,
	countries_id smallint,
	languages_id smallint,
	url varchar(255),
	img_url varchar(255),
	product_url varchar(255),
	promotion_url varchar(255),
	PRIMARY KEY (countries_urls_id)
);

ALTER TABLE countries_urls ADD CONSTRAINT countries_urls_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE countries_urls ADD CONSTRAINT countries_urls_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

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
                29 |           29 | en       | https://www.avon.com/
*/

INSERT INTO countries_urls VALUES (
    DEFAULT, 1, 1, 'https://my.avon.ru/', 
    'https://my.avon.ru/assets/ru-ru/images/', 
    'https://my.avon.ru/tovar/', 
    'https://my.avon.ru/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 2, 2, 'https://www.shopwithmyrep.co.uk/', 
    'https://www.shopwithmyrep.co.uk//assets/en-gb/images/', 
    'https://www.shopwithmyrep.co.uk/product/', 
    'https://www.shopwithmyrep.co.uk//api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 3, 3, 'https://www.avon.es/', 
    'https://www.avon.es/assets/es-es/images/', 
    'https://www.avon.es/product/', 
    'https://www.avon.es/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 4, 4, 'https://www.avon.de/', 
    'https://www.avon.de/assets/de-de/images/', 
    'https://www.avon.de/product/', 
    'https://www.avon.de/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 5, 5, 'https://www.avon.it/', 
    'https://www.avon.it/assets/it-it/images/', 
    'https://www.avon.it/product/', 
    'https://www.avon.it/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 6, 6, 'https://www.avon.com.pt/', 
    'https://www.avon.com.pt/assets/pt-pt/images/', 
    'https://www.avon.com.pt/product/', 
    'https://www.avon.com.pt/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 7, 7, 'https://www.avon.bg/', 
    'https://www.avon.bg/assets/bg-bg/images/', 
    'https://www.avon.bg/prodykt/', 
    'https://www.avon.bg/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 8, 8, 'https://www.avon.cz/', 
    'https://www.avon.cz/assets/cs-cz/images/', 
    'https://www.avon.cz/vyrobek/', 
    'https://www.avon.cz/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 9, 9, 'https://my.avon.ee/', 
    'https://my.avon.ee/assets/et-ee/images/', 
    'https://my.avon.ee/toode/', 
    'https://my.avon.ee/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 10, 10, 'https://www.avon.fi/', 
    'https://www.avon.fi/assets/fi-fi/images/', 
    'https://www.avon.fi/tuote/', 
    'https://www.avon.fi/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 11, 11, 'https://my.avon.ge/', 
    'https://my.avon.ge/assets/ka-ge/images/', 
    'https://my.avon.ge/product/', 
    'https://my.avon.ge/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 12, 12, 'https://www.avoncosmetics.gr/', 
    'https://www.avoncosmetics.gr/assets/el-gr/images/', 
    'https://www.avoncosmetics.gr/product/', 
    'https://www.avoncosmetics.gr/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 13, 13, 'https://avononline.avon.hu/', 
    'https://avononline.avon.hu/assets/hu-hu/images/', 
    'https://avononline.avon.hu/termek/', 
    'https://avononline.avon.hu/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 14, 14, 'https://my.avon.lt/', 
    'https://www.avon.lt/assets/lt-lt/images/', 
    'https://www.avon.lt/gaminys/', 
    'https://www.avon.lt/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 15, 15, 'https://my.avon.lv/', 
    'https://my.avon.lv/assets/lv-lv/images/', 
    'https://my.avon.lv/produkts/', 
    'https://my.avon.lv/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 16, 16, 'https://www.avon.pl/', 
    'https://www.avon.pl/assets/pl-pl/images/', 
    'https://www.avon.pl/produkt/', 
    'https://www.avon.pl/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 17, 17, 'https://www.avon.ro/', 
    'https://www.avon.ro/assets/ro-ro/images/', 
    'https://www.avon.ro/produs/', 
    'https://www.avon.ro/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 18, 18, 'https://www.avon.rs/', 
    'https://www.avon.rs/assets/sr-latn-rs/images/', 
    'https://www.avon.rs/proizvod/', 
    'https://www.avon.rs/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 19, 19, 'https://avononline.avon.sk/', 
    'https://avononline.avon.sk/assets/sk-sk/images/', 
    'https://avononline.avon.sk/vyrobok/', 
    'https://avononline.avon.sk/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 20, 20, 'https://kozmetik.avon.com.tr/', 
    'https://kozmetik.avon.com.tr/assets/tr-tr/images/', 
    'https://kozmetik.avon.com.tr/urun/', 
    'https://kozmetik.avon.com.tr/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 21, 21, 'https://my.avon.ua/', 
    'https://my.avon.ua/assets/uk-ua/images/', 
    'https://my.avon.ua/produkt/', 
    'https://my.avon.ua/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 22, 1, 'https://my.kz.avon.com/', 
    'https://my.kz.avon.com//assets/ru-kz/images/', 
    'https://my.kz.avon.com/tovar/', 
    'https://my.kz.avon.com/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 23, 3, 'https://www.avon.cl/', 
    'https://www.avon.cl/assets/es-cl/images/', 
    'https://www.avon.cl/product/', 
    ''
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 24, 3, 'https://www.avon.com.ec/', 
    'https://www.avon.com.ec/assets/es-ec/images/', 
    'https://www.avon.com.ec/product/', 
    'https://www.avon.com.ec/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 25, 3, 'https://www.avon.com.pe/', 
    'https://www.avon.com.pe/assets/es-pe/images/', 
    'https://www.avon.com.pe/product/', 
    'https://www.avon.com.pe/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 26, 3, 'https://www.avon.co/', 
    'https://www.avon.co/assets/es-co/images/', 
    'https://www.avon.co/product/', 
    'https://www.avon.co/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 27, 2, 'https://www.avon.co.in/', 
    'https://www.avon.co.in/assets/en-in/images/', 
    'https://www.avon.co.in/product/', 
    ''
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 28, 2, 'https://my.avon.co.za/', 
    'https://my.avon.co.za/assets/en-za/images/', 
    'https://my.avon.co.za/product/', 
    'https://my.avon.co.za/api/specialoffersapi/getdetails?promotionId='
);

INSERT INTO countries_urls VALUES (
    DEFAULT, 29, 2, 'https://www.avon.com/', 
    'https://www.avon.com/assets/', 
    'https://www.avon.com/product/', 
    ''
);
