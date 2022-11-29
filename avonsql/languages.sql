CREATE TABLE languages (
	languages_id smallserial,
	name varchar(255),
	name_en varchar(255),
	code varchar(5),
	PRIMARY KEY ("languages_id")
);

/*
 languages_id |    name    |  name_en   | code 
--------------+------------+------------+------
            1 | Русский    | Russian    | ru
            2 | English    | English    | en
            3 | Español    | Spanish    | es
            4 | Deutsch    | Deutsch    | de
            5 | Italiana   | Italian    | it
            6 | Português  | Portuguese | pt
            7 | Български  | Bulgarian  | bg
            8 | Čeština    | Czech      | cs
            9 | Eesti      | Estonian   | et
           10 | Suomen     | Finnish    | fi
           11 | ქართული    | Georgian   | ka
           12 | Ελληνική   | Greek      | el
           13 | Magyar     | Hungarian  | hu
           14 | Lietuvių   | Lithuanian | lt
           15 | Latviski   | Latvian    | lv
           16 | Polski     | Polish     | pl
           17 | Română     | Romanian   | ro
           18 | Српски     | Serbian    | sr
           19 | Slovenský  | Slovak     | sk
           20 | Türk       | Turkish    | tr
           21 | Українська | Ukrainian  | uk
           22 | Қазақ      | Kazakh     | kk
           23 | हिन्दी      | Hindi      | hi
*/

INSERT INTO languages VALUES (DEFAULT, 'Русский', 'Russian', 'ru');
INSERT INTO languages VALUES (DEFAULT, 'English', 'English', 'en');
INSERT INTO languages VALUES (DEFAULT, 'Español', 'Spanish', 'es');
INSERT INTO languages VALUES (DEFAULT, 'Deutsch', 'Deutsch', 'de');
INSERT INTO languages VALUES (DEFAULT, 'Italiana', 'Italian', 'it');
INSERT INTO languages VALUES (DEFAULT, 'Português', 'Portuguese', 'pt');
INSERT INTO languages VALUES (DEFAULT, 'Български', 'Bulgarian', 'bg');
INSERT INTO languages VALUES (DEFAULT, 'Čeština', 'Czech', 'cs');
INSERT INTO languages VALUES (DEFAULT, 'Eesti', 'Estonian', 'et');
INSERT INTO languages VALUES (DEFAULT, 'Suomen', 'Finnish', 'fi');
INSERT INTO languages VALUES (DEFAULT, 'ქართული', 'Georgian', 'ka');
INSERT INTO languages VALUES (DEFAULT, 'Ελληνική', 'Greek', 'el');
INSERT INTO languages VALUES (DEFAULT, 'Magyar', 'Hungarian', 'hu');
INSERT INTO languages VALUES (DEFAULT, 'Lietuvių', 'Lithuanian', 'lt');
INSERT INTO languages VALUES (DEFAULT, 'Latviski', 'Latvian', 'lv');
INSERT INTO languages VALUES (DEFAULT, 'Polski', 'Polish', 'pl');
INSERT INTO languages VALUES (DEFAULT, 'Română', 'Romanian', 'ro');
INSERT INTO languages VALUES (DEFAULT, 'Српски', 'Serbian', 'sr');
INSERT INTO languages VALUES (DEFAULT, 'Slovenský', 'Slovak', 'sk');
INSERT INTO languages VALUES (DEFAULT, 'Türk', 'Turkish', 'tr');
INSERT INTO languages VALUES (DEFAULT, 'Українська', 'Ukrainian', 'uk');
INSERT INTO languages VALUES (DEFAULT, 'Қазақ', 'Kazakh', 'kk');
INSERT INTO languages VALUES (DEFAULT, 'हिन्दी', 'Hindi', 'hi');
