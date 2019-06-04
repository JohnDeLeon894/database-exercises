use codeup_test_db;
select * from albums;
DELETE from albums where release_date > 1991;
DELETE from albums where genre = 'Disco';
DELETE from albums where artist like 'Whitney%';
