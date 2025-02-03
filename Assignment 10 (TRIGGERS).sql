-- Create database Teacherdb
CREATE DATABASE Teacherdb;

-- Use database Teacherdb
USE Teacherdb;

-- 1) Create teachers table
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert data into teachers table
INSERT INTO teachers (name, subject, experience, salary)
VALUES
('John Doe', 'Mathematics', 12, 55000.00),
('Jane Smith', 'Physics', 8, 45000.00),
('Emily Davis', 'Chemistry', 5, 40000.00),
('Michael Brown', 'Biology', 10, 60000.00),
('Sarah Wilson', 'English', 3, 35000.56),
('David Johnson', 'History', 6, 42000.00),
('Emma Garcia', 'Geography', 2, 36000.00),
('Chris Lee', 'Computer Science', 15, 70000.00);

-- Drop teacher_log table if it exists
DROP TABLE IF EXISTS teacher_log;

-- Create teacher_log table
CREATE TABLE teacher_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,  
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2) Create before insert trigger to prevent negative salary
DELIMITER //
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
//
DELIMITER ;

-- 3) Create after insert trigger to log insertions
DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;
//
DELIMITER ;

-- 4) Create before delete trigger to prevent deletion of experienced teachers
DELIMITER //
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END;
//
DELIMITER ;

-- 5) Create after delete trigger to log deletions
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
//
DELIMITER ;

-- Test Cases

-- a) Try inserting a teacher with negative salary (This will fail)
INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Test Teacher', 'Math', 5, -1000.00);

-- b) Insert a new teacher 
INSERT INTO teachers (name, subject, experience, salary) 
VALUES ('Mark White', 'Philosophy', 4, 50000.00);
SELECT * FROM teachers;

-- c) Check the teacher_log table for the log entry
SELECT * FROM teacher_log;

-- d) Attempt to delete a teacher with more than 10 years of experience (This will fail)
DELETE FROM teachers WHERE id = 8; -- Chris Lee (15 years experience)

-- e) Delete a teacher with less than 10 years experience 
DELETE FROM teachers WHERE id = 2; -- Jane Smith (8 years experience)

-- f) Check the teacher_log table for the log entry
SELECT * FROM teacher_log;
