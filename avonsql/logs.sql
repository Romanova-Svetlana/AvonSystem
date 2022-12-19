CREATE TABLE logs (
	logs_id serial,
	type smallint,
	message varchar(255),
	file varchar(255),
	error varchar(1000),
	date_time bigint,
	PRIMARY KEY (logs_id)
);