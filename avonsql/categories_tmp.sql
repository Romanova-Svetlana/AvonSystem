CREATE TABLE categories_tmp (
	categories_id serial,
	countries_id smallint,
	languages_id smallint,
	id int,
	name varchar(255),
	search_words varchar(255),
	PRIMARY KEY (categories_id)
);

ALTER TABLE categories_tmp ADD CONSTRAINT categories_tmp_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE categories_tmp ADD CONSTRAINT categories_tmp_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

CREATE TABLE categories_parent_tmp (
	categories_parent_id serial,
	categories_id int,
	parent_id int,
	PRIMARY KEY (categories_parent_id)
);

ALTER TABLE categories_parent_tmp ADD CONSTRAINT categories_parent_tmp_fk_categories_id 
FOREIGN KEY (categories_id) REFERENCES categories_tmp(categories_id);

ALTER TABLE categories_parent_tmp ADD CONSTRAINT categories_parent_tmp_fk_parent_id 
FOREIGN KEY (parent_id) REFERENCES categories_tmp(categories_id);

