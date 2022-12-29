CREATE TABLE promotions_tmp (
	promotions_id serial,
	countries_id smallint,
	languages_id smallint,
	url boolean,
	id int,
	name varchar(255),
	head_line varchar(255),
	body_text varchar(510),
	image varchar(255),
	PRIMARY KEY (promotions_id)
);

ALTER TABLE promotions_tmp ADD CONSTRAINT promotions_tmp_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE promotions_tmp ADD CONSTRAINT promotions_tmp_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

CREATE TABLE promotions_daily_tmp (
	promotions_daily_id serial,
	promotions_id int,
	date_check int,
	PRIMARY KEY (promotions_daily_id),
	UNIQUE (promotions_id, date_check)
);

ALTER TABLE promotions_daily_tmp ADD CONSTRAINT promotions_daily_tmp_fk_promotions_id 
FOREIGN KEY (promotions_id) REFERENCES promotions_tmp(promotions_id);


