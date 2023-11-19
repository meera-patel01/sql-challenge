-- DATA ANALYSIS

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e
JOIN Salaries AS s
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE SPLIT_PART(hire_date, '/', 3) = '1989';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Dept_manager AS dm
JOIN Departments AS d
ON dm.dept_no = d.dept_no
JOIN Employees AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM Dept_emp AS de
JOIN Employees AS e
ON de.emp_no = e.emp_no
JOIN Departments AS d
ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules'
AND SUBSTRING(last_name, 1, 1) = 'B';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.last_name, e.first_name
FROM Dept_emp AS de
JOIN Employees AS e
ON de.emp_no = e.emp_no
JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM Dept_emp AS de
JOIN Employees AS e
ON de.emp_no = e.emp_no
JOIN Departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;