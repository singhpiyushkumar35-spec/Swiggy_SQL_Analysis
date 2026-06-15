USE company_db ;
-- Q1. Write a SQL query to display EmployeeID, FirstName, LastName,
-- and DepartmentName for employees who belong to a department.

SELECT employees.EmployeeID , employees.FirstName ,
employees.LastName , departments.DepartmentName
FROM employees
INNER JOIN departments
ON employees.DepartmentID = departments.DepartmentID ;


-- Q2. Write a SQL query to display EmployeeID, FirstName, and Salary
-- for employees who have a salary record.

SELECT e.EmployeeID, e.FirstName , s.Salary
FROM employees e
INNER JOIN salaries s
ON e.EmployeeID = s.EmployeeID;

-- Q3. Write a SQL query to display EmployeeID, FirstName,
-- and DepartmentName for all employees, even if they do not belong to any department.

SELECT e.EmployeeID , e.FirstName, d.DepartmentName 
FROM employees e
LEFT JOIN department d
ON e.DepartmentID = d.DepartmentID;
 

-- Q4. Write a SQL query to display all departments along with employees
-- working in them. Departments without employees should also appear.
CREATE VIEW v1 As (
SELECT e.DepartmentID , e.FirstName , d.DepartmentName 
FROM employees e
RIGHT JOIN departments d
ON e.DepartmentID = d.DepartmentID) ;

SELECT * FROM v1;

-- Q5. Write a SQL query to display EmployeeID, FirstName,
-- DepartmentName, and Salary for employees who have both
-- department and salary information.

SELECT e.EmployeeID , e.FirstName , d.DepartmentName , s.Salary
FROM employees e
INNER JOIN departments d
ON e.DepartmentID = d.DepartmentID 
JOIN salaries s
ON e.EmployeeID = s.EmployeeID ; 


-- Q6. Write a SQL query to display all employees and their salary.
-- Employees without salary should also appear.
 
 SELECT e.EmployeeID , e.FirstName , s.Salary 
 FROM employees e
 LEFT JOIN salaries s
ON e.EmployeeID = s.EmployeeID;

-- -- Q7 Display employees who do not have a salary record.

SELECT e.EmployeeID , s.Salary
FROM employees e
LEFT JOIN salaries 
ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;


-- Q8
-- Display all departments and employees working in them.
-- Departments with no employees should also be displayed

SELECT d.DepartmentName, e.EmployeeID, e.FirstName
FROM department d
LEFT JOIN employees e
ON d.DepartmentID = e.DepartmentID;



-- Q9
-- UNION employees FirstName and DepartmentName

SELECT FirstName AS Name
FROM employees

UNION

SELECT DepartmentName
FROM departments;


-- Q10 UNION ALL employees FirstName and DepartmentName
 

SELECT FirstName AS Name
FROM employees

UNION ALL

SELECT DepartmentName  As Name
FROM departments;


-- Q11
-- Display EmployeeID from employees and salaries using UNION

SELECT EmployeeID
FROM employees

UNION

SELECT  EmployeeID
FROM salaries ;


-- Q12 Find employees appearing in both employees and salaries tables

SELECT e.EmployeeID
FROM employees e
INNER JOIN salaries s
ON e.EmployeeID = s.EmployeeID;

-- Q13. Write a SQL query to generate all possible combinations
-- of employees and departments.

SELECT e.* , d.*
FROM employees e
CROSS JOIN departments d ;

-- Q14. Write a SQL query using SELF JOIN to display pairs of employees
-- who work in the same department.

SELECT e1.FirstName  , e1.EmployeeID, e2.DepartmentID
FROM employees e1
JOIN employees e2
ON e1.DepartmentID = e2.DepartmentID
AND e1.EmployeeID > e2.EmployeeID;

