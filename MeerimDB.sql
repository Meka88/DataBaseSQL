-- SELECT <columnName> FROM <tableName>;

SELECT * FROM employees;

-- SUGGESTED FORMAT --
SELECT * FROM JOBS;

SELECT * FROM employees;

SELECT * FROM eMploYEES;


SELECT * FROM regions;


SELECT manager_id FROM employees;


SELECT first_name, hire_date FROM employees;

-- Write a querty to retrieve all the information from the phone number, job id, and manager id from employees table

SELECT phone_number, job_id, manager_id FROM employees;
-- 1. from clause -> retrive the table
-- 2. where -> filters the rows in the table we need
-- 3. select -> selects the specific 
SELECT * FROM employees
WHERE job_id = 'IT_PROG';

-- Write the query to get the department name column for department id = 50 from departments table.

SELECT department_name, department_id FROM departments
WHERE department_id = '50';

SELECT * FROM employees
WHERE first_name = 'Neena'
AND last_name = 'King'
AND job_id = 'AD_PRES';

SELECT * FROM employees
WHERE first_name = 'Bruce'
OR first_name = 'David';

SELECT * FROM employees
WHERE first_name != 'David'; -- not could be ! or <> or not

SELECT * FROM employees
WHERE salary in (17000, 9000, 3100, 2900);

--Write the query to get all columns from the employees' table if the department id is 50 and the job id is “ST_MAN”
SELECT * FROM employees
WHERE department_id = 50
AND job_id = 'ST_MAN';

--Write the query to get all columns from the employees’ table if the department id is 50 or the job id is “ST_MAN”
SELECT * FROM employees
WHERE department_id = 50
OR job_id = 'ST_MAN';

--Write the query to get all columns from the employees’ table if the department id is 70 or the salary is more than 5000
SELECT * FROM employees
WHERE department_id = 70 
OR salary > 5000;

--Write the query to get all columns from the employees’ table if the department id is 70 and the salary is more than 5000
SELECT * FROM employees
WHERE department_id = 70 
AND salary > 5000;

--Write the query to find the employees who are not displayed in step 4.
SELECT * FROM employees
WHERE department_id != 70 
AND salary <= 5000;


SELECT * FROM employees
WHERE hire_date BETWEEN '01-JUL-96' AND '31-JUL-96';

--1. Write the query to get all columns from employees table if salary is between 1000 and 10000
SELECT * FROM employees
WHERE salary BETWEEN 1000 AND 10000;

--2. Write the query to get all columns from employees table if salary is between 6000 and 100000 and hire date is after June 7, 1997
SELECT * FROM employees
WHERE salary BETWEEN 6000 AND 100000
AND hire_date > '07-JUN-97';

select first_name || ' ' || last_name from employees;

select first_name as "first name" from employees; -- to change the name of the column temp

--1. Write the query to get last name and add them ‘@gmail.com’ as columnName is ‘gmailAccount’ from employees table
select last_name || '@gmail.com' as gmailAccount from employees;

--2. Write the query to get last name and add them ‘@gmail.com’ as columnName is ‘Gmail Account’ from employees table.
select last_name || '@gmail.com' as "Gmail Account" from employees;


select last_name || '@gmail.com' as "Gmail Account" from employees
ORDER BY last_name desc; -- asc for ascending 

-- Write the query to get all columns from the employee's table for salaries more than 5000 and order the result for hire date in descending order.
SELECT * FROM employees 
WHERE salary > 5000
ORDER BY hire_date desc;


SELECT * FROM employees
WHERE first_name LIKE '%A%' -- '%a' endWith, 'A%' startsWith, '%A%' contains

--1. Write the query to find all columns from the employees’ table for first_name starting with ‘C’.
Select * from employees
Where first_name LIKE 'C%';
--2. Write the query to find all columns from the employees' table for the length of last_name is 6.
Select * From employees
Where last_name LIKE '______';
--3. Write the query to find all columns from the employees’ table for first_name that contains two lowercase ‘a’.
Select * From employees
Where first_name LIKE '%a%';




-- 08-1-2023- 

-- 1.	Write a query that returns those employees who have  commission less than their salary
SELECT * FROM employees
WHERE commission_pct < salary;

-- 2.	Write a query that returns all employees that have a salary greater than 2500 and also work in department_id no 20
SELECT * FROM employees
WHERE department_id = 20
AND salary > 2500;

-- 3.	Write a query that returns all employees that are not AD_VP nor SA_REP and have a salary greater than or equal to 2000
SELECT * FROM employees;
WHERE job_id NOT IN ('AD_VP', 'SA_REP') 
AND salary >= 2000;

-- 4.	Write a query to retrieve the first names and last names of all employees along with their job IDs, and concatenate them into a job_id column
--      in the format: <first_name> <last_name> works as a <job_id>. Alias this column as "Full Info".
select first_name, last_name, first_name || ' ' || last_name || ' works as a ' || job_id as "Full Info" from employees;

-- 5.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 per month "
SELECT first_name || ' makes $' || salary || ' per month' as "monthly salary" FROM employees;

-- 6.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 yearly"
SELECT first_name || ' makes $' || salary * 12 || ' yearly' as "Yearly salary" FROM employees;

--------------------------------------
-------------SINGLE ROW FUNCTIONS-----
--------------------------------------

SELECT UPPER('hello') FROM employees;

SELECT UPPER('hello') FROM dual; // dummy database 

SELECT INITCAP('hello my name is NAME') AS sentence from dual; // only first character upper case

SELECT LOWER('THIS IS TECHGLOBAL B6') FROM dial;

select LOWER(job_id) from employees; 

-- Write a query to concats first_name and job id columns from the employees table
-- and returns them as a concat first_name in upper case and job_id in lower case
-- STEVEN ad_pres

SELECT CONCAT(CONCAT(UPPER(first_name), ' '), LOWER(job_id)) FROM employees;

--1. Write the query to get all employees last names in upper case.
SELECT UPPER(last_name) FROM employees;

--2. Write the query to get all employees emails in lower case.
SELECT LOWER(email) FROM employees;

--3. Write the query to get all employees first name in upper case, last names in lower case and emails in only first letter upper case.
SELECT UPPER(first_name), LOWER(last_name), INITCAP(email) FROM employees;

--4. Write a query to retrieve the first names and last names of all employees in uppercase, and their job titles in lowercase. Additionally, alias the columns as "First Name", "Last Name", and "Job Title" respectively.
SELECT UPPER(first_name) as "First name", UPPER(last_name) as "Last name", LOWER(job_id)as "Job Title" FROM employees;

-- Write a query and return each row in this format “steve IS THE NAME and their job is: MANAGER “
SELECT CONCAT(CONCAT(LOWER(first_name), UPPER(' is the name ')),CONCAT(LOWER('and their job is: '), UPPER(job_id))) as "concat function" FROM employees;

SELECT LENGTH('hello my name is name') AS length FROM dual;
SELECT LENGTH(first_name) as length from employees;
SELECT first_name, LENGTH(first_name) as LENGTH FROM employees
WHERE LENGTH(first_name) = 6;
SELECT SUBSTR('hello', 2) FROM employees;
SELECT SUBSTR('hello', 2, 2) FROM employees;

-- 'hello' 2  e
-- 'hello' 2, 2  el
-- 'hello' 2, 3  ell

SELECT SUBSTR('hello', 2, 3) FROM employees;
SELECT SUBSTR('Hello my name is', 10) FROM dual;
SELECT SUBSTR('Hello my name is', 10, 5) FROM dual;
SELECT LENGTH(SUBSTR('Hello my name is', 10, 5)) FROM dual;
select instr(LOWER(city), 'a') from locations;



--5.  Write the query to get all last names that starting from index number 2 and add 4 more character from employees.
SELECT SUBSTR(last_name, 2, 4) FROM employees;

--6.  Write the query to get all last names that starting from index number 4 from employees.
SELECT SUBSTR(last_name, 4) FROM employees;

--7.  Write the query to find the city includes ‘a’ character in locations.
SELECT city FROM locations
WHERE city LIKE '%a%';
SELECT city FROM locations
WHERE instr(city, LOWER('a')) > 0;

--8.  Write the query to return first name and last name combined as lower case with the space and 
--  find the index number of ‘k’ from combined firstname and lastname from employees.
SELECT instr((CONCAT(CONCAT(LOWER(first_name), ' '), LOWER(last_name))), 'k') as "index of k" FROM employees;

-- First argument string, second how much length we want, last what we want to add to it.
SELECT LPAD('hello', 10, '$') FROM dual;

SELECT LPAD('hello', 100, '$') FROM dual;

SELECT RPAD('hello', 100, '&') FROM dual;



SELECT LTRIM('hello', 'h') FROM dual;

SELECT RTRIM('hellohhhhhhhhhhh', 'h') FROM dual;

-- TRUND and ROUND

-- ROUND

SELECT ROUND(107.088, 2) FROM dual;

SELECT ROUND(107.088, 3) FROM dual;

SELECT ROUND(107.0887, 3) FROM dual;

SELECT ROUND(107.9) FROM dual;

SELECT ROUND(107.0884, 3) FROM dual;

SELECT ROUND(107.0885, 3) FROM dual;



-- TRUNC

SELECT TRUNC(107.987979789) FROM dual;

SELECT TRUNC(107.987979789, 3) FROM dual;

SELECT TRUNC(107.987979789, 5) FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-JAN-00' AND '31-DEC-00'
AND last_name LIKE 'S%';



-----------------------------------HOMEWORK------------------------------------------------------------

--1.	Write a query to display the first name, last name, and hire date of all employees who were hired between January 1, 2000, and December 31, 2000, and whose last name begins with the letter 'S'.
SELECT first_name, last_name, hire_date FROM employees
WHERE last_name LIKE 'S%'
AND hire_date BETWEEN '01-JAN-00' AND '31-DEC-00';

--2.	Write a query to display the first name, last name, and job title of all employees who work in the Sales or Accounting departments.
SELECT first_name, last_name, job_id FROM employees
WHERE job_id = 'SA_REP'
OR job_id = 'AC_ACCOUNT';

--3.	Write a query to display the first name, last name, and salary of all employees who earn more than $10,000 and less than $20,000.
SELECT first_name, last_name, salary FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--4.	Write a query to display the first name, last name, and hire date of all employees who do not have a manager.
SELECT first_name, last_name, hire_date FROM employees
WHERE manager_id IS NULL; 

--5.	Write a query to display the first name, last name, and job title of all employees who are either Sales Representatives or Sales Managers.
SELECT first_name, last_name, job_id FROM employees
WHERE job_id IN ('SA_REP', 'SA_MAN');
SELECT * FROM employees;
--6.	Write a query to display the first name, last name, and hire date of all employees who were not hired in the year 2000.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date NOT BETWEEN '01-JAN-00' AND '31-DEC-00';

--7.	Write a query to display the first name and last name of all employees, concatenated as "First Last".
SELECT first_name || ' ' || last_name as "First Last" FROM employees;

--8.	Write a query to display the first name, last name, and salary of all employees, sorted by salary in descending order.
SELECT first_name, last_name, salary FROM employees
ORDER BY salary desc;
SELECT * FROM jobs;
--9.	Write a query to display the first name, last name, and job title of all employees whose job title contains the word "Manager".
SELECT first_name, last_name, job_id FROM employees
WHERE job_id LIKE '%MAN%';

--10.	Write a query to display the first name, last name, and salary of all employees whose salary is not null.
SELECT first_name, last_name, salary FROM employees
WHERE salary IS NOT NULL;

--11.	Write a query to display the first name, last name, and job title of all employees, with the first name and last name 
--in uppercase letters and the job title in lowercase letters.
SELECT UPPER(first_name), UPPER(last_name), LOWER(job_id) FROM employees;

--12.	Write a query to display the first name, last name, and job title of all employees, with the first letter of each word 
--in the job title capitalized.
SELECT INITCAP(first_name), INITCAP(last_name), INITCAP(job_id) FROM employees;

--13.	Write a query to display the first name, last name, and length of the job title of all employees.
SELECT first_name, last_name, LENGTH(job_id) as job_length FROM employees;

--14.	Write a query to display the first name, last name, and a concatenated string of the first name, last name, and job 
--title of all employees.
SELECT first_name, last_name, CONCAT(CONCAT(first_name,' '), CONCAT(CONCAT(last_name, ' '), job_id)) as employees FROM employees;

--15.	Write a query to display the first name, last name, and the first three characters of the job title of all employees.
SELECT first_name, last_name, SUBSTR(job_id, 1, 3) as firs_3 FROM employees;

--16.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "a" in the 
--job title of all employees.
SELECT first_name, last_name, instr(job_id, 'a', 1, 1) as index_A FROM employees;

--17.	Write a query to display the first name, last name, and salary of all employees, with the salary rounded to the nearest thousand dollars.
SELECT first_name, last_name, ROUND(salary, 3) as round_salary FROM employees;

--18.	Write a query to display the first name, last name, and salary of all employees, with the salary truncated to the 
--nearest thousand dollars.
SELECT first_name, last_name, TRUNC(salary, 3) as trunc_salary FROM employees;

--19.	Write a query to display the first name, last name, and the length of the first name of all employees.
SELECT first_name, last_name, LENGTH(first_name) as name_len FROM employees;

--20.	Write a query to display the first name, last name, and a concatenated string of the first name, a comma, and the 
--last name of all employees.
SELECT first_name, last_name, CONCAT(CONCAT(first_name,', '), last_name)as full_name FROM employees;

--21.	Write a query to display the first name, last name, and the first three characters of the first name of all employees.
SELECT first_name, last_name, SUBSTR(first_name, 1, 3) as first_3 FROM employees;

--22.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "e" in the 
--first name of all employees.
SELECT first_name, last_name, instr(first_name, 'e', 1, 1) as index_of_e FROM employees;

--23.	Write a query to display the first name, last name, and the length of the last name of all employees.
SELECT first_name, last_name, LENGTH(last_name) as last_name_len FROM employees;

--24.	Write a query to display the first name, last name, and the first three characters of the last name of all employees.
SELECT first_name, last_name, SUBSTR(last_name, 1, 3)as first_3 FROM employees;

--25.	Write a query to display the first name, last name, and the position of the first occurrence of the letter "a" in the 
--last name of all employees.
SELECT first_name, last_name, instr(last_name, 'a', 1, 1) as index_of_a FROM employees;


----------------------------------------------------------------------------------------------------------------------------------


----------------------7-02-2023----------------------------------
----------------------Multi Row Functions------------------------
-----------------------------------------------------------------

SELECT MAX(salary) FROM employees;
SELECT COUNT(*) FROM employees;
SELECT MAX(salary) as max_sal FROM employees;
SELECT MIN(salary) as min_sal FROM employees;
SELECT SUM(salary) as sum_sal FROM employees;
SELECT AVG(salary) as avg_sal FROM employees;
SELECT COUNT(*) FROM EMPLOYEES;

SELECT COUNT(salary) FROM EMPLOYEES;
SELECT COUNT(commission_pct) AS count FROM employees;
SELECT commission_pct FROM employees;
SELECT SUM(SALARY) / COUNT(*) as computed_avg, avg(salary) as native_avg FROM EMPLOYEES;
SELECT SUM(salary) + AVG(salary) as computed from employees;
SELECT SUM(salary) AS sum, AVG(SALARY) AS avg, MAX(salary) AS max, MIN(salary) AS min, COUNT(*) FROM employees;


-- 1. Write the query to find the count of employees if the employee first name has more than 4 characters.
SELECT COUNT(*)as employee_count FROM employees
WHERE LENGTH(first_name) > 4;

-- 2. Find the total number of employees whose names start with the letter 'A'.
SELECT COUNT(*)as count_startA FROM employees
WHERE first_name LIKE 'A%';

-- 3. Count how many employees have a salary above 5000.
SELECT COUNT(*) as high_count FROM employees
WHERE salary < 5000;

-- 4. Count how many employees have a commission percentage.
SELECT COUNT(*) as count_empl FROM employees
WHERE commission_pct > 0;

-- 5. As we consider that given salaries are monthly, Write the query to find the total salary yearly.
SELECT SUM(salary) * 12 as yearly_sum FROM employees;

-- 6. Find the total salary of all employees whose salary is between 3000 and 6000.
SELECT SUM(salary) FROM employees
WHERE salary BETWEEN 3000 AND 6000;


-- GROUP BY CLAUSE

-- Find the avg salary of title 'SA_REP'

SELECT AVG(salary) FROM employees
WHERE job_id = 'SA_REP';

-- Find the avg salary of title 'ST_CLERK'

SELECT AVG(salary) FROM employees
WHERE job_id = 'ST_CLERK';

-- Find the avg salary of title 'AD_VP'

SELECT AVG(salary) FROM employees
WHERE job_id = 'AD_VP';


SELECT AVG(salary), job_id FROM employees
GROUP BY job_id;

select count(*) from employees
where job_id = 'FI_ACCOUNT';

SELECT count(*), job_id FROM employees
GROUP BY job_id;

SELECT DISTINCT job_id FROM employees;

SELECT MAX(salary), job_id FROM employees
GROUP BY job_id;

SELECT MIN(salary), job_id FROM employees
GROUP BY job_id;

SELECT department_id, COUNT(*) AS number_of_employees FROM employees
WHERE salary > 2000
GROUP BY department_id
ORDER BY number_of_employees DESC;

-- Get those job_id's where they have only 2 employees

SELECT COUNT(*), job_id FROM employees
GROUP BY job_id
HAVING COUNT(*) = 2;

SELECT COUNT(*), job_id FROM employees
GROUP BY job_id
HAVING COUNT(*) > 10;

-- 1) SELECT job_id
-- 2) FROM employees
-- 3) WHERE
-- 4) GROUP BY job_id
-- 5) HAVING count(*) = 2
-- 6) ORDER BY

-- Write a query to find those department_id they have count more than 3

SELECT department_id, COUNT(*) FROM employees
GROUP BY department_id
HAVING count(*) > 3;

SELECT COUNT(*) as count, department_id, job_id FROM employees
GROUP BY department_id, job_id
HAVING COUNT(*) < 6;


SELECT department_id, COUNT(*) as number_of_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10
ORDER BY number_of_employees DESC;

--This SQL query does the following:
--Groups the employees by their department.
--Counts the number of employees in each department.
--Only includes departments that have more than 10 employees.
--Orders the results by the number of employees in descending order.


--1. Find the total number of employees in each department and list only those departments with more than 5 employees.
SELECT department_id, COUNT(*) as number_employees FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--2. Calculate the average salary for each job title, but only include job titles where the average salary is greater than 6000.
SELECT AVG(salary) as average, job_id FROM employees
GROUP BY job_id
HAVING AVG(salary) > 6000;

--3. Find the highest salary in each department and list only those departments where the highest salary is less than 10000.
SELECT MAX(salary) as max_salary, department_id FROM employees
GROUP BY department_id
HAVING MAX(salary) < 10000;

-- 4. For each department, calculate the total salary paid. Only include deparrtments where the total salary is more than 50000, 
--    and order the result by total salary in descending order.
SELECT SUM(salary) as total, department_id FROM employees
GROUP BY department_id
HAVING SUM(salary) > 50000
ORDER BY total desc;

--5. Find the total number of employees for each job title and list only those job titles that have more than 3 employees.
SELECT COUNT(*) as count, job_id FROM employees
GROUP BY job_id
HAVING COUNT(*) > 3;

--6. Calculate the sum of the salaries for each department and only display those where the sum is between 20000 and 50000.
SELECT SUM(salary) as sum, department_id FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 50000;

----------------------------03-07-2023-----------------------------------------------------

-------GROUP ROW FUNCTIONS PRACTICE----------------

-- 1. Write a querty to find the departments where the maximum salary is more than 12000.
SELECT department_id, MAX(salary) as max_salary FROM employees
GROUP BY department_id
HAVING MAX(salary) > 12000;

-- 2. Write a querty to find out which job titles have an average salary greater than 5000.
SELECT job_id, AVG(salary) as avg_salary FROM employees
GROUP BY job_id
HAVING AVG(salary) > 5000;

-- 3. Count the number of employees in each department, but only list those departments with more than 5 employees.
SELECT COUNT(*) as count, department_id FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 4. Find out which job titles have more than one employee.
SELECT COUNT(*) as count, job_id FROM employees
GROUP BY job_id
HAVING COUNT(*) > 1;

-- 5. Calculate the average salary for each department and display those departments where the average salary is above 7000.
SELECT department_id, AVG(salary) as avg_salary FROM employees
GROUP BY department_id
HAVING AVG(salary) > 7000;

-- 6. List departments where the lowest salary is more than 2500.
SELECT department_id, MIN(salary) FROM employees
GROUP BY department_id
HAVING MIN(salary) > 2500;

-- 7. Find the total salary paid for each job title, but only list those where the total salary is less than 30000.
SELECT job_id, SUM(salary) FROM employees
GROUP BY job_id
HAVING SUM(salary) < 30000;

-- 8. Calculate the total salary budget per year by department, and list departments with a yearly budget over 500000 dollars.
SELECT department_id, SUM(salary) * 12 as total FROM employees
GROUP BY department_id
HAVING SUM(salary) > 50000;

-- 9. Find the average salary of each department and list those departments whose average salary is not equal to the minimum salary of that department.
SELECT department_id, AVG(salary) FROM employees
GROUP BY department_id
HAVING AVG(salary) != MIN(salary);

-- 10. Find the job titles where the difference between the maximum and minimum salary is greater than 6000.
SELECT job_id FROM employees
GROUP BY job_id
HAVING (MAX(salary) - MIN(salary)) > 6000;

-- 11. Query to get manager_id and lowest paid employees for each manager and make sure that manager is not null and lowest salary is 
--higher than 6000 and then order by lowest salaries descending
SELECT manager_id, MIN(salary) FROM employees
WHERE manager_id is not null
GROUP BY manager_id
HAVING MIN(salary) > 6000  
ORDER BY MIN(salary)desc;

--===============================================--
--==================SUBQUERIES===================--
--===============================================--

SELECT * FROM departments;

SELECT * FROM departments
WHERE department_id = 30;

SELECT * FROM departments
WHERE department_id = (SELECT department_id FROM departments WHERE department_id = 30);

SELECT * FROM departments
WHERE department_id < (SELECT department_id FROM departments WHERE department_id = 30);

SELECT * FROM departments
WHERE department_id < (SELECT department_id FROM departments WHERE department_id = 30)
AND department_name = 'Marketing';



SELECT * from DEPARTMENTS
WHERE department_id < 30
and department_name = 'Marketing';



SELECT * FROM ( SELECT * FROM departments);

SELECT * FROM ( SELECT * FROM employees);




SELECT * FROM departments;

-- Write a query and print those employees where their department_id are equal to 'Administration'

SELECT * FROM employees
WHERE department_id = 10;

SELECT * FROM employees
WHERE department_id = ( SELECT department_id FROM departments WHERE department_name = 'Administration');

-- NOTE: So, Administration information is not in the employees table,
-- we are kinda joining these 2 tables using this department_id because we know that
-- department_id is also in departments_table

SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments);

SELECT * FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_id in(10,20));

SELECT * FROM employees
WHERE department_id IN (SELECT department_id, location_id, department_name FROM departments WHERE department_id in(10,20));




SELECT job_id, first_name, ( SELECT job_id FROM employees) FROM employees;

SELECT job_id, first_name, ( SELECT job_id FROM employees WHERE first_name = 'Ellen') FROM employees;

--1. Write a query to get employees first_name and salary who makes more than employee who has employee_id 121 and then order by salary ascending.
SELECT first_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE employee_id = 121);

--2. Write a query to get employees first_name, department_id who works in same department with employee who has employee_id 150.
SELECT first_name, department_id FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 150);

--3. Write a query to find second largest salary.
SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees));

--4. Write a query to get name of employees who is making second largest salary.
SELECT first_name, salary FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees));


--5. Write a query to get number of postal code under same countries from locations table.
SELECT country_id, COUNT(postal_code) FROM locations
GROUP BY country_id;

--6. Write a query to get number of postal code under same countries from locations table if their count is more than 1.
SELECT country_id, COUNT(postal_code) FROM locations
GROUP BY country_id
HAVING COUNT(postal_code) > 1;

--7. Write a query to get all employees who is making more than average salary and order by salary.
SELECT first_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary;

--8. Write a query to get all cities which have same state with Toronto from locations table.
SELECT city FROM locations
WHERE state_province = (SELECT state_province FROM locations WHERE city = 'Toronto');

--9. Write a query to find the employee who is making second lowest salary.
SELECT first_name, salary FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees));



=============================================================================
--============================07-05-2023===================================--
=============================================================================

-- 1. Find all employees who earn more than the average salary.
SELECT first_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Find the employee names who have the highest salary.
SELECT first_name, salary FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 3. Find the names of departments that have more than 5 employees.
SELECT department_name FROM departments
WHERE department_id IN (SELECT department_id FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5);

-- 4. Find the first name and last name of employees whose manager has a manager.
SELECT first_name, last_name FROM employees
WHERE manager_id IN (SELECT employee_id FROM employees
WHERE manager_id IS NOT NULL);

-- 5. Find all departments where the total salary is above the company's average total salary by department.
SELECT department_id FROM employees
GROUP BY department_id
HAVING SUM(salary) > (SELECT AVG(salary) FROM employees);

-- 6. List employees who have the same job title as any employee in department 90, but are not themselves in department 90.
SELECT first_name, last_name, job_id FROM employees
WHERE job_id IN (SELECT job_id FROM employees WHERE department_id = 90)
AND department_id <> 90;

-- 7. Find the department ID which has the most number of employees.
SELECT department_id FROM employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM employees
GROUP BY department_id);

-- 8. List all employees who have the same manager as the employee with the lowest salary.
SELECT first_name FROM employees
WHERE manager_id = (SELECT manager_id FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees));

-- 9. Find all employees whose salary is greater than the salary of all employees in department 10.
SELECT * FROM employees
WHERE salary > (SELECT salary FROM employees WHERE department_id = 10);


=============================================================================
--============================JOINS===================================--
=============================================================================


SELECT * FROM employees;
SELECT * FROM departments;

SELECT * FROM employees, department
WHERE employees.department_id = departments.department_id
And department_name = 'Marketing';

SELECT * FROM employees JOIN departments
ON employees.department_id = departments.department_id;

SELECT * FROM employees e JOIN departments d
ON e.department_id = d.department_id;


-- 1. Write the query to the print country name, country id, and region name for each country.
SELECT c.country_name, c.country_id, r.region_name FROM countries c JOIN regions r
ON c.region_id = r.region_id;

--2. Write the query to print the last name, email, and  job title for each employee.
SELECT e.last_name, e.email, j.job_title FROM employees e JOIN jobs j
ON e.job_id = j.job_id;



SELECT * FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;


SELECT * FROM employees;
SELECT * FROM job_history;

SELECT * FROM employees e FULL OUTER JOIN job_history j
ON e.employee_id = j.employee_id;


SELECT * FROM employees e INNER JOIN job_history j
ON e.employee_id = j.employee_id;

SELECT * FROM employees e RIGHT JOIN job_history j
ON e.employee_id = j.employee_id;


SELECT first_name, start_date, end_date, hire_date 
FROM employees e JOIN job_history j
ON e.employee_id = j.employee_id;

select e.first_name as employee, m.first_name as manager
from employees e join employees m
on e.manager_id = m.employee_id;


-- Write a query to print country name, country id and region name for each country
SELECT c.country_name, c.country_id, r.region_id 
FROM countries c JOIN regions r
ON c.region_id = r.region_id;

-- Write a query to print last name email and jon title for each employee
SELECT last_name, email, job_title FROM employees e JOIN jobs j
ON e.job_id = j.job_id;

SELECT * FROM employees;
--Write a query to get count of employees for each manager and order by count of employees.
SELECT m.manager_id, COUNT(*) FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
GROUP BY m.manager_id
ORDER BY COUNT(*);

--Find the employees with the salary more than their managers salary (Interview question)
SELECT e.first_name, e.salary, m.salary 
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;






=====================================================================================
-----------------------------------PROJECT01-----------------------------------------
=====================================================================================
SELECT * FROM employees;

--1. Write a query to display the employee id, employee name (first name and last 
--name) for all employees who earn more than the average salary. 
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--2. Write a query to display the employee name (first name and last name), employee 
--id, and salary of all employees who report to Payam. 
SELECT e.first_name, e.last_name, e.employee_id, e.salary 
FROM employees e JOIN employees m 
ON e.manager_id = m.employee_id
WHERE m.first_name = 'Payam';

--3. Write a query to display the department number, name (first name and last name),
--job_id and department name for all employees in the Finance department.
SELECT d.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e JOIN departments d 
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

--4. Write a query to display all the information of the employees whose salary is within
--the range of the smallest salary and 2500.
SELECT * FROM employees
WHERE salary >= (SELECT MIN(salary) FROM employees) 
AND salary <= 2500;

--5. Write a SQL query to find the first name, last name, department, city, and state 
--province for each employee.
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

--6. Write a SQL query to find all those employees who work in department ID 80 or 40.
--Return first name, last name, department number, and department name.
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IN (40, 80);

--7.  Write a query to display the employee name (first name and last name) and hire 
--date for all employees in the same department as Clara. Exclude Clara.
SELECT first_name, last_name, hire_date FROM employees
WHERE department_id = (SELECT department_id FROM employees
WHERE first_name = 'Clara')
AND first_name <> 'Clara';

--8. Write a query to display the employee number, name (first name and last name), 
--and salary for all employees who earn more than the average salary and who work
--in a department with any employee with a J in their name.
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN (SELECT department_id FROM employees
WHERE first_name LIKE '%J%');

--9. Write a SQL query to find those employees whose first name contains the letter ‘z’.
--Return first name, last name, department, city, and state province.
SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE first_name LIKE '%z%';

--10. Write a SQL query to find all departments, including those without 
--employees. Return first name, last name, department ID, department name.
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments d LEFT JOIN employees e
ON e.department_id = d.department_id;


--11. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is smaller than any salary of 
--those employees whose job title is MK_MAN.
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < ANY (SELECT salary FROM employees
WHERE job_id = 'MK_MAN');

--12. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is more than any salary of those
--employees whose job title is PU_MAN. Exclude job title PU_MAN.
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < ANY (SELECT salary FROM employees
WHERE job_id = 'PU_MAN')
AND job_id <> 'PU_MAN';

--13. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is more than any average salary
--of any department.
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--14. Write a query to display the department id and the total salary for those 
--departments which contains at least one employee.
SELECT department_id, SUM(salary) FROM employees
GROUP BY department_id
HAVING COUNT(*) > 0;

--15. Write a SQL query to find the employees who earn less than the employee of
--ID 182. Return first name, last name and salary.
SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT salary FROM employees
WHERE employee_id = 182);

--16. Write a SQL query to find the employees and their managers. Return the first
--name of the employee and manager.
SELECT e.first_name as employee, m.first_name as manager
FROM employees e JOIN employees m
ON e.manager_id = m.manager_id;

--17. Write a SQL query to display the department name, city, and state province 
--for each department.
SELECT d.department_name, l.city, l.state_province
FROM departments d JOIN locations l
ON d.location_id = l.location_id;

--18. Write a query to identify all the employees who earn more than the average 
--and who work in any of the IT departments.
SELECT e.employee_id, e.first_name, e.last_name, e.salary 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
AND department_name = 'IT';

--19. Write a SQL query to find out which employees have or do not have a 
--department. Return first name, last name, department ID, department name.
SELECT e.first_name, e.last_name, 
    e.department_id || '' AS department_id, 
    d.department_name || '' AS department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;


--20. Write a SQL query to find the employees and their managers, Those 
--managers do not work under any manager also appear in the list, Return the first 
--name of the employee and manager.
SELECT e.first_name as employee, m.first_name as manager
FROM employees e LEFT JOIN employees m 
ON e.manager_id = m.manager_id
WHERE (e.manager_id IS NULL AND m.employee_id IS NULL)
OR (e.manager_id IS NOT NULL AND m.employee_id IS NOT NULL);

--21.  Write a query to display the name (first name and last name) for those 
--employees who gets more salary than the employee whose ID is 163.
SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees
WHERE employee_id = 163);

--22.  Write a query to display the name (first name and last name), salary, 
--department id, job id for those employees who works in the same designation as 
--the employee works whose id is 169.
SELECT first_name, last_name, salary, department_id, job_id 
FROM employees
WHERE job_id = (SELECT job_id FROM employees
WHERE employee_id = 169);

--23. Write a SQL query to find the employees who work in the same department 
--as the employee with the last name Taylor. Return first name, last name and 
--department ID.
SELECT e.first_name, e.last_name, e.department_id 
FROM employees e JOIN employees t
ON e.department_id = t.department_id
WHERE t.last_name = 'Taylor';

--24. Write a SQL query to find the department name and the full name (first and 
--last name) of the manager.
SELECT d.department_name, CONCAT(CONCAT(e.first_name, ' '), e.last_name) as manager
FROM departments d JOIN employees e
ON d.manager_id = e.employee_id;

--25. Write a SQL query to find the employees who earn $12000 or more. Return 
--employee ID, starting date, end date, job ID and department ID.
SELECT j.employee_id, j.start_date, j.end_date, j.job_id, j.department_id
FROM job_history j JOIN employees e
ON j.employee_id = e.employee_id
WHERE salary >= 12000;

--26. Write a query to display the name (first name and last name), salary, 
--department id for those employees who earn such amount of salary which is the 
--smallest salary of any of the departments.
SELECT first_name, last_name, salary, department_id
FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

--27. Write a query to display all the information of an employee whose salary and
--reporting person id is 3000 and 121, respectively.
--SELECT * FROM employees
--WHERE manager_id = (SELECT manager_id FROM employees
--WHERE manager_id = 121 
--AND salary = 3000);
SELECT * FROM employees
WHERE salary = 3000 AND manager_id = 121;

--28. Display the employee name (first name and last name), employee id, and job
--title for all employees whose department location is Toronto.
SELECT first_name, last_name, employee_id, job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE department_id = (SELECT department_id 
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'Toronto');

SELECT * FROM locations;
--29. Write a query to display the employee name( first name and last name ) and 
--department for all employees for any existence of those employees whose salary is
--more than 3700.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE salary > 3700;

--30.  Write a query to determine who earns more than employee with the last 
--name 'Russell'.
SELECT * FROM employees
WHERE salary > (SELECT salary FROM employees
WHERE last_name = 'Russel');

--31. Write a query to display the names of employees who don't have a manager.
SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

--32. Write a query to display the names of the departments and the number of 
--employees in each department.
SELECT COUNT(e.employee_id), d.department_name 
FROM departments d LEFT JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name;

--33. Write a query to display the last name of employees and the city where they 
--are located.
SELECT e.last_name, l.city 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

--34. Write a query to display the job titles and the average salary of employees 
--for each job title.
SELECT job_id, AVG(salary) FROM employees
GROUP BY job_id;

--35. Write a query to display the employee's name, department name, and the 
--city of the department.
SELECT first_name, department_name, city 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

--36. Write a query to display the names of employees who do not have a 
--department assigned to them.
SELECT first_name, last_name FROM employees
WHERE department_id IS NULL;

--37. Write a query to display the names of all departments and the number of 
--employees in them, even if there are no employees in the department.
SELECT COUNT(*) as total, d.department_name 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

--38. Write a query to display the names of employees and the department 
--names, but only include employees whose salary is above 10,000.
SELECT d.department_name, e.first_name, e.last_name 
FROM departments d  JOIN employees e
ON d.department_id = e.department_id
WHERE e.salary > 10000;

--39. Write a query to display department names and the average salary within 
--each department, but only for departments with an average salary above 7000.
SELECT d.department_name, AVG(e.salary) 
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 7000;
SELECT * FROM departments;
--40. Write a query to display the names of employees who work in the 'IT' 
--department.
SELECT e.first_name, e.last_name 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'IT';

--41. Write a query which is looking for the names of all employees whose salary is
--greater than 50% of their department’s total salary bill.
SELECT first_name, last_name
FROM employees e JOIN (
SELECT department_id, SUM(salary) as total FROM employees 
GROUP BY department_id) d
ON e.department_id = d.department_id
WHERE e.salary > (0.5 * d.total);

--42. Write a query to get the details of employees who are managers.
SELECT * FROM employees
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);

--43.  Write a query in SQL to display the department code and name for all 
--departments which located in the city London.
SELECT department_name, department_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'London';

--44. Write a query in SQL to display the first and last name, salary, and 
--department ID for all those employees who earn more than the average salary and
--arrange the list in descending order on salary.
SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary desc;

--45. Write a query in SQL to display the first and last name, salary, and 
--department ID for those employees who earn more than the maximum salary of a 
--department which ID is 40.
SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees
WHERE department_id = 40);

--46. Write a query in SQL to display the department name and Id for all 
--departments where they located, that Id is equal to the Id for the location where 
--department number 30 is located.
SELECT d.department_name, d.department_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE l.location_id = (SELECT location_id FROM departments
WHERE department_id = 30);

--47. Write a query in SQL to display the details of departments managed by 
--Susan.
SELECT d.department_id, d.department_name, d.location_id
FROM departments d JOIN  employees e
ON d.manager_id = e.employee_id
WHERE e.first_name = 'Susan';

--48. Write a query to display the department names and the location cities. Only 
--include departments that are located in a country with the country_id 'US'.
SELECT d.department_name, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE country_id = 'US';

--49. Write a query to display the first name and last name of employees along 
--with the name of the department they work in. Only include employees whose last 
--name starts with the letter 'S'.
SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name LIKE 'S%';

--50. Write a query to display the department names and the number of 
--employees in each department. Only include departments with more than 2 
--employees, and order the result by the number of employees in descending order.
SELECT d.department_name, COUNT(e.employee_id)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2
ORDER BY COUNT(e.employee_id) desc;


















































