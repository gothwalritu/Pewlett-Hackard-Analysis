-- Creating Retirement title table for PH-Employee

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_title
FROM employees as e
INNER JOIN title as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


SELECT * FROM employees
SELECT * FROM title

SELECT * FROM retirement_title;
DROP TABLE retirement_title

-- Use Dictinct with Orderby to remove duplicate rows
	
SELECT DISTINCT ON (rt.emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_title as rt
WHERE to_date = ('9999-01-01')
ORDER BY rt.emp_no;

SELECT * FROM unique_titles;

DROP TABLE unique_titles;

-- Number of titles from Unique Titles

SELECT COUNT (ut.title), ut.title
INTO retiring_titles 
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;
DROP TABLE retiring_titles

------------------- Deliverabble 2----------------

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN title as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no; 

SELECT * FROM mentorship_eligibilty;
DROP TABLE mentorship_eligibilty;