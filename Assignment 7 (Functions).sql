#create a database worldindb
CREATE DATABASE Worldindb;
#use Worlddb database
USE Worldindb;
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

#1. Add a new column called DOB in the Persons table with the data type DATE:
ALTER TABLE Persons
ADD DOB DATE;
SELECT*FROM Persons;
-- insert values of DOB column for Persons table
UPDATE Persons
SET DOB = CASE
WHEN Id=1 THEN '1990-01-02'
WHEN Id=2 THEN '1985-03-15'
WHEN Id=3 THEN '1992-07-25'
WHEN Id=4 THEN '1995-09-12'
WHEN Id=5 THEN '2000-02-20'
WHEN Id=6 THEN '2001-03-18'
WHEN Id=7 THEN '1989-04-11'
WHEN Id=8 THEN '1994-11-29'
WHEN Id=9 THEN '1989-10-02'
WHEN Id=10 THEN '1983-12-01'
END
WHERE Id IN (1,2,3,4,5,6,7,8,9,10);

#2. Write a user-defined function to calculate age using DOB:
delimiter //
CREATE FUNCTION Calculate_Age(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
RETURN Age;
END //
delimiter ;
SELECT * FROM Persons;

#3. Write a select query to fetch the Age of all persons using the function created:
SELECT Fname, Lname, DOB, Calculate_Age(DOB) AS Age
FROM Persons;

#4. Find the length of each country name in the Country table:
SELECT Country_name, LENGTH(Country_name) AS Country_Name_Length
FROM Country;

#5. Extract the first three characters of each country's name in the Country table:
SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS First_Three_Chars
FROM Country;

#6. Convert all country names to uppercase and lowercase in the Country table:
-- To convert to uppercase and Lowercase
SELECT Country_name, UPPER(Country_name) AS Uppercase_Country_Name,
 LOWER(Country_name) AS Lowercase_Country_Name
FROM Country;



