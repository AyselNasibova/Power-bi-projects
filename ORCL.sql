-- Create the database
CREATE DATABASE IrshadTelecomDB;
USE IrshadTelecomDB;

-- 1. Stores Table
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    OpeningHours VARCHAR(50)
);

-- 2. Products Table
CREATE TABLE Products_PB (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL, -- e.g., Smartphone, Laptop, Accessory
    Brand VARCHAR(50) NOT NULL, -- e.g., Samsung, Apple, Xiaomi
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- 3. Customers Table
CREATE TABLE Customers_PB (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- 4. Employees Table
CREATE TABLE Employees_PB (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL, -- e.g., Sales Rep, Manager
    StoreID INT,
    HireDate DATE,
    Phone VARCHAR(20),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);


-- Recreate the Orders table with new columns
CREATE TABLE Orders_PB (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    StoreID INT,
    EmployeeID INT,              -- Column for employee relation
    OrderDate DATE NOT NULL,    -- Oracle uses DATE instead of DATETIME
    TotalAmount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR2(50), -- VARCHAR2 is Oracle's standard string type
    OrderType VARCHAR2(10) NOT NULL, -- Fixed: Added data type, assuming "Online" or "In-Store"
    FOREIGN KEY (CustomerID) REFERENCES Customers_PB(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees_PB(EmployeeID),
    CONSTRAINT chk_ordertype CHECK (OrderType IN ('Online', 'In-Store')) -- Optional: Restricts values
);

-- Recreate the Order_Items table (since it references Orders)
CREATE TABLE Order_Items_PB (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders_PB(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products_PB(ProductID)
);



INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (1, 'Irshad Baku Central', '42 28 May Str.', 'Baku', '+994 12 310 01 71', '09:00-21:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (2, 'Irshad Ganja Mall', '15 Ataturk Ave.', 'Ganja', '+994 22 256 78 90', '10:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (3, 'Irshad Sumqay?t', '20 Peace St.', 'Sumqay?t', '+994 18 642 13 14', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (4, 'Irshad Nakhchivan', '10 Heydar Aliyev Ave.', 'Nakhchivan', '+994 36 550 12 34', '10:00-19:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (5, 'Irshad Lankaran', '5 Hazi Aslanov St.', 'Lankaran', '+994 25 255 67 89', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (6, 'Irshad Shirvan', '12 Khagani St.', 'Shirvan', '+994 21 215 43 21', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (7, 'Irshad Mingachevir', '8 Samad Vurgun St.', 'Mingachevir', '+994 24 275 32 10', '10:00-19:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (8, 'Irshad Sheki', '15 M.F. Akhundov St.', 'Sheki', '+994 24 244 56 78', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (9, 'Irshad Quba', '10 Fatali Khan St.', 'Quba', '+994 23 335 67 89', '10:00-19:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (10, 'Irshad Sabirabad', '7 Mirza Alakbar St.', 'Sabirabad', '+994 21 255 12 34', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (11, 'Irshad Baku Narimanov', '25 Tabriz St.', 'Baku', '+994 12 310 02 22', '09:00-21:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (12, 'Irshad Ganja West', '30 Nizami St.', 'Ganja', '+994 22 256 79 00', '10:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (13, 'Irshad Sumqay?t North', '45 Koroglu St.', 'Sumqay?t', '+994 18 642 14 15', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (14, 'Irshad Baku Yasamal', '18 Huseyn Javid Ave.', 'Baku', '+994 12 310 03 33', '09:00-21:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (15, 'Irshad Goychay', '9 Rasul Rza St.', 'Goychay', '+994 20 274 56 78', '10:00-19:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (16, 'Irshad Barda', '12 Uzeyir Hajibeyli St.', 'Barda', '+994 20 205 43 21', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (17, 'Irshad Salyan', '6 Heydar Aliyev St.', 'Salyan', '+994 21 255 67 89', '09:00-20:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (18, 'Irshad Baku Binagadi', '40 Azadlig Ave.', 'Baku', '+994 12 310 04 44', '09:00-21:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (19, 'Irshad Zagatala', '15 Fuzuli St.', 'Zagatala', '+994 24 225 12 34', '10:00-19:00');

INSERT INTO Stores (StoreID, StoreName, Address, City, Phone, OpeningHours) 
VALUES (20, 'Irshad Imishli', '8 Nariman Narimanov St.', 'Imishli', '+994 21 275 32 10', '09:00-20:00');

select *from Stores
