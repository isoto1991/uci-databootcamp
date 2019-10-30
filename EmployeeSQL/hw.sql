drop table if exists departments;
drop table if exists dept_emp; 
drop table if exists dept_manager; 
drop table if exists employees; 
drop table if exists salaries; 
drop table if exists titles; 

CREATE TABLE departments (
	dept_no character varying (10) not null,
	dept_name character varying (30) not null
);

CREATE TABLE dept_emp (
	emp_no int not null, 
	dept_no character varying (10) not null, 
	from_date date not null, 
	to_date date not null
);

CREATE TABLE dept_manager (
	dept_no character varying (10) not null, 
	emp_no int not null, 
	from_date date not null, 
	to_date date not null
);

CREATE TABLE employees (
	emp_no int not null, 
	birth_date date not null, 
	first_name character varying (30) not null,
	last_name character varying (30) not null, 
	gender character varying (5) not null,
	hire_date date not null
);

CREATE TABLE salaries (
	emp_no int not null, 
	salary int not null, 
	from_date date not null, 
	to_date date not null
);

CREATE TABLE titles (
	emp_no int not null, 
	title character varying (30) not null, 
	from_date date not null, 
	to_date date not null
);

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no, first_name, last_name, gender, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
select hire_date, first_name, last_name, emp_no
from employees
Where 
hire_date >= '1986-01-01' and 
hire_date < '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_manager.emp_no, first_name, last_name, departments.dept_no, 
dept_name, from_date, to_date
from departments 
inner join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from departments
inner join dept_emp 
on departments.dept_no = dept_emp.dept_no
inner join employees 
on dept_emp.emp_no = employees.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name 
from employees
where last_name like 'B%'
and first_name = 'Hercules'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from departments
inner join dept_emp 
on departments.dept_no = dept_emp.dept_no
inner join employees 
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from departments
inner join dept_emp 
on departments.dept_no = dept_emp.dept_no
inner join employees 
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales' or dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Last name count"
from employees
group by last_name
order by "Last name count" desc;
