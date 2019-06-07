/*
Create a file named subqueries_exercises.sql and craft queries to return the results for the
following criteria:

Find all the employees with the same hire date as employee 101010 using a sub-query.

69 Rows

Find all the titles held by all employees with the first name Aamod.

314 total titles, 6 unique titles

Find all the current department managers that are female.


+------------+------------+
| first_name | last_name  |
+------------+------------+
| Isamu      | Legleitner |
| Karsten    | Sigstam    |
| Leon       | DasSarma   |
| Hilary     | Kambil     |
+------------+------------+
  */
use employees;

select *
from employees
where hire_date =
      (select hire_date
       from employees
       where emp_no = 101010);

SELECT *
from titles
where emp_no in (
    select emp_no
    from employees
    where first_name = 'Aamod');

select first_name, last_name from employees
where gender = 'F' and emp_no in (select emp_no from dept_manager
    where to_date > now())