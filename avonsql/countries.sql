CREATE TABLE countries ( -- страны
	countries_id smallserial,
	dirname varchar(100),
	code varchar(5), -- код страны
	PRIMARY KEY ("countries_id")
);

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

