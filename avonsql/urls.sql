CREATE TABLE urls (
	urls_id serial,
	countries_id smallint,
    languages_id smallint,
	id int,
	url varchar(255) UNIQUE,
	url_type varchar(255),
    parse_type smallint, -- 0 большинство стран, 1 США
    no_iteration boolean,
	PRIMARY KEY ("urls_id")
);

ALTER TABLE urls ADD CONSTRAINT urls_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE urls ADD CONSTRAINT urls_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);


INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 856, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 301, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 584, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 302, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 303, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 341, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 1002, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 555, 
    'https://my.avon.ru/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 1, 1, 19, 
    'https://my.avon.ru/api/specialoffersapi/getcategorypromotions?promoCategoryId=19', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 655, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:655', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 301, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 302, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 304, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 306, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 855, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:855', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 313, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:313', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 310, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 312, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 307, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 308, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 311, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:311', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 314, 
    'https://www.shopwithmyrep.co.uk//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:314', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 2, 2, 15, 
    'https://www.shopwithmyrep.co.uk/api/specialoffersapi/getcategorypromotions?promoCategoryId=15', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 301, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 302, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 303, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 304, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 309, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 306, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 307, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 308, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 310, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 312, 
    'https://www.avon.es/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 3, 3, 12, 
    'https://www.avon.es/api/specialoffersapi/getcategorypromotions?promoCategoryId=12', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 302, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 304, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 303, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 305, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 5837, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5837', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 310, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 308, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 539, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:539', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 309, 
    'https://www.avon.de/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 4, 4, 81, 
    'https://www.avon.de/api/specialoffersapi/getcategorypromotions?promoCategoryId=81', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 301, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 302, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 303, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 304, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 309, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 657, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:657', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 306, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 307, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 308, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 310, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 312, 
    'https://www.avon.it/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 5, 5, 1, 
    'https://www.avon.it/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,301, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,302, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,303, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,304, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,309, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,304, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,309, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,306, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,307, 
    'https://www.avon.com.pt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:307', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 6, 6,23, 
    'https://www.avon.com.pt/api/specialoffersapi/getcategorypromotions?promoCategoryId=23', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 302, 
    'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 304, 
    'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 305, 
    'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 309, 
    'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 310, 
    'https://www.avon.bg/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 7, 7, 6, 
    'https://www.avon.bg/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 303, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 302, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 304, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 305, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 306, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 310, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 308, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 309, 
    'https://www.avon.cz/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 8, 8, 15, 
    'https://www.avon.cz/api/specialoffersapi/getcategorypromotions?promoCategoryId=15', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 5661, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5661', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 3456, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3456', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 3472, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3472', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 3476, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3476', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 1604, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1604', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 1163, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1163', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 3473, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:3473', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 771, 
    'https://my.avon.ee/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:771', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 9, 9, 113, 
    'https://my.avon.ee/api/specialoffersapi/getcategorypromotions?promoCategoryId=113', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 302, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 304, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 306, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 303, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 305, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 309, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 310, 
    'https://www.avon.fi/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 10, 10, 6, 
    'https://www.avon.fi/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 856, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 301, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 584, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 302, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 303, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 341, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 555, 
    'https://my.avon.ge/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 11, 11, 22, 
    'https://my.avon.ge/api/specialoffersapi/getcategorypromotions?promoCategoryId=22', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 301, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 302, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 303, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 304, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 309, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 306, 
    'https://www.avoncosmetics.gr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 12, 12, 34, 
    'https://www.avoncosmetics.gr/api/specialoffersapi/getcategorypromotions?promoCategoryId=34', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 302, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 5676, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:5676', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 304, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 305, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 306, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 309, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 310, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 308, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 539, 
    'https://avononline.avon.hu/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:539', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 13, 13, 76, 
    'https://avononline.avon.hu/api/specialoffersapi/getcategorypromotions?promoCategoryId=76', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 302, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 303, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 304, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 306, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 305, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 309, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 310, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 14, 141, 
    'https://www.avon.lt/api/specialoffersapi/getcategorypromotions?promoCategoryId=141', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 4622, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:4622', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 1059, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1059', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 1060, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1060', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 2204, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:2204', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 2449, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:2449', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 4345, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:4345', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 6971, 
    'https://my.avon.lv/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:6971', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 15, 15, 106, 
    'https://my.avon.lv/api/specialoffersapi/getcategorypromotions?promoCategoryId=106', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 303, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 302, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 305, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 304, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 306, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 309, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 308, 
    'https://www.avon.pl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 16, 16, 6, 
    'https://www.avon.pl/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 303, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 302, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 304, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 305, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 309, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 310, 
    'https://www.avon.ro/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 17, 17, 11, 
    'https://www.avon.ro/api/specialoffersapi/getcategorypromotions?promoCategoryId=11', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 302, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 303, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 305, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 306, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 310, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 308, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 309, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 565, 
    'https://www.avon.rs/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:565', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 18, 18, 6, 
    'https://www.avon.rs/api/specialoffersapi/getcategorypromotions?promoCategoryId=6', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 303, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 302, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 304, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 305, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 306, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 310, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 308, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:308', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 309, 
    'https://avononline.avon.sk/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 19, 19, 47, 
    'https://avononline.avon.sk/api/specialoffersapi/getcategorypromotions?promoCategoryId=47', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 301, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 302, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 303, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 304, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 305, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 854, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:854', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 1204, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1204', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 1249, 
    'https://kozmetik.avon.com.tr/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1249', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 20, 20, 1, 
    'https://kozmetik.avon.com.tr/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 856, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 301, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 302, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 303, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 341, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 1002, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 555, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 21, 21, 584, 
    'https://my.avon.ua/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 303, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 301, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 584, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:584', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 856, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:856', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 302, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 341, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:341', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 1002, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:1002', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 555, 
    'https://my.kz.avon.com//Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:555', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 22, 1, 26, 
    'https://my.kz.avon.com/api/specialoffersapi/getcategorypromotions?promoCategoryId=26', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 481, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:481', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 482, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:482', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 483, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:483', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 485, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:485', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 486, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:486', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 487, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:487', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 489, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:489', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 23, 3, 607, 
    'https://www.avon.cl/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:607', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 303, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 304, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 541, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 575, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 309, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 310, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 312, 
    'https://www.avon.com.ec/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 24, 3, 3, 
    'https://www.avon.com.ec/api/specialoffersapi/getcategorypromotions?promoCategoryId=3', 
    'promo', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 303, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 304, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 541, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 575, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 309, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 310, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 312, 
    'https://www.avon.com.pe/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 25, 3, 2, 
    'https://www.avon.com.pe/api/specialoffersapi/getcategorypromotions?promoCategoryId=2', 
    'promo', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 303, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 304, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 541, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:541', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 575, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:575', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 309, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 310, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 312, 
    'https://www.avon.co/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:312', 
    'main', 0, false
);

INSERT INTO urls VALUES (
    DEFAULT, 26, 3, 1, 
    'https://www.avon.co/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
    'promo', 0, false
);
*/

INSERT INTO urls VALUES (
    DEFAULT, 27, 2, 301, 
    'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 27, 2, 302, 
    'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 27, 2, 304, 
    'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 27, 2, 303, 
    'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 27, 2, 373, 
    'https://www.avon.co.in/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:373', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 301, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:301', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 302, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 304, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 305, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 303, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 306, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 433, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:433', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 653, 
    'https://my.avon.co.za/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:653', 
    'main', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 28, 2, 1, 
    'https://my.avon.co.za/api/specialoffersapi/getcategorypromotions?promoCategoryId=1', 
    'promo', 0, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 718, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/718/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 301, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/301/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 302, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/302/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 303, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/303/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 1158, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/1158/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 1211, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/1211/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 304, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/304/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 695, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/695/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 584, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/584/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 1021, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/1021/top-products', 
    'main', 1, true
);

INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 309, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/309/top-products', 
    'main', 1, true
);


INSERT INTO urls VALUES (
    DEFAULT, 29, 2, 307, 
    'https://prod-ecom-custapi-aws.avon.com/v1/avon/product/category/307/top-products', 
    'main', 1, true
);





