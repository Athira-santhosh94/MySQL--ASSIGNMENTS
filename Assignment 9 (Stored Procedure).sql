-- Create database Companydb
CREATE DATABASE Companydb;

#Use database  Companydb
USE Companydb;

-- Creating Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'John', 'Doe', 50000, '2023-01-15', 'HR'),
(2, 'Jane', 'Smith', 60000, '2022-05-18', 'Finance'),
(3, 'Mike', 'Johnson', 55000, '2021-09-22', 'IT'),
(4, 'Emily', 'Davis', 65000, '2020-11-30', 'Marketing'),
(5, 'Chris', 'Brown', 48000, '2019-07-25', 'HR'),
(6, 'Alice', 'Williams', 70000, '2024-02-01', 'IT'),
(7, 'Robert', 'Miller', 62000, '2018-06-19', 'Finance'),
(8, 'Laura', 'Wilson', 53000, '2017-03-12', 'IT'),
(9, 'David', 'Anderson', 58000, '2022-09-05', 'Marketing'),
(10, 'Sophia', 'Moore', 49000, '2021-12-21', 'HR');

-- 1. Stored Procedure to Insert a Worker Record
DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

-- Procedure Call
CALL AddWorker(11, 'Olivia', 'Taylor', 75000, '2023-05-18', 'Finance');

SELECT * FROM Worker;

-- 2. Stored Procedure to Retrieve Salary Based on Worker_Id
DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

-- Procedure Call
CALL GetWorkerSalary(1, @salary);
SELECT @salary;

-- 3. Stored Procedure to Update Department Based on Worker_Id
DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

-- Procedure Call
CALL UpdateWorkerDepartment(1, 'Finance');

SELECT * FROM Worker WHERE Worker_Id = 1;

-- 4. Stored Procedure to Get Worker Count in a Department
DELIMITER //
CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END //
DELIMITER ;

-- Procedure Call
CALL GetWorkerCount('Finance', @workerCount);
SELECT @workerCount;

-- 5. Stored Procedure to Get Average Salary in a Department
DELIMITER //
CREATE PROCEDURE GetAverageSalary(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END //
DELIMITER ;

-- Procedure Call
CALL GetAverageSalary('Finance', @avgSalary);
SELECT @avgSalary;
