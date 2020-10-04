--create the retirement titles tables, includes duplicates
SELECT employees.emp_no, employees.first_name, employees.last_name, 
		titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no asc;

--use distinct on to delete duplicate lines

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_retirement_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--corrected unique_retirement_titles - take out those who have already left
SELECT employees.emp_no, employees.first_name, employees.last_name, 
		titles.title, titles.from_date, titles.to_date
INTO retirement_titles_correct
FROM employees
INNER JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (titles.to_date = '9999-01-01')
ORDER BY employees.emp_no asc;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_retirement_titles_correct
FROM retirement_titles_correct
ORDER BY emp_no, to_date DESC;

SELECT COUNT(emp_no), title
INTO count_retiring_by_title_correct
FROM unique_retirement_titles_correct
GROUP BY title
ORDER BY count desc;

-- Count of employees by job title who are about to retire
SELECT COUNT(emp_no), title
INTO count_retiring_by_title
FROM unique_retirement_titles
GROUP BY title
ORDER BY count desc;

--mentorship eligibility - 1965 only
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.birth_date,	
		titles.title, department_employees.from_date, department_employees.to_date
INTO temp_db
FROM employees 
INNER JOIN department_employees
	ON (employees.emp_no = department_employees.emp_no)
INNER JOIN titles
	ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (department_employees.to_date = '9999-01-01')

SELECT*FROM temp_db

--delete duplicate employee numbers

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, birth_date, from_date, to_date
INTO membership_eligibility
FROM temp_db
ORDER BY emp_no, to_date DESC;


-- Employee ret eligible count by department number, join with department name
SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_ret_eligible
FROM current_emp as ce
LEFT JOIN department_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT dept_ret_eligible.count, departments.dept_name
--INTO updated_dept_ret_eligible
FROM dept_ret_eligible
LEFT JOIN departments
ON departments.dept_no = dept_ret_eligible.dept_no
ORDER BY count DESC;

--find number of current employees from department_employees

SELECT DISTINCT ON (emp_no) to_date, emp_no, from_date
INTO corrected_current_emp
FROM department_employees
WHERE (to_date = '9999-01-01');

---look at salaries for new employees versus salaries for older employees

SELECT corrected_current_emp.emp_no, corrected_current_emp.from_date, 
		salaries.salary
INTO salaries_current_emp
FROM corrected_current_emp
LEFT JOIN salaries

ON (corrected_current_emp.emp_no = salaries.emp_no)



