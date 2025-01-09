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
(6, 'Raj','Kumar',700000,3.6,2,'India' ),
(7, 'Olivia','Black',400000,4.9,1,'USA'),
(8, 'Chris','Gray',500000,4.4,5,'Canada' ),
(9, 'Liam','Yellow',900000,4.6,6,'Australia'),
(10, 'Emma','White',200000,4.1,1,'USA');

#Query 1:List the distinct country names from the persons table
SELECT DISTINCT Country_name FROM Persons;

#Query 2:Select first and last names from the persons table with aliases
SELECT Fname AS FirstName,Lname AS LastName FROM Persons;

#Query 3:Find all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;
 
 #Query 4:Find countries with a population greater than 10 lakhs
 SELECT * FROM  Country WHERE Population > 1000000;
 
 #Query 5:Find persons who are from 'USA' or have a rating greater than 4.5
 SELECT * FROM Persons WHERE Country_name='USA' OR Rating > 4.5;
 
 #Query 6:Find all persons whhere the countrybname is NULL
 SELECT * FROM Persons WHERE Country_name is NULL;
 
 #Query 7:Find all persons from the countries 'USA','Canada' and'UK'
 SELECT * FROM Persons WHERE Country_name IN ('USA','Canada','UK');
 
 #Query 8:Find all persons not from the countries 'India' and 'Australia'
 SELECT * FROM Persons WHERE Country_name NOT IN ('India','Australia');
 
 #Query 9:Find all countries with a population between 5 lakhs and 20 lakhs
 SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;
 
 #Query 10:Find all countries whose names do not start with 'C'
 SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
 