create database if not exists oam;
show databases ;

drop table books ;

Create table books (
	id int unsigned not null auto_increment,
	primary key (id),
	fname varchar( 65),
 	lname  varchar (100),
	title  varchar (500),
	series varchar (200)
);

desc books;
