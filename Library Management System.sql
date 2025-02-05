-- Library Management System

-- Create database library
CREATE DATABASE library;

-- Use the database library
USE library;

-- Create Branch Table
CREATE TABLE Branch (
    Branch_no VARCHAR(10) PRIMARY KEY,
    Manager_id VARCHAR(10),
    Branch_address VARCHAR(50),
    Contact_no VARCHAR(15)
);

-- Create Employee Table
CREATE TABLE Employee (
    Emp_id VARCHAR(10) PRIMARY KEY,
    Emp_name VARCHAR(30),
    Position VARCHAR(30),
    Salary DECIMAL(10,2),
    Branch_no VARCHAR(10),
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no) ON DELETE SET NULL
);

-- Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(25) PRIMARY KEY,
    Book_title VARCHAR(80),
    Category VARCHAR(30),
    Rental_Price DECIMAL(10,2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id VARCHAR(10) PRIMARY KEY,
    Customer_name VARCHAR(30),
    Customer_address VARCHAR(50),
    Reg_date DATE
);

-- Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id VARCHAR(10) PRIMARY KEY,
    Issued_cust VARCHAR(10),
    Issued_book_name VARCHAR(80),
    Issue_date DATE,
    Isbn_book VARCHAR(25),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN) ON DELETE CASCADE
);

-- Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_id VARCHAR(10) PRIMARY KEY,
    Return_cust VARCHAR(10),
    Return_book_name VARCHAR(80),
    Return_date DATE,
    Isbn_book2 VARCHAR(25),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);

-- Insert values into Branch Table
INSERT INTO Branch VALUES
('B001', 'M101', '123 Main St', '+919099988671'),
('B002', 'M102', '456 Park Ave', '+919099988672'),
('B003', 'M103', '789 Broadway', '+919099988673'),
('B004', 'M104', '1012 High St', '+919099988674'),
('B005', 'M105', '987 Willow St', '+919099988675'),
('B006', 'M106', '654 Cedar St', '+919099988676'),
('B007', 'M107', '321 Birch St', '+919099988677'),
('B008', 'M108', '789 Redwood St', '+919099988678'),
('B009', 'M109', '159 Aspen St', '+919099988679'),
('B010', 'M110', '951 Oakwood St', '+919099988680');

SELECT * FROM Branch;

-- Insert values into Employee Table
INSERT INTO Employee VALUES
('E201', 'Alice Green', 'Manager', 70000.00, 'B001'),
('E202', 'Bob White', 'Clerk', 48000.00, 'B002'),
('E203', 'Charlie Black', 'Librarian', 52000.00, 'B003'),
('E204', 'David Brown', 'Assistant', 43000.00, 'B004'),
('E205', 'Emily Adams', 'Manager', 71000.00, 'B005'),
('E206', 'Sarah Miller', 'Assistant', 42000.00, 'B001'),
('E207', 'Michael Clark', 'Clerk', 46000.00, 'B001'),
('E208', 'Sophia Wilson', 'Manager', 75000.00, 'B002'),
('E209', 'Daniel Taylor', 'Librarian', 53000.00, 'B002'),
('E210', 'Olivia Anderson', 'Assistant', 41000.00, 'B002');

SELECT * FROM Employee;

-- Insert values into Books Table
INSERT INTO Books VALUES
('978-0-307-26543-1', 'Inferno', 'Mystery', 25.50, 'Yes', 'Dan Brown', 'Doubleday'),
('978-1-250-30245-0', 'The Silent Patient', 'Thriller', 17.00, 'Yes', 'Alex Michaelides', 'Celadon Books'),
('978-1-56619-909-4', 'The Catcher in the Rye', 'Classic', 27.00, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-14-028333-4', 'Animal Farm', 'Classic', 15.50, 'Yes', 'George Orwell', 'Penguin Books'),
('978-0-452-28423-4', '1984', 'Dystopian',16.00, 'No', 'George Orwell', 'Signet Classics'),
('978-0-7432-7356-5', 'The Da Vinci Code', 'Mystery', 28.00, 'Yes', 'Dan Brown', 'Doubleday'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 26.50, 'Yes', 'Harper Lee', 'Harper Perennial'),
('978-1-4165-9088-5', 'Angels & Demons', 'Mystery', 24.00, 'Yes', 'Dan Brown', 'Pocket Books'),
('978-0-525-65850-3', 'The Night Watchman', 'Historical', 20.00, 'Yes', 'Louise Erdrich', 'Harper'),
('978-0-399-58861-2', 'The Midnight Library', 'Fiction', 19.50, 'Yes', 'Matt Haig', 'Viking');

SELECT * FROM Books;

-- Insert values into Customer Table
INSERT INTO Customer VALUES
('C101', 'John Doe', 'Avenue Road, NY', '2022-04-10'),
('C102', 'Jane Smith', 'King St, Toronto', '2022-06-15'),
('C103', 'Jim Raynor', 'Palm Road, LA', '2022-08-20'),
('C104', 'Sarah Connor', 'Skyline Ave, SF', '2022-10-05'),
('C105', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C106', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C107', 'Charlie Wilson', '789 Oak St', '2021-07-10'),
('C108', 'David Lee', '321 Maple St', '2021-08-05'),
('C109', 'Eva Green', '567 Pine St', '2021-09-15'),
('C110', 'Ryan Adams', '777 Ocean St', '2021-10-10'),
('C111', 'Lily Thomas', '999 Maple St', '2021-04-12'),
('C112', 'Tom Holland', '888 Elm St', '2021-11-05');

SELECT * FROM Customer;
 
-- Insert values into IssueStatus Table
INSERT INTO IssueStatus VALUES
('IS101', 'C101', 'The Catcher in the Rye', '2023-05-01', '978-1-56619-909-4'),
('IS102', 'C102', 'Inferno', '2023-05-02', '978-0-307-26543-1'),
('IS103', 'C103', 'The Silent Patient', '2023-06-15', '978-1-250-30245-0'),
('IS104', 'C104', 'The Da Vinci Code', '2023-07-10', '978-0-7432-7356-5'),
('IS105', 'C105', '1984', '2023-07-25', '978-0-452-28423-4'),
('IS106', 'C106', 'Animal Farm', '2023-08-05', '978-0-14-028333-4'),
('IS107', 'C107', 'To Kill a Mockingbird', '2023-08-15', '978-0-06-112008-4'),
('IS108', 'C108', 'Angels & Demons', '2023-09-05', '978-1-4165-9088-5'),
('IS109', 'C109', 'The Night Watchman', '2023-09-20', '978-0-525-65850-3'),
('IS110', 'C110', 'The Midnight Library', '2023-10-10', '978-0-399-58861-2');

SELECT *FROM IssueStatus;

-- Insert values into ReturnStatus Table
INSERT INTO ReturnStatus VALUES
('RS101', 'C101', 'The Catcher in the Rye', '2023-06-06', '978-1-56619-909-4'),
('RS102', 'C102', 'Inferno', '2023-06-10', '978-0-307-26543-1'),
('RS103', 'C103', 'The Silent Patient', '2023-07-20', '978-1-250-30245-0'),
('RS104', 'C104', 'The Da Vinci Code', '2023-08-12', '978-0-7432-7356-5'),
('RS105', 'C105', '1984', '2023-08-25', '978-0-452-28423-4'),
('RS106', 'C106', 'Animal Farm', '2023-09-10', '978-0-14-028333-4'),
('RS107', 'C107', 'To Kill a Mockingbird', '2023-09-25', '978-0-06-112008-4'),
('RS108', 'C108', 'Angels & Demons', '2023-10-05', '978-1-4165-9088-5'),
('RS109', 'C109', 'The Night Watchman', '2023-10-20', '978-0-525-65850-3'),
('RS110', 'C110', 'The Midnight Library', '2023-11-01', '978-0-399-58861-2');

SELECT *FROM ReturnStatus;

# Queries

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT IssueStatus.Issued_book_name, Customer.Customer_name FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

# 4. Display the total count of books in each category.
SELECT Category, COUNT(Book_title) FROM Books GROUP BY Category;

# 5. Retrieve the employee names and their positions for employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

# 6. List the customer names who registered before '2022-06-01' and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-06-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_id) FROM Employee GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in July 2023.
SELECT Customer.Customer_name FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE IssueStatus.Issue_date BETWEEN '2023-07-01' AND '2023-07-31';

# 9. Retrieve book titles from the Books table containing 'Mystery'.
SELECT Book_title FROM Books WHERE Category = 'Mystery';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 2 employees.
SELECT Branch_no, COUNT(Emp_id) FROM Employee GROUP BY Branch_no HAVING COUNT(Emp_id) > 2;

#  11: Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address  FROM Employee E
JOIN Branch B ON E.Branch_no = B.Branch_no 
WHERE E.Position = 'Manager';

# 12: Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT C.Customer_name  FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
JOIN Books B ON I.Isbn_book = B.ISBN 
WHERE B.Rental_Price > 25;


