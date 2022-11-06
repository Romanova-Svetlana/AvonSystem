CREATE TABLE languages (
	languages_id smallserial,
	name varchar(255),
	name_en varchar(255),
	code varchar(5),
	PRIMARY KEY ("languages_id")
);

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

CREATE TABLE countries ( -- страны
	countries_id smallserial,
	dirname varchar(100),
	code varchar(5), -- код страны
	PRIMARY KEY ("countries_id")
);

INSERT INTO countries VALUES (DEFAULT, 'russia', 'RU');
INSERT INTO countries VALUES (DEFAULT, 'uk', 'GB');
INSERT INTO countries VALUES (DEFAULT, 'spain', 'ES');
INSERT INTO countries VALUES (DEFAULT, 'germany', 'DE');
INSERT INTO countries VALUES (DEFAULT, 'italia', 'IT');
INSERT INTO countries VALUES (DEFAULT, 'portugal', 'PT');
INSERT INTO countries VALUES (DEFAULT, 'bulgaria', 'BG');
INSERT INTO countries VALUES (DEFAULT, 'czech', 'CZ');
INSERT INTO countries VALUES (DEFAULT, 'estonia', 'EE');
INSERT INTO countries VALUES (DEFAULT, 'finland', 'FI');
INSERT INTO countries VALUES (DEFAULT, 'georgia', 'GE');
INSERT INTO countries VALUES (DEFAULT, 'greece', 'GR');
INSERT INTO countries VALUES (DEFAULT, 'hungary', 'HU');
INSERT INTO countries VALUES (DEFAULT, 'lithuania', 'LT');
INSERT INTO countries VALUES (DEFAULT, 'latvia', 'LV');
INSERT INTO countries VALUES (DEFAULT, 'poland', 'PL');
INSERT INTO countries VALUES (DEFAULT, 'romania', 'RO');
INSERT INTO countries VALUES (DEFAULT, 'serbia', 'RS');
INSERT INTO countries VALUES (DEFAULT, 'slovakia', 'SK');
INSERT INTO countries VALUES (DEFAULT, 'turkey', 'TR');
INSERT INTO countries VALUES (DEFAULT, 'ukraine', 'UA');
INSERT INTO countries VALUES (DEFAULT, 'kazakhstan', 'KZ');
INSERT INTO countries VALUES (DEFAULT, 'chili', 'CL');
INSERT INTO countries VALUES (DEFAULT, 'ecuador', 'EC');
INSERT INTO countries VALUES (DEFAULT, 'peru', 'PE');
INSERT INTO countries VALUES (DEFAULT, 'colombia', 'CO');
INSERT INTO countries VALUES (DEFAULT, 'india', 'IN');
INSERT INTO countries VALUES (DEFAULT, 'south_africa', 'ZA');

/*
 countries_id |   dirname    | code 
--------------+--------------+------
            1 | russia       | RU
            2 | uk           | GB
            3 | spain        | ES
            4 | germany      | DE
            5 | italia       | IT
            6 | portugal     | PT
            7 | bulgaria     | BG
            8 | czech        | CZ
            9 | estonia      | EE
           10 | finland      | FI
           11 | georgia      | GE
           12 | greece       | GR
           13 | hungary      | HU
           14 | lithuania    | LT
           15 | latvia       | LV
           16 | poland       | PL
           17 | romania      | RO
           18 | serbia       | RS
           19 | slovakia     | SK
           20 | turkey       | TR
           21 | ukraine      | UA
           22 | kazakhstan   | KZ
           23 | chili        | CL
           24 | ecuador      | EC
           25 | peru         | PE
           26 | colombia     | CO
           27 | india        | IN
           28 | south_africa | ZA
*/

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

CREATE TABLE countries_names (
	countries_names_id smallserial,
	name varchar(100),
	countries_id smallint,
	languages_id smallint,
	PRIMARY KEY ("countries_names_id")
);

ALTER TABLE countries_names ADD CONSTRAINT countries_names_fk_countries_id 
FOREIGN KEY (countries_id) REFERENCES countries(countries_id);

ALTER TABLE countries_names ADD CONSTRAINT countries_names_fk_languages_id 
FOREIGN KEY (languages_id) REFERENCES languages(languages_id);

INSERT INTO countries_names VALUES (DEFAULT, 'Россия', 1, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Великобритания', 2, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Испания', 3, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Германия', 4, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Италия', 5, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Португалия', 6, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Болгария', 7, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Чехия', 8, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Эстония', 9, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Финляндия', 10, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Грузия', 11, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Греция', 12, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Венгрия', 13, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Литва', 14, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Латвия', 15, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Польша', 16, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Румыния', 17, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Сербия', 18, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Словакия', 19, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Турция', 20, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Украина', 21, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Казахстан', 22, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Чили', 23, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Эквадор', 24, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Перу', 25, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Колумбия', 26, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Индия', 27, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'ЮАР', 28, 1);
INSERT INTO countries_names VALUES (DEFAULT, 'Russia', 1, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'UK', 2, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Spain', 3, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Germany', 4, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Italia', 5, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugal', 6, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaria', 7, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Czech', 8, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonia', 9, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Finland', 10, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Greece', 12, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Hungary', 13, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Lithuania', 14, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Latvia', 15, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Poland', 16, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Romania', 17, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovakia', 19, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Turkey', 20, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraine', 21, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazakhstan', 22, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Chili', 23, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Colombia', 26, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'South Africa', 28, 2);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusia', 1, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Gran Bretaña', 2, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'España', 3, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Alemania', 4, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Italia', 5, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugal', 6, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaria', 7, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Checo', 8, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonia', 9, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlandia', 10, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Grecia', 12, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Hungría', 13, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Lituania', 14, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Letonia', 15, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Polonia', 16, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumania', 17, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Eslovaquia', 19, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Pavo', 20, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Ucrania', 21, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazajstán', 22, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Perú', 25, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Colombia', 26, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Sudáfrica', 28, 3);
INSERT INTO countries_names VALUES (DEFAULT, 'Russland', 1, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Großbritannien', 2, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Spanien', 3, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Deutschland', 4, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Italien', 5, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugal', 6, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgarien', 7, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Tschechische Republik', 8, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Estland', 9, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Finnland', 10, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Griechenland', 12, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Ungarn', 13, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Litauen', 14, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Lettland', 15, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Polen', 16, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumänien', 17, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbien', 18, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Slowakei', 19, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Truthahn', 20, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraine', 21, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Kasachstan', 22, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbien', 26, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Indien', 27, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Südafrika', 28, 4);
INSERT INTO countries_names VALUES (DEFAULT, 'Russia', 1, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Gran Bretagna', 2, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Spagna', 3, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Germania', 4, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Italia', 5, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Portogallo', 6, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaria', 7, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Ceco', 8, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonia', 9, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlandia', 10, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Grecia', 12, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Ungheria', 13, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Lituania', 14, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Lettonia', 15, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Polonia', 16, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Romania', 17, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovacchia', 19, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Tacchino', 20, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Ucraina', 21, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazakistan', 22, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Perù', 25, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Colombia', 26, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Sud Africa', 28, 5);
INSERT INTO countries_names VALUES (DEFAULT, 'Rússia', 1, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Grã Bretanha', 2, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Espanha', 3, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Alemanha', 4, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Itália', 5, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugal', 6, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgária', 7, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Tcheco', 8, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Estônia', 9, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlândia', 10, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Geórgia', 11, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Grécia', 12, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Hungria', 13, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Lituânia', 14, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Letônia', 15, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Polônia', 16, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Romênia', 17, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Sérvia', 18, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Eslováquia', 19, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 20, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Ucrânia', 21, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Cazaquistão', 22, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Equador', 24, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Colômbia', 26, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Índia', 27, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'África do Sul', 28, 6);
INSERT INTO countries_names VALUES (DEFAULT, 'Русия', 1, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Великобритания', 2, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Испания', 3, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Германия', 4, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Италия', 5, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Португалия', 6, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'България', 7, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Чехия', 8, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Естония', 9, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Финландия', 10, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Грузия', 11, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Гърция', 12, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Унгария', 13, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Литва', 14, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Латвия', 15, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Полша', 16, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Румъния', 17, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Сърбия', 18, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Словакия', 19, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Турция', 20, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Украйна', 21, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Казахстан', 22, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Чили', 23, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Еквадор', 24, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Перу', 25, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Колумбия', 26, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Индия', 27, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Южна Африка', 28, 7);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusko', 1, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Velká Británie', 2, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Španělsko', 3, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Německo', 4, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Itálie', 5, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugalsko', 6, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulharsko', 7, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Česká republika', 8, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonsko', 9, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Finsko', 10, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruzie', 11, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Řecko', 12, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Maďarsko', 13, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Litva', 14, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Lotyšsko', 15, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Polsko', 16, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumunsko', 17, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Srbsko', 18, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovensko', 19, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Krocan', 20, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukrajina', 21, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazachstán', 22, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekvádor', 24, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbie', 26, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Indie', 27, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Jižní Afrika', 28, 8);
INSERT INTO countries_names VALUES (DEFAULT, 'Venemaa', 1, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Suurbritannia', 2, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Hispaania', 3, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Saksamaa', 4, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Itaalia', 5, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugal', 6, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaaria', 7, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Tšehhi', 8, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Eesti', 9, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Soome', 10, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruusia', 11, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Kreeka', 12, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Ungari', 13, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Leedu', 14, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Läti', 15, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Poola', 16, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumeenia', 17, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovakkia', 19, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Türgi', 20, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraina', 21, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Kasahstan', 22, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Tšiili', 23, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Peruu', 25, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbia', 26, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Lõuna-Aafrika', 28, 9);
INSERT INTO countries_names VALUES (DEFAULT, 'Venäjä', 1, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Iso-Britannia', 2, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Espanja', 3, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Saksa', 4, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Italia', 5, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugali', 6, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaria', 7, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Tšekki', 8, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Viro', 9, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Suomi', 10, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Kreikka', 12, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Unkari', 13, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Liettua', 14, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Latvia', 15, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Puola', 16, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Romania', 17, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovakia', 19, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Turkki', 20, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraina', 21, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazakstan', 22, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbia', 26, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Intia', 27, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'Etelä-Afrikka', 28, 10);
INSERT INTO countries_names VALUES (DEFAULT, 'რუსეთი', 1, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'დიდი ბრიტანეთის სამეფო', 2, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ესპანეთი', 3, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'გერმანია', 4, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'იტალია', 5, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'პორტუგალია', 6, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ბულგარეთი', 7, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ჩეხური', 8, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ესტონეთი', 9, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ფინეთი', 10, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'საქართველოს', 11, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'საბერძნეთი', 12, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'უნგრეთი', 13, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ლიტვა', 14, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ლატვია', 15, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'პოლონეთი', 16, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'რუმინეთი', 17, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'სერბეთი', 18, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'სლოვაკეთი', 19, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'თურქეთი', 20, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'უკრაინა', 21, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ყაზახეთი', 22, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ჩილე', 23, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ეკვადორი', 24, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'პერუს', 25, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'კოლუმბია', 26, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'ინდოეთი', 27, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'სამხრეთ აფრიკის რესპუბლიკა', 28, 11);
INSERT INTO countries_names VALUES (DEFAULT, 'Ρωσία', 1, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Μεγάλη Βρετανία', 2, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ισπανία', 3, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Γερμανία', 4, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ιταλία', 5, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Πορτογαλία', 6, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Βουλγαρία', 7, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Τσέχος', 8, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Εσθονία', 9, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Φινλανδία', 10, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Γεωργία', 11, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ελλάδα', 12, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ουγγαρία', 13, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Λιθουανία', 14, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Λετονία', 15, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Πολωνία', 16, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ρουμανία', 17, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Σερβία', 18, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Σλοβακία', 19, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Τουρκία', 20, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ουκρανία', 21, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Καζακστάν', 22, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Χιλή', 23, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Εκουαδόρ', 24, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Περού', 25, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Κολομβία', 26, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Ινδία', 27, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Νότια Αφρική', 28, 12);
INSERT INTO countries_names VALUES (DEFAULT, 'Oroszország', 1, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Nagy-Britannia', 2, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Spanyolország', 3, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Németország', 4, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Olaszország', 5, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugália', 6, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgária', 7, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Cseh', 8, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Észtország', 9, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Finnország', 10, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Grúzia', 11, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Görögország', 12, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Magyarország', 13, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Litvánia', 14, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Lettország', 15, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Lengyelország', 16, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Románia', 17, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Szerbia', 18, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Szlovákia', 19, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Pulyka', 20, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukrajna', 21, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazahsztán', 22, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Colombia', 26, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Dél-Afrika', 28, 13);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusija', 1, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Didžioji Britanija', 2, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Ispanija', 3, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Vokietija', 4, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Italija', 5, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugalija', 6, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgarija', 7, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Čekų', 8, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Estija', 9, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Suomija', 10, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruzija', 11, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Graikija', 12, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Vengrija', 13, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Lietuva', 14, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Latvija', 15, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Lenkija', 16, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumunija', 17, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbija', 18, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovakija', 19, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Turkija', 20, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraina', 21, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazachstanas', 22, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Čilė', 23, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekvadoras', 24, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbija', 26, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Indija', 27, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Pietų Afrika', 28, 14);
INSERT INTO countries_names VALUES (DEFAULT, 'Krievija', 1, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Lielbritānija', 2, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Spānija', 3, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Vācija', 4, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Itālija', 5, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugāle', 6, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgārija', 7, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Čehu', 8, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Igaunija', 9, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Somija', 10, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruzija', 11, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Grieķija', 12, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Ungārija', 13, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Lietuva', 14, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Latvija', 15, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Polija', 16, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumānija', 17, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbija', 18, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovākija', 19, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Turcija', 20, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraina', 21, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazahstāna', 22, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Čīle', 23, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekvadora', 24, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbija', 26, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Indija', 27, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Dienvidāfrika', 28, 15);
INSERT INTO countries_names VALUES (DEFAULT, 'Rosja', 1, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Wielka Brytania', 2, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Hiszpania', 3, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Niemcy', 4, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Włochy', 5, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugalia', 6, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Bułgaria', 7, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Czech', 8, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonia', 9, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlandia', 10, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruzja', 11, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Grecja', 12, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Węgry', 13, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Litwa', 14, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Łotwa', 15, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Polska', 16, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumunia', 17, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Słowacja', 19, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Indyk', 20, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukraina', 21, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazachstan', 22, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekwador', 24, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbia', 26, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Indie', 27, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Afryka Południowa', 28, 16);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusia', 1, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Marea Britanie', 2, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Spania', 3, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Germania', 4, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Italia', 5, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugalia', 6, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaria', 7, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Ceh', 8, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonia', 9, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlanda', 10, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Georgia', 11, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Grecia', 12, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Ungaria', 13, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Lituania', 14, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Letonia', 15, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Polonia', 16, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'România', 17, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Serbia', 18, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovacia', 19, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Curcan', 20, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Ucraina', 21, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazahstan', 22, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Chile', 23, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Ecuador', 24, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Columbia', 26, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Africa de Sud', 28, 17);
INSERT INTO countries_names VALUES (DEFAULT, 'Русија', 1, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Велика Британија', 2, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Спаин', 3, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Немачка', 4, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Италија', 5, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Португал', 6, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Бугарска', 7, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Чешка', 8, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Естониа', 9, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Финланд', 10, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Георгиа', 11, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Грчка', 12, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Мађарска', 13, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Литванија', 14, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Летонија', 15, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Пољска', 16, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Румунија', 17, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Србија', 18, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Словакиа', 19, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Турска', 20, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Украјина', 21, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Казахстан', 22, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Чиле', 23, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Еквадор', 24, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Перу', 25, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Колумбија', 26, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Индија', 27, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Јужна Африка', 28, 18);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusko', 1, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Veľká Británia', 2, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Španielsko', 3, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Nemecko', 4, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Taliansko', 5, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Portugalsko', 6, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulharsko', 7, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Česká', 8, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Estónsko', 9, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Fínsko', 10, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Gruzínsko', 11, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Grécko', 12, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Maďarsko', 13, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Litva', 14, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Lotyšsko', 15, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Poľsko', 16, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Rumunsko', 17, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Srbsko', 18, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovensko', 19, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Turecko', 20, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukrajina', 21, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazachstan', 22, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Čile', 23, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekvádor', 24, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolumbia', 26, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'India', 27, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Južná Afrika', 28, 19);
INSERT INTO countries_names VALUES (DEFAULT, 'Rusya', 1, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Büyük Britanya', 2, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'İspanya', 3, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Almanya', 4, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'İtalya', 5, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Portekiz', 6, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Bulgaristan', 7, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Çek', 8, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Estonya', 9, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Finlandiya', 10, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Gürcistan', 11, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Yunanistan', 12, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Macaristan', 13, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Litvanya', 14, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Letonya', 15, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Polonya', 16, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Romanya', 17, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Sırbistan', 18, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Slovakya', 19, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Türkiye', 20, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Ukrayna', 21, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Kazakistan', 22, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Şili', 23, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Ekvador', 24, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Peru', 25, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Kolombiya', 26, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Hindistan', 27, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Güney Afrika', 28, 20);
INSERT INTO countries_names VALUES (DEFAULT, 'Росія', 1, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Велика Британія', 2, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Іспанія', 3, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Німеччина', 4, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Італія', 5, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Португалія', 6, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Болгарія', 7, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Чехія', 8, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Естонія', 9, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Фінляндія', 10, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Грузія', 11, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Греція', 12, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Угорщина', 13, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Литва', 14, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Латвія', 15, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Польща', 16, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Румунія', 17, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Сербія', 18, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Словаччина', 19, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Туреччина', 20, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Україна', 21, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Казахстан', 22, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Чилі', 23, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Еквадор', 24, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Перу', 25, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Колумбія', 26, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Індія', 27, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'ЮАР', 28, 21);
INSERT INTO countries_names VALUES (DEFAULT, 'Ресей', 1, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Ұлыбритания', 2, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Испания', 3, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Германия', 4, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Италия', 5, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Португалия', 6, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Болгария', 7, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Чех', 8, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Эстония', 9, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Финляндия', 10, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Грузия', 11, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Греция', 12, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Венгрия', 13, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Литва', 14, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Латвия', 15, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Польша', 16, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Румыния', 17, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Сербия', 18, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Словакия', 19, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Түйетауық', 20, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Украина', 21, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Қазақстан', 22, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Чили', 23, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Эквадор', 24, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Перу', 25, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Колумбия', 26, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Үндістан', 27, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'Оңтүстік Африка', 28, 22);
INSERT INTO countries_names VALUES (DEFAULT, 'रूस', 1, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'ग्रेट ब्रिटेन', 2, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'स्पेन', 3, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'जर्मनी', 4, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'इटली', 5, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'पुर्तगाल', 6, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'बुल्गारिया', 7, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'चेक', 8, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'एस्टोनिया', 9, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'फिनलैंड', 10, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'जॉर्जिया', 11, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'यूनान', 12, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'हंगरी', 13, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'लिथुआनिया', 14, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'लातविया', 15, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'पोलैंड', 16, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'रोमानिया', 17, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'सर्बिया', 18, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'स्लोवाकिया', 19, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'टर्की', 20, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'यूक्रेन', 21, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'कजाकिस्तान', 22, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'चिली', 23, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'इक्वाडोर', 24, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'पेरू', 25, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'कोलंबिया', 26, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'भारत', 27, 23);
INSERT INTO countries_names VALUES (DEFAULT, 'दक्षिण अफ्रीका', 28, 23);

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

INSERT INTO countries_urls VALUES (
	DEFAULT, 1, 1, 'https://my.avon.ru/', 
	'https://emear-static.avon.com/assets/ru-ru/images/', 
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
SELECT dirname, languages.code, url_type, urls_id, countries_id, languages_id, id, urls.url FROM urls 
INNER JOIN countries_urls USING (countries_urls_id) 
INNER JOIN countries USING (countries_id) 
INNER JOIN languages USING (languages_id);
*/

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