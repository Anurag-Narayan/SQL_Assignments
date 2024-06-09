Create table EmployeeDetails(EmpId int, FullName varchar(max), ManagerId int, DateOfJoining date, City varchar(max));

insert into EmployeeDetails values('121', 'John Snow', '321', '2019/01/31', 'Toronto');
insert into EmployeeDetails values('321', 'Walter White', '986', '2020/01/30', 'California');
insert into EmployeeDetails values('421', 'Kuldeep Rana', '876', '2021/11/27', 'Toronto');

Create table EmployeeSalary(EmpId int, Project varchar(max), Salary int, Variable int);

insert into EmployeeSalary values('121', 'P1', '8000', '500');
insert into EmployeeSalary values('321', 'P2', '10000', '1000');
insert into EmployeeSalary values('421', 'P1', '12000', '0');

--Basics and Intermediate ASSINGMENT 

---ASSINGMENT nos - 1

----1-SQL Query to fetch records that are present in one table but not in another table.

Select ED.*, ES.* from EmployeeDetails ED
left join EmployeeSalary ES
on ED.EmpId=ES.EmpId
where ES.EmpId is null or ES.Project is null or ES.Salary is null or ES.Variable is null;

----2-SQL query to fetch all the employees who are not working on any project.

Select ED.*, ES.* from EmployeeDetails ED
left join EmployeeSalary ES
on ED.EmpId=ES.EmpId
where ES.Project is null;

----3-SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

----4-Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

SELECT ED.* FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----5-Write an SQL query to fetch a project-wise count of employees.

SELECT Project, COUNT(EmpId) as EmployeeCount
FROM EmployeeSalary
GROUP BY Project;

----6-Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT ED.FullName, ES.Salary
FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----7-Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EmployeeDetails
WHERE EmpId IN (SELECT DISTINCT ManagerId FROM EmployeeDetails);

----8-Write an SQL query to fetch duplicate records from EmployeeDetails.

SELECT EmpId, FullName, ManagerId, DateOfJoining, City, COUNT(*)
FROM EmployeeDetails
GROUP BY EmpId, FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

----9-Write an SQL query to fetch only odd rows from the table.

SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY EmpId) as RowNum
    FROM EmployeeDetails
) as Temp
WHERE RowNum % 2 <> 0;

----10-Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT Salary FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) as Rank
    FROM EmployeeSalary
) as Temp
WHERE Rank = 3;

---ASSINGMENT nos - 2

----1-Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.

SELECT EmpId, FullName FROM EmployeeDetails
WHERE ManagerId = 986;

----2-Write an SQL query to fetch the different projects available from the EmployeeSalary table.

SELECT DISTINCT Project FROM EmployeeSalary;

----3-Write an SQL query to fetch the count of employees working in project ‘P1’.

SELECT COUNT(EmpId) as EmployeeCount FROM EmployeeSalary
WHERE Project = 'P1';

----4-Write an SQL query to find the maximum, minimum and average salary of the employees.

SELECT MAX(Salary) as MaxSalary, MIN(Salary) as MinSalary, AVG(Salary) as AvgSalary
FROM EmployeeSalary;

----5-Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.

SELECT EmpId FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;

----6-Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT * FROM EmployeeDetails
WHERE City = 'Toronto' AND ManagerId = 321;

----7-Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT * FROM EmployeeDetails
WHERE City = 'California' OR ManagerId = 321;

----8-Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT * FROM EmployeeSalary
WHERE Project <> 'P1';

----9-Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT EmpId, (Salary + Variable) as TotalSalary FROM EmployeeSalary;

----10-Write an SQL query to fetch the employees whose name begins with any two characters followed by a text “hn” and ends with any sequence of characters.

SELECT * FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

---ASSINGMENT nos - 3

----1-Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.

SELECT EmpId FROM EmployeeDetails
UNION
SELECT EmpId FROM EmployeeSalary;

----2-Write an SQL query to fetch common records between two tables.

SELECT ED.* FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----3-Write an SQL query to fetch records that are present in one table but not in another table.

SELECT ED.* FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId
WHERE ES.EmpId IS NULL;

----4-Write an SQL query to fetch the EmpIds that are present in both the tables – ‘EmployeeDetails’ and ‘EmployeeSalary.

SELECT ED.EmpId FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----5-Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT EmpId FROM EmployeeDetails
WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);

----6-Write an SQL query to fetch the employee’s full names and replace the space.

SELECT REPLACE(FullName, ' ', '') as FullNameNoSpace FROM EmployeeDetails;

----7-Write an SQL query to fetch the position of a given character(s) in a field.

SELECT CHARINDEX('n', FullName) as Position FROM EmployeeDetails;

----8-Write an SQL query to display both the EmpId and ManagerId together.

SELECT CONCAT(EmpId, '-', ManagerId) as EmpAndManager FROM EmployeeDetails;

----9-Write a query to fetch only the first name (string before space) from the FullName column of the EmployeeDetails table.

SELECT LEFT(FullName, CHARINDEX(' ', FullName) - 1) as FirstName FROM EmployeeDetails;

----10-Write an SQL query to uppercase the name of the employee and lowercase the city values.

SELECT UPPER(FullName) as FullNameUpper, LOWER(City) as CityLower FROM EmployeeDetails;

---ASSINGMENT nos - 4

----1-Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.

SELECT FullName, LEN(FullName) - LEN(REPLACE(FullName, 'n', '')) as CountOfN FROM EmployeeDetails;

----2-Write an SQL query to update the employee names by removing leading and trailing spaces.

UPDATE EmployeeDetails
SET FullName = LTRIM(RTRIM(FullName));

----3-Fetch all the employees who are not working on any project.

SELECT ED.* FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId
WHERE ES.Project IS NULL;

----4-Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.

SELECT ED.FullName FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId
WHERE ES.Salary BETWEEN 5000 AND 10000;

----5-Write an SQL query to find the current date-time.

SELECT GETDATE() as CurrentDateTime;

----6-Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.

SELECT * FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

----7-Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.

SELECT ED.* FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----8-Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.

SELECT Project, COUNT(EmpId) as EmployeeCount FROM EmployeeSalary
GROUP BY Project
ORDER BY EmployeeCount DESC;

----9-Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.

SELECT ED.FullName, ES.Salary FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId;

----10-Write an SQL query to join 3 tables.

-- Assuming a third table "EmployeeProject" with columns EmpId, ProjectId, and ProjectName

Create table EmployeeProject(EmpId int, ProjectId int, ProjectName varchar(max));

-- Inserting some values for example
insert into EmployeeProject values('121', '1', 'Project A');
insert into EmployeeProject values('321', '2', 'Project B');
insert into EmployeeProject values('421', '1', 'Project A');

SELECT ED.*, ES.*, EP.* FROM EmployeeDetails ED
INNER JOIN EmployeeSalary ES
ON ED.EmpId = ES.EmpId
INNER JOIN EmployeeProject EP
ON ED.EmpId = EP.EmpId;

---Advanced ASSIGNMENT

Create Table EmployeeInfo(EmpID int, EmpFName varchar(max), EmpLName varchar(max), Department varchar(max), Project varchar(max), Address varchar(max), DOB date, Gender varchar(max));

insert into EmployeeInfo values('1', 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '1976/12/01', 'M');
insert into EmployeeInfo values('2', 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968/05/02', 'F');
insert into EmployeeInfo values('3', 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980/01/01', 'M');
insert into EmployeeInfo values('4', 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992/05/02', 'F');
insert into EmployeeInfo values('5', 'Ankit', 'Kapur', 'Admin', 'P2', 'Delhi(DEL)', '1994/07/03', 'M');

Create Table EmployeePosition(EmpID int, EmpPosition varchar(max), DateOfJoining date, Salary int);

insert into EmployeePosition values('1', 'Manager', '2022/05/01', '500000');
insert into EmployeePosition values('2', 'Executive', '2022/05/02', '75000');
insert into EmployeePosition values('3', 'Manager', '2022/05/01', '90000');
insert into EmployeePosition values('2', 'Lead', '2022/05/02', '85000');
insert into EmployeePosition values('1', 'Executive', '2022/05/01', '300000');

---Advanced Assignment

----1-Write an SQL query to fetch the count of employees working in the project ‘P1’.

SELECT COUNT(EmpID) as EmployeeCount FROM EmployeeInfo
WHERE Project = 'P1';

----2-Write an SQL query to fetch the employees who are not assigned to any project.

SELECT * FROM EmployeeInfo
WHERE Project IS NULL OR Project = '';

----3-Write an SQL query to fetch the second highest salary from the EmployeePosition table.

SELECT MAX(Salary) as SecondHighestSalary FROM EmployeePosition
WHERE Salary < (SELECT MAX(Salary) FROM EmployeePosition);

----4-Write an SQL query to find the employee whose salary is the highest.

SELECT * FROM EmployeePosition
WHERE Salary = (SELECT MAX(Salary) FROM EmployeePosition);

----5-Write an SQL query to fetch the current date.

SELECT GETDATE() as CurrentDate;

----6-Write an SQL query to fetch the employees who joined before the year 2022.

SELECT * FROM EmployeePosition
WHERE YEAR(DateOfJoining) < 2022;

----7-Write an SQL query to fetch the employees who joined after the year 2022.

SELECT * FROM EmployeePosition
WHERE YEAR(DateOfJoining) > 2022;

----8-Write an SQL query to fetch employee names, DOB, and address of employees whose DOB is between ‘1980-01-01’ and ‘2000-12-31’.

SELECT EmpFName, EmpLName, DOB, Address FROM EmployeeInfo
WHERE DOB BETWEEN '1980-01-01' AND '2000-12-31';

----9-Write an SQL query to fetch the department-wise count of employees.

SELECT Department, COUNT(EmpID) as EmployeeCount FROM EmployeeInfo
GROUP BY Department;

----10-Write an SQL query to fetch the employee names who are working in the HR department.

SELECT EmpFName, EmpLName FROM EmployeeInfo
WHERE Department = 'HR';

----11-Write an SQL query to fetch employees whose first name starts with ‘A’.

SELECT * FROM EmployeeInfo
WHERE EmpFName LIKE 'A%';

----12-Write an SQL query to fetch the position-wise average salary of employees.

SELECT EmpPosition, AVG(Salary) as AverageSalary FROM EmployeePosition
GROUP BY EmpPosition;

----13-Write an SQL query to fetch the employees along with their department name, sorted by department name in ascending order.

SELECT * FROM EmployeeInfo
ORDER BY Department ASC;

----14-Write an SQL query to fetch the employee details whose salary is greater than the average salary.

SELECT * FROM EmployeePosition
WHERE Salary > (SELECT AVG(Salary) FROM EmployeePosition);

----15-Write an SQL query to fetch employee names whose salary is between 50000 and 100000.

SELECT EI.EmpFName, EI.EmpLName FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
WHERE EP.Salary BETWEEN 50000 AND 100000;

----16-Write an SQL query to fetch the number of employees joined in each year.

SELECT YEAR(DateOfJoining) as JoiningYear, COUNT(EmpID) as EmployeeCount FROM EmployeePosition
GROUP BY YEAR(DateOfJoining);

----17-Write an SQL query to fetch the details of employees whose address contains the word ‘DEL’.

SELECT * FROM EmployeeInfo
WHERE Address LIKE '%DEL%';

----18-Write an SQL query to fetch the employee details along with their age.

SELECT EmpID, EmpFName, EmpLName, Department, Project, Address, DOB, Gender,
       DATEDIFF(YEAR, DOB, GETDATE()) as Age
FROM EmployeeInfo;

----19-Write an SQL query to fetch employees along with their designation and department name.

SELECT EI.EmpFName, EI.EmpLName, EP.EmpPosition, EI.Department FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID;

----20-Write an SQL query to fetch the top 3 highest paid employees from each department.

SELECT EmpID, EmpFName, EmpLName, Department, Salary FROM (
    SELECT EI.EmpID, EI.EmpFName, EI.EmpLName, EI.Department, EP.Salary,
           ROW_NUMBER() OVER (PARTITION BY EI.Department ORDER BY EP.Salary DESC) as RowNum
    FROM EmployeeInfo EI
    INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
) as Temp
WHERE RowNum <= 3;

----21-Write an SQL query to fetch employees whose last name ends with ‘a’.

SELECT * FROM EmployeeInfo
WHERE EmpLName LIKE '%a';

----22-Write an SQL query to fetch employees who are born in the year 1990 or later.

SELECT * FROM EmployeeInfo
WHERE YEAR(DOB) >= 1990;

----23-Write an SQL query to fetch the department names along with the highest salary in each department.

SELECT EI.Department, MAX(EP.Salary) as HighestSalary FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
GROUP BY EI.Department;

----24-Write an SQL query to fetch employee details whose salary is less than the minimum salary in the ‘Manager’ position.

SELECT EI.* FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
WHERE EP.Salary < (SELECT MIN(Salary) FROM EmployeePosition WHERE EmpPosition = 'Manager');

----25-Write an SQL query to fetch the department names along with the total salary expenditure for each department.

SELECT EI.Department, SUM(EP.Salary) as TotalSalary FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
GROUP BY EI.Department;

----26-Write an SQL query to fetch employees whose address starts with the letter 'H'.

SELECT * FROM EmployeeInfo
WHERE Address LIKE 'H%';

----27-Write an SQL query to fetch the number of employees in each gender.

SELECT Gender, COUNT(EmpID) as EmployeeCount FROM EmployeeInfo
GROUP BY Gender;

----28-Write an SQL query to fetch the details of employees who have the highest salary in their department.

SELECT EI.*, EP.Salary FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
WHERE EP.Salary = (
    SELECT MAX(Salary) FROM EmployeePosition EP2
    WHERE EP2.EmpID = EI.EmpID
);

----29-Write an SQL query to fetch the employees who are born in the month of December.

SELECT * FROM EmployeeInfo
WHERE MONTH(DOB) = 12;

----30-Write an SQL query to fetch the employee details along with their designation and department name, sorted by salary in descending order.

SELECT EI.EmpFName, EI.EmpLName, EP.EmpPosition, EI.Department, EP.Salary FROM EmployeeInfo EI
INNER JOIN EmployeePosition EP ON EI.EmpID = EP.EmpID
ORDER BY EP.Salary DESC;
