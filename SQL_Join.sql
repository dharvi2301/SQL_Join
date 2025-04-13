--Create the database 
CREATE DATABASE EmployeeManagement;

--Use Database 
USE EmployeeManagement;

--Create Department table
CREATE TABLE Department (
    DepartmentId INT PRIMARY KEY,
    DepartmentName VARCHAR(200)
);

--Create Employee Table 
CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    EmployeeName VARCHAR(200),
    DepartmentId INT,
    Experience INT,
    Salary DECIMAL(10, 2) Check (Salary>0),
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);

--Insert records in the Department Table
INSERT INTO Department (DepartmentId, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

--Insert records in the Employee Table 
INSERT INTO Employee (EmployeeName, DepartmentId, Experience, Salary) VALUES
('Alice',     1, 12, 70000),
('Bob',       2,  9, 65000),
('Charlie',   3,  6, 90000),
('Diana',     3,  3, 85000),
('Edward',    4,  1, 50000),
('Fiona',     2,  8, 67000),
('George',    1,  5, 60000),
('Hannah',    4, 11, 75000),
('Ian',       3,  7, 92000),
('Jane',      4,  2, 55000);

--Query display empId,EmpName and DepartmentName
SELECT 
    E.EmployeeId, 
    E.EmployeeName, 
    D.DepartmentName
FROM 
    Employee E
JOIN 
    Department D ON E.DepartmentId = D.DepartmentId;

--Query to display department wise employee count
SELECT 
    D.DepartmentName, 
    COUNT(E.EmployeeId) AS EmployeeCount
FROM 
    Department D
LEFT JOIN 
    Employee E ON D.DepartmentId = E.DepartmentId
GROUP BY 
    D.DepartmentName;

--Query to display department wise maximum salary
SELECT 
    D.DepartmentName, 
    MAX(E.Salary) AS MaxSalary
FROM 
    Department D
LEFT JOIN 
    Employee E ON D.DepartmentId = E.DepartmentId
GROUP BY 
    D.DepartmentName;


--Query to display employee name in the ascending order of department name
SELECT 
    E.EmployeeName, 
    D.DepartmentName
FROM 
    Employee E
JOIN 
    Department D ON E.DepartmentId = D.DepartmentId
ORDER BY 
    D.DepartmentName ASC, E.EmployeeName ASC;

--Query to display employeeName and grade where grade criteria is as below
--if employee has more than 10 years of experience then grade is expert
--if employee has experience between 7 to 10 years then its grade is advanced
--if employee has experience between 5 to 7 years then its grade is intermediate
--if employee has experience between 2 to 5 year then its grade is beginner
--and for the rest of case display grade as novice

SELECT 
    EmployeeName,
    CASE 
        WHEN Experience > 10 THEN 'Expert'
        WHEN Experience BETWEEN 7 AND 10 THEN 'Advanced'
        WHEN Experience BETWEEN 5 AND 6 THEN 'Intermediate'
        WHEN Experience BETWEEN 2 AND 4 THEN 'Beginner'
        ELSE 'Novice'
    END AS Grade
FROM 
    Employee;







