CREATE DATABASE Assignment4
USE Assignment4

USE master
DROP DATABASE Assignment4

CREATE TABLE Movie(
	idMovie int primary key identity,
	moviename varchar(50),
	duration int CHECK (duration >= 1),
	genre int CHECK (genre BETWEEN 1 AND 8),
	director varchar(50),
	amountmoney money,
	comment text
)
CREATE TABLE Actor(
	idActor int primary key identity,
	actorname varchar(50),
	age int,
	averagesalary money,
	nationality varchar(50)
)
CREATE TABLE Actedln(
	idMovie int,
	idActor int,
	note text,
	primary key (idMovie, idActor),
	constraint fk_movie foreign key (idMovie) references Movie(idMovie),
	constraint fk_actor foreign key (idActor) references Actor(idActor),
)
SELECT * FROM Movie
SELECT * FROM Actor
SELECT * FROM Actedln
-----Q2------------
-----a----
ALTER TABLE Movie
ADD imagelink varchar(50) UNIQUE
-----b------
INSERT INTO Movie VALUES ('Iron man',2,1,'Jon Favreau','500000000','good','fsdf'),
('Black Panther',2,1,'Ryan Coogler','400000000','good','jghvbn'),
('Captain Marvel',2,1,'Anna Boden','500000000','good','sfsvbhdf'),
('Avengers',2,1,'Joe Russo','500000000','good','sdfrtz'),
('Captain America',2,1,'Joe Johnston','500000000','good','mfghv')

INSERT INTO Actor VALUES ('Robert Downey Jraa',57,'100000','USA'),
('Chadwick Boseman',44,'90000','USA'),
('Chris Evans',41,'560000','USA'),
('Brie Larson',33,'760000','USA'),
('Chris Hemsworth',39,'550000','USA'),
('Mark Alan Ruffalo',55,'990000','USA')

INSERT INTO Actedln VALUES 
(1,1,'no'),
(2,2,'no'),
(3,4,'no'),
(4,1,'no'),
(4,2,'no'),
(4,3,'no'),
(4,4,'no'),
(4,5,'no'),
(4,6,'no'),
(5,3,'no')

----c----------
UPDATE Actor
SET actorname = 'Robert Downey Jr'
WHERE idActor = 1


-----Q3-----------
-----a-----
SELECT *
FROM Actor a
WHERE a.age > 50

-----b------
SELECT a.actorname , a.averagesalary
FROM Actor a
ORDER BY a.averagesalary

-----c-------
SELECT m.moviename
FROM Movie m INNER JOIN Actedln ac ON m.idMovie = ac.idMovie
		INnER JOIN Actor a  ON a.idActor = ac.idActor
WHERE a.actorname = 'Robert Downey Jr'

-----d-----------
SELECT m.moviename
FROM Movie m INNER JOIN Actedln ac ON m.idMovie = ac.idMovie
GROUP BY m.moviename
HAVING COUNT(ac.idActor) > 3