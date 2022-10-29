SELECT emp_no, first_name, last_name
FROM employees

SELECT title, from_date, to_date
FROM titles

SELECT employees.emp_no, employees.first_name, 
employees.last_name, titles.title, titles.from_date, titles.to_date
INTO Retirement_info
FROM employees
LEFT JOIN titles on employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no DESC;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM Retirement_info
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


SELECT  COUNT(unique_titles.emp_no), unique_titles.title

INTO retireeing_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY Count DESC

SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT from_date, to_date
FROM dept_emp

SELECT title
FROM titles


SELECT DISTINCT ON (emp_no)
employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title

INTO mentorship_eligibility
FROM
    employees
	LEFT JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	LEFT JOIN titles
		ON employees.emp_no = titles.emp_no
	WHERE (dept_emp.to_date = '9999-01-01')
	AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;

SELECT * FROM Mentorship_Eligibility


