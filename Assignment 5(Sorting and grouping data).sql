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

#1)Print first three characters of Country_name from Country table
SELECT LEFT(Country_name,3) AS ShortName FROM Country;

#2)Concatenate Fname and Lname from the Persons table
SELECT CONCAT(Fname,' ',Lname) AS FullName FROM Persons;

#3)Count the number of unique country names from the persons table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons;

#4)Print the maximum population from the Country table
SELECT MAX(Population) AS MaxPopulation FROM Country;

#5)Print the maximum population from the Persons table
SELECT MIN(Population) AS MinPopulation FROM Persons;

#6)Insert two rows into persons with Lname as NULL
INSERT INTO Persons(Id,Fname,Lname,Population,Rating,Country_Id,Country_name)
VALUES (11,'Alice',NULL,25000,4.5,1,'USA'),
(12,'Lakshman',NULL,200000,4.8,2,'India');
SELECT COUNT(*) AS NullLastNames FROM Persons WHERE Lname IS NULL;

#7)Find the number of rows in the persons table
SELECT COUNT(*) AS TotalRows FROM Persons;

#8)Show the population of the country table for the first three rows
SELECT Population FROM Country LIMIT 3;

#9)Print three random rows from the country table
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

#10)List all persons ordered by their Rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

#11)Find the total population for each country in the persons table
SELECT Country_name,SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name;

#12)Find countries with a total population greater than 50,000
SELECT Country_name FROM Persons GROUP BY Country_name HAVING SUM(Population)>50000;

#13)List the total number of persons and average rating for countries with more than two persons,ordered by the average rating in ascending order
SELECT Country_name,COUNT(*) AS TotalPersons,AVG(Rating) AS AvgRating FROM Persons
GROUP BY Country_name HAVING COUNT(*)>2 ORDER BY AvgRating ASC;
