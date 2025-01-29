-- Creating a database
CREATE DATABASE Productdb;

-- Use the database
USE Productdb;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100) NOT NULL,
    Population INT,
    Area INT
);
    
-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Country (Id, Country_name, Population, Area)
 VALUES
(1, 'India', 1393409038, 3287263),
(2, 'USA', 331449281, 9833520),
(3, 'UK', 68207114, 243610),
(4, 'Canada', 38005238, 9984670),
(5, 'Australia', 25687041, 7692024),
(6, 'China', 1444216107, 9596961),
(7, 'Japan', 125836021, 377975),
(8, 'Germany', 83240525, 357022),
(9, 'Russia', 145912025, 17098242),
(10, 'France', 67391582, 551695);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
 VALUES
(1, 'John','Doe',500000,4.8,2,'USA'),
(2, 'Jane','Smith',1200000,4.2,4,'Canada'),
(3, 'Liu','Wei',1500000,4.5,6,'China'),
(4, 'David','Green',300000,3.8,3,'UK'),
(5, 'Alina','Krawn',800000,4.7,9,'Russia'),
(6, 'Raj','Kumar',700000,3.6,1,'India' ),
(7, 'Olivia','Black',400000,4.8,10,'France'),
(8, 'Chris','Gray',500000,4.4,2,'USA' ),
(9, 'Liam','Yellow',900000,4.6,5,'Australia'),
(10, 'Emma','White',200000,2.9,7,'Japan');

-- 1. Find the number of persons in each country
SELECT c.Country_name, COUNT(p.Id) AS person_count
FROM Country c
LEFT JOIN Persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name;

-- 2. Find the number of persons in each country sorted from high to low
SELECT c.Country_name, COUNT(p.Id) AS person_count
FROM Country c
LEFT JOIN Persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name
ORDER BY person_count DESC;

-- 3. Find the average rating for persons in each country if the average is greater than 3.0
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

-- 4. Find the countries with the same average rating as the USA (Using Subqueries)
SELECT Country_name FROM Country 
WHERE Id IN (
    SELECT Country_Id FROM Persons 
    GROUP BY Country_Id
    HAVING AVG(Rating) = (SELECT AVG(Rating) FROM Persons WHERE Country_Id = 2));

-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_name FROM Country 
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Creating Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(100) NOT NULL,
    Last_name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone_no VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(10),
    Country VARCHAR(100)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2345678910', '456 Oak St', 'San Francisco', 'California', '94101', 'USA'),
(3, 'Emily', 'Brown', 'emily.brown@example.com', '3456789012', '789 Pine St', 'San Diego', 'California', '92101', 'USA'),
(4, 'Michael', 'Johnson', 'michael.johnson@example.com', '4567890123', '321 Maple St', 'Sacramento', 'California', '94203', 'USA'),
(5, 'Sophia', 'Taylor', 'sophia.taylor@example.com', '5678901234', '654 Cedar St', 'Fresno', 'California', '93721', 'USA'),
(6, 'Olivia', 'Miller', 'olivia.miller@example.com', '6789012345', '987 Birch St', 'Austin', 'Texas', '73301', 'USA'),
(7, 'Emma', 'Wilson', 'emma.wilson@example.com', '7890123456', '123 Fir St', 'Dallas', 'Texas', '75201', 'USA'),
(8, 'Noah', 'Martinez', 'noah.martinez@example.com', '8901234567', '456 Willow St', 'New York City', 'New York', '10001', 'USA'),
(9, 'Liam', 'Davis', 'liam.davis@example.com', '9012345678', '789 Spruce St', 'Houston', 'Texas', '77001', 'USA'),
(10, 'Isabella', 'Garcia', 'isabella.garcia@example.com', '1239874560', '321 Redwood St', 'Dallas', 'Texas', '75202', 'USA');

-- 1. Creating a View: customer_info (Displays Full name and email address)
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email FROM Customer;
SELECT * FROM customer_info;

-- 2. Creating a View: US_Customers (Displays Customers located in the USA)
CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';

-- 3. Creating a View: Customer_details (Full name, Email, Phone_no, and State)
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State FROM Customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer 
SET Phone_no = '9999999999' 
WHERE State = 'California';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Customer_details WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(Customer_Id) AS num_customers 
FROM Customer
GROUP BY State
HAVING num_customers > 5;

-- 6. Query that returns the number of customers in each state using "customer_details" view
SELECT State, COUNT(Full_Name) AS num_customers FROM Customer_details GROUP BY State;

-- 7. Query that returns all columns from "customer_details" sorted by "State" ascending
SELECT * FROM Customer_details ORDER BY State ASC;
