#Create a database "School"
CREATE DATABASE School;
#Use the school database
USE School;
#Create a table named "STUDENT" with fields Roll_No,Name,Mark,Grade
CREATE TABLE STUDENT (
Roll_No INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Marks INT NOT NULL,
Grade CHAR(1));
#insert some data into STUDENT table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES(1, 'Lal', '90', 'A'),
(2, 'Kamal', '70', 'B'),
(3, 'Arjun', '93', 'A');
#select command to dispaly the table
SELECT * FROM STUDENT;
#Add a column named "Contact" to the STUDENT table
ALTER TABLE STUDENT ADD COLUMN Contact VARCHAR(15);
#Remove the"Grade" column from the STUDENT table
ALTER TABLE STUDENT DROP COLUMN Grade;
#Rename the STUDENT table to "CLASSTEN"
RENAME TABLE STUDENT TO CLASSTEN;
#Delete all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;
#Delete the table CLASSTEN from the database 
DROP TABLE CLASSTEN;
