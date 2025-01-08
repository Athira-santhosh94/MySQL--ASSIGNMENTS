#Create a database called "Sales"
CREATE DATABASE Sales;
#Use the sales database
USE Sales;
#Create a table "Orders" with constraints
CREATE TABLE Orders(
Order_Id INT PRIMARY KEY,
Customer_name VARCHAR(55) NOT NULL,
Product_Category VARCHAR(55) NOT NULL,
Ordered_item VARCHAR(55) UNIQUE NOT NULL,
Contact_No VARCHAR(15));
#Add a new column named "Order_quantity" to the Orders table 
ALTER TABLE Orders ADD COLUMN Order_quantity INT;
#Rename the "Orders" table to "Sales_Orders"
RENAME TABLE Orders TO Sales_Orders;
#Insert 10 rows into the Sales_Orders table
INSERT INTO Sales_Orders(Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, Order_quantity)
VALUES (1,'Alice Tommy','Electronics','Laptop','9111111111',3),
(2,'Bob Book','Home Appliances','Mixer','9222222222',2),
(3,'Charlie Don','Clothing','T-Shirt','9333333333',5),
(4,'Daniel Tim','Books','Novel','9444444444',1),
(5,'Emily Johnson','Toys','Puzzle','9555555555',3),
(6,'Francis Taylor','Footwear','Sneakers','9666666666',4),
(7,'Gaga Martin','Furniture','StudyTable','9777777777',1),
(8,'Harry Potter','Electronics','Smart Watch','9888888888',2),
(9,'Imran khan','Sports','Cricket Bat','9999999999',5),
(10,'Jackie shroff','Stationary','Notebook','1234567890',8);
SELECT * FROM Sales_Orders;
#Retrieve Customer_name and Ordered_item from the Sales_Orders table
SELECT Customer_name,Ordered_item FROM Sales_Orders;
#Update a row to change the name of the product
UPDATE Sales_Orders SET Ordered_Item='Gaming Laptop' WHERE Order_Id=1;
SELECT * FROM Sales_Orders;
#Delete the Sales_Orders table from database
DROP TABLE Sales_Orders;
