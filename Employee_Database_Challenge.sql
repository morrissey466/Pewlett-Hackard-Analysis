-- joining employees and titles into retirement titles table 

Select e.emp_no,
		e.first_name,
		e.last_name,
        e.birth_date,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
from employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no;

select * from retirement_titles; 


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
    e.first_name,
    e.last_name,
	e.title
INTO unique_table 
FROM retirement_titles as e 
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER BY emp_no, to_date DESC;




-- Number of Employees about to retire 
Select count(ut.emp_no),
ut.title 
INTO TITLE_COUNT 
From unique_table as ut
GROUP BY ut.title;


--DELIVERABLE 2 

SELECT DISTINCT ON  (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO MEMBERSHIP_ELIG
FROM employees AS e 
INNER JOIN dept_emp as de 
ON e.emp_no = de.emp_no
INNER JOIN titles AS t 
ON e.emp_no = t.emp_no
where e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;


