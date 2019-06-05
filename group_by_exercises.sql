use employees;

# In your script, use DISTINCT to find the unique titles in the titles table. Your results should
# look like:

show tables;
describe titles;
select distinct title from titles;

select distinct first_name, last_name from employees where last_name like 'e%e'
group by first_name, last_name;

select distinct last_name from employees
where last_name like '%q%'
  and last_name not like '%qu%';

select distinct last_name, count(*) from employees
where last_name like '%q%'
  and last_name not like '%qu%'
group by last_name;

select distinct gender, count(*) from employees
where first_name = 'irena'
   or first_name =  'Vidya'
   or first_name =  'Maya'
group by  gender
;