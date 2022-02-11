CREATE DATABASE ASSIGNMENT202
use ASSIGNMENT202
use master
DROP DATABASE ASSIGNMENT202

CREATE TABLE Trainee(
	traineeID int identity primary key,
	full_name varchar(50),
	brith_date date,
	gender varchar(10),
	et_iq int  CHECK (et_iq BETWEEN 0 AND 20),
	et_gmath int CHECK (et_gmath BETWEEN 0 AND 20),
	et_english int CHECK (et_english BETWEEN 0 AND 20),
	training_class int,
	evaluation_notes text
)

---a-----
INSERT INTO Trainee VALUES
('phong','2-2-2000','nam',10,12,18,5,'gioi'),
('linh','6-2-2000','nu',11,12,13,5,'gioi'),
('phu','12-5-2000','nam',13,12,13,5,'gioi'),
('long','4-7-2000','nam',11,12,13,5,'gioi'),
('ha','4-6-2000','nam',10,12,18,5,'gioi'),
('hao','1-3-2000','nam',11,12,13,5,'gioi'),
('thinh','9-11-2000','nam',11,12,13,5,'gioi'),
('thuy','2-10-2000','nu',17,9,9,5,'gioi'),
('nhunggg','12-2-2000','nu',10,12,18,5,'gioi'),
('giang','6-10-2000','nam',17,9,9,5,'gioi')
SELECT * FROM Trainee
DROP TABLE Trainee
---b------
ALTER TABLE Trainee 
ADD Fsoft_Account varchar(50) NOT NULL UNIQUE (Fsoft_Account)

SELECT * FROM Trainee


---c-------
CREATE VIEW c
as
SELECT *
FROM Trainee
WHERE (et_iq + et_gmath)>=20 AND et_iq >= 8 AND et_gmath >= 8 AND et_english >= 18
select * FROM c

---d--------
SELECT full_name, MONTH(brith_date) AS 'birth month'
FROM c
ORDER BY c.brith_date ASC

---e---------
SELECT TOP 1 *
FROM Trainee
ORDER BY LEN(full_name) DESC