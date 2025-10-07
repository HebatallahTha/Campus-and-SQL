USE Cis111_MurachCollege

Select * into hatDepartments From Departments
Select * into hatInstructors From Instructors

--query1 
INSERT into hatDepartments (DepartmentName)
values('History');

--query 2
Insert into hatDepartments (DepartmentName) 
values('History');
--query 3
INSERT into hatInstructors
	(LastName, FirstName, Status, DepartmentChairman, HireDate, AnnualSalary, DepartmentID)
Values
	('Benedict','Susan','P',0,GETDATE(),34000.00,9),
	('Adams',null,'F',1,GETDATE(),66000.00,9);
--query 4
 Insert into hatInstructors
 Values ('Benedict','Susan','P',0,GETDATE(),34000.00,9),('Adams',null,'F',1,GETDATE(),66000.00,9);
 --query 5
Update hatInstructors
Set AnnualSalary=35000
Where InstructorID = (SELECT MIN(InstructorID) FROM hatInstructors);
--query 6
DELETE hatInstructors
Where InstructorID = (SELECT MIN(InstructorID) FROM hatInstructors);
--query 7
DELETE hatInstructors
Where DepartmentID = 9;
Delete hatDepartments
Where DepartmentID = 9;
--query 8
UPDATE hatInstructors
Set AnnualSalary = AnnualSalary * 1.05
From hatInstructors i
	Join hatDepartments d
		on i.DepartmentID = d.DepartmentID
Where d.DepartmentName = 'Education';
--query 9
DELETE hatInstructors 
Where InstructorID not in (SELECT distinct InstructorID from Courses where InstructorID is not null);
CREATE TABLE hatGradStudents 
(StudentID INT PRIMARY KEY,
 LastName VARCHAR(25) NOT NULL,
FirstName VARCHAR(25) NOT NULL,
 EnrollmentDate DATE NOT NULL,
 GraduationDate Date NULL);
 --Query 10
 Insert into hatGradStudents 
 Select StudentID, LastName, FirstName, EnrollmentDate, GraduationDate
 From Students
 Where GraduationDate is not null;

