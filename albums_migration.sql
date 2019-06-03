create database if not exists codeup_test_db;
use codeup_test_db;
drop table if exists albums;

create table albums (
    id int unsigned auto_increment,
    artist varchar(255) not null ,
    name varchar(255)default 'NONE',
    release_date int unsigned,
    sales float unsigned default 0,
    genre varchar(255) default 'NONE',
    primary key (id)
);