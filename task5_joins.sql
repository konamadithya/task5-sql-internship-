
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    ContactName TEXT,
    Country TEXT
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Data into Customers
INSERT INTO Customers VALUES
(1, 'Adithya Konam', 'Adithya', 'India'),
(2, 'Ravi Kumar', 'Ravi', 'USA'),
(3, 'John Doe', 'John', 'UK');

-- Insert Data into Orders
INSERT INTO Orders VALUES
(101, 1, '2024-06-01'),
(102, 2, '2024-06-02'),
(103, 1, '2024-06-03');

-- INNER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN (Not supported in SQLite, workaround using LEFT JOIN with reversed tables)
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN (Not directly supported in SQLite, simulate using UNION)
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.OrderID
FROM Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

-- CROSS JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

-- NATURAL JOIN (only if common columns exist)
-- CREATE two tables with a common column name for natural join demo if needed

-- SELF JOIN
SELECT A.CustomerName AS CustomerA, B.CustomerName AS CustomerB
FROM Customers A, Customers B
WHERE A.Country = B.Country AND A.CustomerID != B.CustomerID;
