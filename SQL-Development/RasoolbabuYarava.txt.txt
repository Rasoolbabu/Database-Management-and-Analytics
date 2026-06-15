create database Business;
use Business;
CREATE TABLE SalesPersons (
    SalesPersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
INSERT INTO SalesPersons (SalesPersonID, FirstName, LastName)
VALUES 
    (1, 'Aarav', 'Patel'),
    (2, 'Aisha', 'Kumar'),
    (3, 'Amit', 'Shah'),
    (4, 'Ananya', 'Gupta'),
    (5, 'Arjun', 'Singh'),
    (6, 'Divya', 'Sharma'),
    (7, 'Ishaan', 'Joshi'),
    (8, 'Kriti', 'Verma'),
    (9, 'Mohit', 'Chopra'),
    (10, 'Neha', 'Yadav');
    CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerState VARCHAR(50),
    SalesPersonID INT,
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPersons(SalesPersonID)
);
INSERT INTO Customers (CustomerID, CustomerName, CustomerState, SalesPersonID)
VALUES
    (1, 'ABC Company', 'California', 1),
    (2, 'XYZ Corporation', 'New York', 2),
    (3, '123 Industries', 'Texas', 3),
    (4, 'Sunrise Enterprises', 'Maharashtra', 4),
    (5, 'Moonlight Technologies', 'Karnataka', 5),
    (6, 'Starry Solutions', 'Tamil Nadu', 6),
    (7, 'Oceanic Innovations', 'Kerala', 7),
    (8, 'Golden Harvest', 'West Bengal', 8),
    (9, 'Green Fields', 'Punjab', 9),
    (10, 'Silver Spark', 'Rajasthan', 10);
    CREATE TABLE Orders (
    OrderNumber INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders (OrderNumber, CustomerID, OrderDate)
VALUES
    (1, 1, '2024-01-15'),
    (2, 2, '2024-02-20'),
    (3, 3, '2024-03-25'),
    (4, 4, '2024-04-01'),
    (5, 5, '2024-05-10'),
    (6, 6, '2024-06-15'),
    (7, 7, '2024-07-20'),
    (8, 8, '2024-08-25'),
    (9, 9, '2024-09-01'),
    (10, 10, '2024-10-05');
    CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderNumber INT,
    Item VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber)
);
INSERT INTO OrderDetails (OrderDetailID, OrderNumber, Item, Quantity, Price)
VALUES
    (1, 1, 'Product A', 2, 50.00),
    (2, 1, 'Product B', 1, 75.00),
    (3, 2, 'Product C', 1, 100.00),
    (4, 3, 'Product D', 3, 30.00),
    (5, 3, 'Product E', 2, 20.00),
    (6, 4, 'Product F', 1, 45.00),
    (7, 5, 'Product G', 2, 60.00),
    (8, 6, 'Product H', 1, 80.00),
    (9, 7, 'Product I', 1, 25.00),
    (10, 8, 'Product J', 2, 35.00);
CREATE VIEW CustomerList AS
SELECT CustomerID, CustomerName, CustomerState, SalesPersonID
FROM Customers;
select * from CustomerList;
CREATE VIEW MostExpensiveItemPerCustomer AS
SELECT o.CustomerID, c.CustomerName, MAX(od.Price) AS MostExpensiveItemPrice
FROM Orders o
JOIN OrderDetails od ON o.OrderNumber = od.OrderNumber
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID, c.CustomerName;
select * from MostExpensiveItemPerCustomer;
CREATE VIEW MostExpensiveItemPerSalesPerson AS
SELECT c.SalesPersonID, s.FirstName, s.LastName, MAX(od.Price) AS MostExpensiveItemPrice
FROM Customers c
JOIN SalesPersons s ON c.SalesPersonID = s.SalesPersonID
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderNumber = od.OrderNumber
GROUP BY c.SalesPersonID, s.FirstName, s.LastName;
select * from MostExpensiveItemPerSalesPerson;
CREATE VIEW TotalItemPerCustomer AS
SELECT c.CustomerID, c.CustomerName, od.Item, SUM(od.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderNumber = od.OrderNumber
GROUP BY c.CustomerID, c.CustomerName, od.Item;
Select * from TotalItemPerCustomer;
DELIMITER $$
CREATE PROCEDURE InsertSalesPerson(
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50)
)
BEGIN
    INSERT INTO SalesPersons (FirstName, LastName)
    VALUES (FirstName, LastName);
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE ConvertPriceToEuro()
BEGIN
    UPDATE OrderDetails
    SET Price = Price * 0.82; -- Assuming 1 USD = 0.82 Euros
END$$
DELIMITER ;