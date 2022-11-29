CREATE TABLE urls_items (
	urls_items_id serial,
	countries_urls_id smallint,
	id int,
	url varchar(255),
	url_type varchar(255),
	date_add date,
	iteration smallint,
	date_iteration date,
	no_iteration boolean,
	PRIMARY KEY ("urls_items_id")
);

ALTER TABLE urls_items ADD CONSTRAINT urls_items_fk_countries_urls_id 
FOREIGN KEY (countries_urls_id) REFERENCES countries_urls(countries_urls_id);

