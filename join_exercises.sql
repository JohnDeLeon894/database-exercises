#Create a database named join_test_db and run the SQL provided in the Join Example DB section above; to create the same setup used for this lesson.
create database join_test_db;
use join_test_db;
CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);
# Insert 4 new users into the database. One should have a NULL role. The other three should be
# authors.

insert into users (name, email, role_id) values
    ('derek', 'derek@example.com', 2),
    ('harry', 'harry@example.com', 2),
    ('joe', 'joe@example.com', 2),
    ('beth', 'beth@example.com', null);

select * from users;


# Use join, left join, and right join to combine results from the users and roles tables as we
# did in the lesson. Before you run each query, guess the expected number of results.

select users.name, roles.name
from users
join roles
on roles.id = users.role_id;

select users.name , roles.name
from roles
left join users
on  roles.id = users.role_id;

select users.name , roles.name
from roles
right join users
on  roles.id = users.role_id;

# Although not explicitly covered in the lesson, aggregate functions like count can be used with
# join queries. Use count and the appropriate join type to get a list of roles along with the
# number of users that has the role. Hint: You will also need to use group by in the query.

select  roles.name, count(*)
from users
join roles
on roles.id = users.role_id
group by roles.name;

select  users.name, count(*)
from users
join roles
on roles.id = users.role_id
group by users.name;

-- ---------------------------------------

/*
 Create a file named join_exercises.sql to do your work in.

 Using the example in the Associative Table Joins section as a guide, write a query that shows
 each department along with the name of the current manager for that department.
*/
use employees;
show tables;
select * from dept_manager;

select departments.dept_name ,
       concat (employees.first_name, ' ',employees.last_name) as 'Employee name'
from dept_manager
right join departments
     on departments.dept_no = dept_manager.dept_no
left join employees
    on employees.employees.emp_no = dept_manager.emp_no
where dept_manager.to_date = '9999-01-01';

#Find the name of all departments currently managed by women.

select departments.dept_name,
       concat (employees.first_name, ' ',employees.last_name) as  Employee_name
from dept_manager
join departments
    on dept_manager.dept_no = departments.dept_no
join employees
    on dept_manager.emp_no = employees.emp_no
where employees.gender like 'f' and dept_manager.to_date = '9999-01-01';

# Find the current titles of employees currently working in the Customer Service department.

select titles.title, count(title) count
from titles
join employees on titles.emp_no = employees.emp_no
join dept_emp on employees.employees.emp_no = dept_emp.emp_no
join departments d on dept_emp.dept_no = d.dept_no
where d.dept_no = 'd009' and dept_emp.to_date > curdate()
group by titles.title;

# Find the current salary of all current managers.

# dept_managers, salaries

select concat(employees.first_name, ' ', employees.last_name),
       s.salary, departments.dept_name

from employees
join dept_manager dm on employees.emp_no = dm.emp_no
join departments on  dm.dept_no = departments.dept_no
join salaries s on employees.emp_no = s.emp_no
where dm.to_date > curdate() and s.to_date > curdate();

#  Find the names of all current employees, their department name, and their current manager's name.

select concat(employees.first_name , ' ', last_name), d.dept_name
from employees
join dept_emp de on employees.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
join dept_manager dm on d.dept_no = dm.dept_no

where de.to_date >  curdate() and dm.to_date > curdate();