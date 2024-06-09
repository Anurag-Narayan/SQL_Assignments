------------------------------------------------------------------------------------------------------------------

Create Table Student(StudentID int primary key, Name varchar(50), Surname varchar(50), Class varchar(10), Gender char(1), SchoolNumber int, BirthYear int)

insert into Student values (1, 'John', 'Doe', '10Math', 'M', 101, 2000)
insert into Student values (2, 'Jane', 'Smith', '10Sci', 'F', 102, 2001)
insert into Student values (3, 'Bob', 'Johnson', '9His', 'M', 103, 2002)
insert into Student values (4, 'Alice', 'Williams', '10Bio', 'F', 104, 2995)
insert into Student values (5, 'David', 'Brown', '9Math', 'M', 105, 2004)
insert into Student values (6, 'Eva', 'Taylor', '10Math', 'F', 106, 2005)
insert into Student values (7, 'Mark', 'Anderson', '9Bio', 'M', 107, 2006)
insert into Student values (8, 'Sophia', 'Martin', '10Sci', 'F', 108, 1997)
insert into Student values (9, 'Daniel', 'Clark', '9His', 'M', 109, 2008)
insert into Student values (10, 'Olivia', 'White', '10Bio', 'F', 110, 1999)
insert into Student values (11, 'Michael', 'Moore', '9Math', 'M', 111, 2002)
insert into Student values (12, 'Emma', 'Davis', '10Math', 'F', 112, 1989)
insert into Student values (13, 'William', 'Lee', '9Bio', 'M', 113, 1996)
insert into Student values (14, 'Ava', 'Jones', '10Sci', 'F', 114, 1997)
insert into Student values (15, 'Matthew', 'Brown', '9His', 'M', 115, 2000)
insert into Student values (16, 'Mia', 'Garcia', '10Bio', 'F', 116, 1993)
insert into Student values (17, 'James', 'Martinez', '9Math', 'M', 117, 1999)
insert into Student values (18, 'Ella', 'Taylor', '10Sci', 'F', 118, 2007)
insert into Student values (19, 'Christopher', 'Clark', '9Bio', 'M', 119, 2018)
insert into Student values (20, 'Sophia', 'Walker', '10Math', 'F', 120, 2019)

------------------------------------------------------------------------------------------------------------------

--1-List all the records in the student chart

Select * from Student

------------------------------------------------------------------------------------------------------------------

--2-List the name surname and class of the student in the student table

Select Name, Surname, Class from Student

------------------------------------------------------------------------------------------------------------------

--3-List the gender Female (F) records in the student table

Select * from Student where Gender='F'

------------------------------------------------------------------------------------------------------------------

--4-List the names of each class in the way of being seen once in the student table

Select distinct Class from Student

------------------------------------------------------------------------------------------------------------------

--5-List the students with Female gender and the class 10Math in the student table

Select * from Student where Gender='F' and Class='10Math'

------------------------------------------------------------------------------------------------------------------

--6-List the names, surnames, and classes of the students in the class 10Math or 10Sci in the student table

Select Name, Surname, Class from Student where Class='10Math' or Class='10Sci'

------------------------------------------------------------------------------------------------------------------

--7-List the students name surname and school number in the student table

Select Name, Surname, SchoolNumber from Student

------------------------------------------------------------------------------------------------------------------

--8-List the students name and surname by combining them as name surname in the student table

Select CONCAT(Name, ' ', Surname) 'Full Name' from Student

------------------------------------------------------------------------------------------------------------------

--9-List the students with the names starting with “A” letter in the student table

Select * from Student
where SUBSTRING(Name, 1, 1)='A'

------------------------------------------------------------------------------------------------------------------

--10-List the students with names Emma Sophia and Robert in the student table

Select * from Student
where Name in ('Emma', 'Sophia', 'Robert')

------------------------------------------------------------------------------------------------------------------

--11-List the students with names starting with A D and K in the student table

Select * from Student
where SUBSTRING(Name, 1, 1) in ('A', 'D', 'K')

------------------------------------------------------------------------------------------------------------------

--12-List the names surnames classes and genders of males in 9Math or females in 9His in the student table

Select Name, Surname, Class, Gender from Student
where Gender='M' and Class='9Math'

Select Name, Surname, Class, Gender from Student
where Gender='F' and Class='9His'

------------------------------------------------------------------------------------------------------------------

--13-List the males whose classes are 10Math or 10Bio

Select * from Student
where Gender='M' and Class='10Math' or Class='9Bio'

------------------------------------------------------------------------------------------------------------------

--14-List the students with birth year 1989 in the student table

Select * from Student
where BirthYear=1989

------------------------------------------------------------------------------------------------------------------
