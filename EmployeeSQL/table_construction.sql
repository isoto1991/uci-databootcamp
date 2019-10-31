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