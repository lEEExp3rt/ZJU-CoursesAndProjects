use library;
create table card(
	cno char(7) primary key,
	name varchar(10),
	department  varchar(40),
	type enum ('T','G','U','O')
    );