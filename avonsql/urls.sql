CREATE TABLE urls (
	urls_id serial,
	countries_urls_id smallint,
	id int,
	url varchar(255) UNIQUE,
	url_type varchar(255),
	PRIMARY KEY ("urls_id")
);

ALTER TABLE urls ADD CONSTRAINT urls_fk_countries_urls_id 
FOREIGN KEY (countries_urls_id) REFERENCES countries_urls(countries_urls_id);

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
    DEFAULT, 14, 302, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:302', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 303, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:303', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 304, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:304', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 306, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:306', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 305, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:305', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 309, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:309', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 310, 
    'https://www.avon.lt/Api/SearchApi/SearchProducts?q=&getVariants=true&isDesktop=true&forceDatabase=true&facets=0:310', 
    'main'
);

INSERT INTO urls VALUES (
    DEFAULT, 14, 141, 
    'https://www.avon.lt/api/specialoffersapi/getcategorypromotions?promoCategoryId=141', 
    'promo'
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

/*
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
*/

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

