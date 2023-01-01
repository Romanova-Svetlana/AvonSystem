CREATE TABLE urls_items (
	urls_items_id serial,
	countries_id smallint,
	languages_id smallint,
	id int,
	url varchar(255),
	url_type varchar(255),
	parse_type smallint, -- 0 большинство стран, 1 США
	date_add int,
	iteration smallint, -- положительное число - номер итерации, 0 скачено, -1 невозможно скачать
	date_iteration int,
	no_iteration boolean,
	PRIMARY KEY ("urls_items_id"),
	UNIQUE (url, date_add)
);

ALTER TABLE urls_items ADD CONSTRAINT urls_items_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE urls_items ADD CONSTRAINT urls_items_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

