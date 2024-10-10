use `3220103373`;
create table book(
	bno char(8) primary key, 
	category char(10),
	title varchar(40),
	press varchar(30),
	year int,
	author varchar(20),PRIMARY
	price decimal(7,2),
	total int ,
	stock int
);