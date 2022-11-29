CREATE TABLE countries_languages (
	countries_languages_id smallserial,
	countries_id smallint,
	languages_id smallint,
	sort smallint,
	PRIMARY KEY ("countries_languages_id")
);

ALTER TABLE countries_languages ADD CONSTRAINT countries_languages_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE countries_languages ADD CONSTRAINT countries_languages_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

/*
select countries_languages_id, countries_id, dirname, languages_id, languages.code 
FROM countries_languages INNER JOIN countries USING (countries_id) 
INNER JOIN languages USING (languages_id);

 countries_languages_id | countries_id |   dirname    | languages_id | code 
------------------------+--------------+--------------+--------------+------
                      1 |            1 | russia       |            1 | ru
                      2 |            2 | uk           |            2 | en
                      3 |            3 | spain        |            3 | es
                      4 |            4 | germany      |            4 | de
                      5 |            5 | italia       |            5 | it
                      6 |            6 | portugal     |            6 | pt
                      7 |            7 | bulgaria     |            7 | bg
                      8 |            8 | czech        |            8 | cs
                      9 |            9 | estonia      |            9 | et
                     10 |           10 | finland      |           10 | fi
                     11 |           11 | georgia      |           11 | ka
                     12 |           12 | greece       |           12 | el
                     13 |           13 | hungary      |           13 | hu
                     14 |           14 | lithuania    |           14 | lt
                     15 |           15 | latvia       |           15 | lv
                     16 |           16 | poland       |           16 | pl
                     17 |           17 | romania      |           17 | ro
                     18 |           18 | serbia       |           18 | sr
                     19 |           19 | slovakia     |           19 | sk
                     20 |           20 | turkey       |           20 | tr
                     21 |           21 | ukraine      |           21 | uk
                     22 |           22 | kazakhstan   |            1 | ru
                     23 |           22 | kazakhstan   |           22 | kk
                     24 |           23 | chili        |            3 | es
                     25 |           24 | ecuador      |            3 | es
                     26 |           25 | peru         |            3 | es
                     27 |           26 | colombia     |            3 | es
                     28 |           27 | india        |            2 | en
                     29 |           27 | india        |           23 | hi
                     30 |           28 | south_africa |            2 | en
*/

INSERT INTO countries_languages VALUES (DEFAULT, 1, 1, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 2, 2, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 3, 3, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 4, 4, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 5, 5, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 6, 6, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 7, 7, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 8, 8, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 9, 9, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 10, 10, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 11, 11, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 12, 12, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 13, 13, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 14, 14, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 15, 15, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 16, 16, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 17, 17, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 18, 18, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 19, 19, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 20, 20, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 21, 21, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 22, 1, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 22, 22, 1);
INSERT INTO countries_languages VALUES (DEFAULT, 23, 3, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 24, 3, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 25, 3, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 26, 3, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 27, 2, 0);
INSERT INTO countries_languages VALUES (DEFAULT, 27, 23, 1);
INSERT INTO countries_languages VALUES (DEFAULT, 28, 2, 0);
