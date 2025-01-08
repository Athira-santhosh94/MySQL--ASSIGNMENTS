#Create a database companydb
CREATE DATABASE Companydb;
#Use the Companydb database
USE Companydb;
#Create a table "Orders" with constraints
CREATE TABLE Managers(
Manager_Id INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
DOB DATE,
Age INT CHECK (Age>18),
Last_Update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
Gender char(10) check(Gender in ('Male','Female','Others')),
Department VARCHAR(50),
Salary DECIMAL(10,2) NOT NULL);
INSERT INTO Managers (Manager_Id,First_Name,Last_Name,DOB,Age,Gender,Department,Salary)
VALUES (1, 'John','Doe','1987-04-12',37,'Male','IT',45000),
(2, 'Jane','Smith','1980-06-09',43,'Female','Sales',50000),
(3, 'Aaliya','Brown','1990-08-24',33,'Female','HR',53000),
(4, 'David','Green','1982-11-17',42,'Male','Finance',60000),
(5, 'Tom','White','1993-03-15',31,'Female','Sales',30000),
(6, 'Emma','Blue','1985-12-30',39,'Female','IT',56000 ),
(7, 'Olivia','Black','1992-02-14',32,'Female','Finance',60000),
(8, 'Neha','Gray','1988-11-20',36,'Female','HR',83000 ),
(9, 'Liam','Yellow','1978-06-05',45,'Male','Sales',54000),
(10, 'Sophia','Purple','1997-06-18',27,'Female','IT',24000);

#Query 1:Retrieve Name and DOB of Manager_Id=1
SELECT First_Name,Last_Name,DOB FROM Managers
WHERE Manager_Id=1;

#Query 2:Display Annual income of all Managers
SELECT Manager_Id,First_Name,Last_Name,Salary*12 AS Annual_Income FROM Managers;

#Query 3:Display Records of all managers except Aaliya
SELECT * FROM Managers
WHERE First_Name !='Aaliya';

#Query 4:Display details of IT Managers earning more than 250000
SELECT * FROM Managers
WHERE Department='IT' AND Salary > 25000;

#Query 5:Display details of managers with salary between 10000 and 35000
SELECT * FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;
