--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex,
(SELECT s.salary FROM salaries AS s 
WHERE e.emp_no = s.emp_no)    
AS salary FROM employees AS e;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE DATE_PART('year', e.hire_date) = 1986;

--3.List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name,  e.first_name
FROM dept_manager AS dm
LEFT JOIN departments AS d ON dm.dept_no = d.dept_no
LEFT JOIN employees AS e ON dm.emp_no =e.emp_no;

select * from dept_emp

--4.List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
LEFT JOIN departments AS d ON d.dept_no = de.dept_no
LEFT JOIN employees AS e ON e.emp_no = de.emp_no;


--5.List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex 
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.

CREATE VIEW wider_emp AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name 
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON d.dept_no = de.dept_no;

SELECT * FROM wider_emp
WHERE dept_name = 'Sales';


--7.List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

CREATE VIEW wider_emp AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name 
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON d.dept_no = de.dept_no;

SELECT * FROM wider_emp
WHERE dept_name = 'Sales' or dept_name = 'Development';


--8.List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
select last_name, count(*) 
from employees 
group by last_name
order by count(*) DESC
