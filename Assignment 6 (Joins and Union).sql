#create a database worlddb
CREATE DATABASE Worlddb;
#use Worlddb database
USE Worlddb;
#create a table Country
CREATE TABLE Country(
Id INT PRIMARY KEY,
Country_name VARCHAR(100),
Population INT,
Area FLOAT );
#create another table Persons
CREATE TABLE Persons(
Id INT PRIMARY KEY,
Fname VARCHAR(50),
Lname VARCHAR(50),
Population INT,
Rating FLOAT,
Country_Id INT,
Country_name VARCHAR(100));

INSERT INTO Country(Id,Country_name,Population,Area)
VALUES (1,'USA',331002000,9833520),
(2,'India',1393409038,3287263),
(3,'China',1444216107,9596961),
(4,'UK',68207114,242495),
(5,'Canada',37742154,9984670),
(6,'Australia',25687041,7692024),
(7,'Japan',125960000,377975),
(8,'Germany',83783942,357022),
(9,'France',67391582,551695),
(10,'Brazil',212559409,8515767);

INSERT INTO Persons(Id,Fname,Lname,Population,Rating,Country_Id,Country_name)
VALUES (1, 'John','Doe',500000,4.8,1,'USA'),
(2, 'Jane','Smith',1200000,4.2,2,'India'),
(3, 'Liu','Wei',1500000,4.5,3,'China'),
(4, 'David','Green',300000,3.8,4,'UK'),
(5, 'Ali','Khan',800000,4.7,2,'India'),
(6, 'Raj','Kumar',30000,3.6,2,'India' ),
(7, 'Olivia','Black',400000,4.9,1,'USA'),
(8, 'Chris','Gray',50000,4.4,5,'Canada' ),
(9, 'Liam','Yellow',900000,4.6,6,'Australia'),
(10, 'Emma','White',200000,4.1,1,'USA');
#1)Perform Inner Join,Left Join,Right Join
-- Inner Join
SELECT   p.Id,p.Fname,p.Lname,p.Country_Id,c.Area  FROM Country  c
INNER JOIN Persons  p ON c.Country_name = p.Country_name;

-- Left Join
SELECT  p.Id,p.Fname,p.Lname,p.Country_Id,c.Area FROM Country  c
LEFT JOIN Persons p ON c.Country_name = p.Country_name;

-- Right Join
SELECT  p.Id,p.Fname,p.Lname,p.Country_Id,c.Area FROM Country  c
RIGHT JOIN Persons  p ON c.Country_name =  p.Country_name;

#2)List all distinct country names from both Country and Persons tables
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

#3)List all Country names from both Country and Persons tables,including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

#4)Round the ratings of all persons to the nearet integer in Persons table
SELECT Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;

