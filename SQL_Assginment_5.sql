
--==============================================================================================================--
--Task 1:-
--==============================================================================================================--

---1-Create University Database give any University name you want

Create Database University

------------------------------------------------------------------------------------------------------------------

---2-Under this University Create four tables and each table should have following three Column named as:-
----A-College_Table
-----College_ID(PK)
-----College_Name
-----College_Area
----B-Department_Table
-----Dept_ID(PK)
-----Dept_Name
-----Dept_Facility
----C-Professor_Table
-----Professor_ID(PK)
-----Professor_Name
-----Professor_Subject
----D-Student_Table
-----Student_ID(PK)
-----Student_Name
-----Student_Stream

Create table College_Table(College_ID int primary key, College_Name varchar(max), College_Area varchar(max))

Create table Department_Table(Dept_ID int primary key, Dept_Name varchar(max), Dept_Facility varchar(max))

Create table Professor_Table(Professor_ID int primary key, Professor_Name varchar(max), Professor_Subject varchar(max))

Create table Student_Table(Student_ID int primary key, Student_Name varchar(max), Student_Stream varchar(max))

------------------------------------------------------------------------------------------------------------------

---3-Apply foreign key on Department key from College_table

alter table Department_Table
add constraint fk_Department_Table Foreign Key(Dept_ID)
references College_Table

------------------------------------------------------------------------------------------------------------------

---4-Apply foreign Key on Student_Table from Professor_Table

alter table Student_Table
add constraint fk_Student_Table Foreign Key(Student_ID)
references Professor_Table

------------------------------------------------------------------------------------------------------------------

---5-Insert atleast 10 Records in each table

----Insert into College_Table
insert into College_Table values (1, 'ABC College', 'City Center')
insert into College_Table values (2, 'XYZ College', 'Suburban Area')
insert into College_Table values (3, 'EFG College', 'Downtown')
insert into College_Table values (4, 'LMN College', 'Rural Area')
insert into College_Table values (5, 'PQR College', 'Industrial Zone')
insert into College_Table values (6, 'STU College', 'Coastal Area')
insert into College_Table values (7, 'JKL College', 'Mountain Region')
insert into College_Table values (8, 'RST College', 'Residential Area')
insert into College_Table values (9, 'UVW College', 'Historic District')
insert into College_Table values (10, 'MNO College', 'Business Park')

----Insert into Department_Table
insert into Department_Table values (1, 'Computer Science', 'High-speed Internet')
insert into Department_Table values (2, 'Electrical Engineering', 'Advanced Laboratories')
insert into Department_Table values (3, 'Physics', 'State-of-the-art Equipment')
insert into Department_Table values (4, 'Mathematics', 'Interactive Learning Resources')
insert into Department_Table values (5, 'Biology', 'Research Facilities')
insert into Department_Table values (6, 'Chemistry', 'Chemical Safety Equipment')
insert into Department_Table values (7, 'English Literature', 'Extensive Library')
insert into Department_Table values (8, 'History', 'Archival Resources')
insert into Department_Table values (9, 'Business Administration', 'Industry Partnerships')
insert into Department_Table values (10, 'Psychology', 'Counseling Services')

----Insert into Professor_Table
insert into Professor_Table values (1, 'John Smith', 'Computer Networks')
insert into Professor_Table values (2, 'Jane Doe', 'Digital Signal Processing')
insert into Professor_Table values (3, 'Michael Johnson', 'Quantum Mechanics')
insert into Professor_Table values (4, 'Emily Brown', 'Abstract Algebra')
insert into Professor_Table values (5, 'David Taylor', 'Genetics')
insert into Professor_Table values (6, 'Sarah Wilson', 'Organic Chemistry')
insert into Professor_Table values (7, 'Christopher Lee', 'English Literature')
insert into Professor_Table values (8, 'Jessica Clark', 'Ancient History')
insert into Professor_Table values (9, 'Andrew Martinez', 'Entrepreneurship')
insert into Professor_Table values (10, 'Rachel White', 'Cognitive Psychology')

----Insert into Student_Table
insert into Student_Table values (1, 'Alex Johnson', 'Computer Science')
insert into Student_Table values (2, 'Emma Wilson', 'Electrical Engineering')
insert into Student_Table values (3, 'Daniel Brown', 'Physics')
insert into Student_Table values (4, 'Sophia Taylor', 'Mathematics')
insert into Student_Table values (5, 'James Martinez', 'Biology')
insert into Student_Table values (6, 'Olivia Clark', 'Chemistry')
insert into Student_Table values (7, 'William Anderson', 'English Literature')
insert into Student_Table values (8, 'Ava Lee', 'History')
insert into Student_Table values (9, 'Ethan Davis', 'Business Administration')
insert into Student_Table values (10, 'Mia Moore', 'Psychology')

--==============================================================================================================--
--Task 2:-
--==============================================================================================================--

---1-Give the information of College_ID and College_name from College_Table

Select College_ID, College_Name from College_Table

------------------------------------------------------------------------------------------------------------------

---2-Show  Top 5 rows from Student table.

Select * from Student_Table
where Student_ID between 1 and 5

------------------------------------------------------------------------------------------------------------------

---3-What is the name of  professor  whose ID  is 5

Select Professor_Name from Professor_Table
where Professor_ID=5

------------------------------------------------------------------------------------------------------------------

---4-Convert the name of the Professor into Upper case 

Select UPPER(Professor_Name) from Professor_Table

------------------------------------------------------------------------------------------------------------------

---5-Show me the names of those students whose name is start with a

Select Student_Name from Student_Table
where SUBSTRING(Student_Name, 1, 1)='A'

------------------------------------------------------------------------------------------------------------------

---6-Give the name of those colleges whose end with a

Select College_Name from College_Table
where SUBSTRING(College_Name, LEN(College_Name), 1)='a'

------------------------------------------------------------------------------------------------------------------

---7-Add one Salary Column in Professor_Table

alter table Professor_Table add Professor_Sal int

update Professor_Table set Professor_Sal=54321 where Professor_ID=1
update Professor_Table set Professor_Sal=65432 where Professor_ID=2
update Professor_Table set Professor_Sal=76543 where Professor_ID=3
update Professor_Table set Professor_Sal=87654 where Professor_ID=4
update Professor_Table set Professor_Sal=98765 where Professor_ID=5
update Professor_Table set Professor_Sal=87654 where Professor_ID=6
update Professor_Table set Professor_Sal=76543 where Professor_ID=7
update Professor_Table set Professor_Sal=65432 where Professor_ID=8
update Professor_Table set Professor_Sal=54321 where Professor_ID=9
update Professor_Table set Professor_Sal=98765 where Professor_ID=10

------------------------------------------------------------------------------------------------------------------

---8-Add one Contact Column in Student_table

alter table Student_Table
add Contact bigint

update Student_Table set Contact=1234567890 where Student_ID=1
update Student_Table set Contact=2345678901 where Student_ID=2
update Student_Table set Contact=3456789012 where Student_ID=3
update Student_Table set Contact=4567890123 where Student_ID=4
update Student_Table set Contact=5678901234 where Student_ID=5
update Student_Table set Contact=6789012345 where Student_ID=6
update Student_Table set Contact=7890123456 where Student_ID=7
update Student_Table set Contact=8901234567 where Student_ID=8
update Student_Table set Contact=9012345678 where Student_ID=9
update Student_Table set Contact=9876543210 where Student_ID=10


------------------------------------------------------------------------------------------------------------------

---9-Find the total Salary of Professor 

Select SUM(Professor_Sal) 'Total Professor_Sal' from Professor_Table

------------------------------------------------------------------------------------------------------------------

---10-Change datatype of any one column of any one Table

alter table Professor_Table
alter column Professor_Sal bigint

--==============================================================================================================--
--Task 3:-
--==============================================================================================================--

---1-Show first 5 records from Students table and Professor table Combine

With Task3_1 As
(
Select ST.*, PT.* from  Student_Table ST
inner join Professor_Table PT
on ST.Student_ID=PT.Professor_ID
)
Select * from Task3_1
where Student_ID<6

------------------------------------------------------------------------------------------------------------------

---2-Apply Inner join on all 4 tables together

Select CT.*, DT.*, PT.*, ST.* from College_Table CT
inner join Department_Table DT on CT.College_ID=DT.Dept_ID
inner join Professor_Table PT on DT.Dept_ID=PT.Professor_ID
inner join Student_Table ST on PT.Professor_ID=ST.Student_ID

------------------------------------------------------------------------------------------------------------------

---3-Show Some null values from Department table and Professor table.

Select DT.*, PT.* from Department_Table DT
full join Professor_Table PT
on DT.Dept_ID=PT.Professor_ID+1

------------------------------------------------------------------------------------------------------------------

---4-Create a View from College Table  and give those records whose college name starts with C

Select * from College_Table
where SUBSTRING(College_Name, 1, 1)='c'

------------------------------------------------------------------------------------------------------------------

---5-Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.

Create proc Prof
@cusid int
As
Begin
Select * from Professor_Table
where Professor_ID=@cusid
end

exec Prof @cusid=10

------------------------------------------------------------------------------------------------------------------

---6-Rename the College_Table to College_Tables_Data .

exec sp_rename 'College_Table', 'College_Tables_Data'

------------------------------------------------------------------------------------------------------------------
