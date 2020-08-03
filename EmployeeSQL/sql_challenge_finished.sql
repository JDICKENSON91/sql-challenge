CREATE TABLE departments (
	dept_no varchar(4) NOT NULL PRIMARY KEY,
	dept_name varchar NOT NULL UNIQUE
	);

CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no varchar NOT NULL
	);

CREATE TABLE dept_manager (
	dept_no varchar(4) NOT NULL,
	emp_no int NOT NULL
	);

CREATE TABLE employees (
    emp_no int   NOT NULL PRIMARY KEY,
    emp_title_id varchar   NOT NULL,
    birth_date varchar   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date varchar   NOT NULL
    
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE titles (
	title_id varchar NOT NULL PRIMARY KEY,
	title varchar NOT NULL UNIQUE
	);
	
select * from departments;

select * from dept_emp;

select * from dept_manager;

select * from employees;

select * from salaries;

select * from titles;

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees INNER JOIN salaries ON (employees.emp_no = salaries.emp_no)

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date
LIKE ('%1986')

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, dept_name, employees.emp_no, last_name, first_name
FROM dept_manager
INNER JOIN employees ON (employees.emp_no = dept_manager.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_manager.dept_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
INNER JOIN employees ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_emp.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON (departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales'
OR dept_name ='Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Count of Last name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last name" DESC;

--Badge Search

SELECT *
FROM employees
WHERE emp_no = '499942'

--Haha .. April Fools Day