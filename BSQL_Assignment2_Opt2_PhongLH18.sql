CREATE DATABASE Assignment2
USE Assignment2

USE master 
Drop database Assignment2

CREATE TABLE Employee(
	empNo varchar(20) primary key,
	empName varchar(50),
	birthDay date,
	deptNo int,
	mgrNo int NOT NULL,
	startDate date,
	salary money,
	level int CHECK( level BETWEEN 1 AND 7),
	status int CHECK( status BETWEEN 0 AND 2),
	note text
)

CREATE TABLE Skill(
	skillNo int identity primary key,
	skillName varchar(30),
	note text
)

CREATE TABLE Emp_Skill(
	skillNo int,
	empNo varchar(20),
	skillLevel int CHECK(skillLevel BETWEEN 1 AND 3),
	regDate date,
	description text,
	PRIMARY KEY (skillNo, empNo),
	CONSTRAINT fk_skillNo FOREIGN KEY (skillNo) REFERENCES Skill(skillNo),
	CONSTRAINT fk_empNo FOREIGN KEY (empNo) REFERENCES Employee(empNo)
)

CREATE TABLE Department(
	deptNo int identity primary key,
	deptName varchar(50),
	note text
)
-----Q2----------
-----a
ALTER TABLE Employee
ADD email varchar(30) UNIQUE (email)

-----b
ALTER TABLE Employee
ADD DEFAULT 0 FOR mgrNo

ALTER TABLE Employee
ADD DEFAULT 0 FOR status

-----Q3------------
-----a
ALTER TABLE Employee
ADD CONSTRAINT fk_deptNo FOREIGN KEY (deptNo) REFERENCES Department(deptNo)

-----b
ALTER TABLE Emp_Skill
DROP COLUMN description

-----Q4---------
-----a
INSERT INTO Department(deptName, note) VALUES
						('Java', 'no'),
						('C#', 'no'),
						('Python', 'no'),
						('JS', 'no'),
						('C/C++', 'no')

INSERT INTO Employee(empNo, empName, email, birthDay, deptNo, mgrNo, startDate, salary, level, status, note) VALUES
			('no001','linh','linhnx5@gmail.com', '11-3-2000', 1, 1, '1-1-2022',1000,5,0,'no'),
			('no002','hung','hung@gmail.com', '1-1-2000', 1, 1, '1-1-2022',2000,3,0,'no'),
			('no003','phong','phong@gmail.com', '11-5-2000', 2, 1, '1-1-2022',100,1,1,'no'),
			('no004','phu','phu@gmail.com', '9-3-2000', 3, 1, '1-1-2022',1100,6,0,'no'),
			('no005','minh','minh@gmail.com', '7-7-2000', 4, 1, '1-1-2022',500,5,0,'no')

INSERT INTO Skill(skillName,note) VALUES
				('Java','no'),
				('C#','no'),
				('Python','no'),
				('JS','no'),
				('C/C++','no')

INSERT INTO Emp_Skill(skillNo, empNo, skillLevel, regDate) VALUES
					(1,'no001',3,'1-1-2022'),
					(1,'no002',2,'1-1-2022'),
					(2,'no003',1,'1-1-2022'),
					(3,'no004',3,'1-1-2022'),
					(4,'no005',2,'1-1-2022')

SELECT * FROM Department
SELECT * FROM Employee
SELECT * FROM Skill
SELECT * FROM Emp_Skill

-----b

CREATE VIEW Employee_Tracking
AS
SELECT empNo, empName, level FROM Employee
WHERE level >= 3 AND level <= 5

SELECT * FROM Employee_Tracking