 
Irsad Telecom Sales Dashboard - Power BI Project
Project Description:
This project uses a database to model and analyze data related to telecommunications product sales. In the Power BI project, various data visualizations are used to present insights on orders, products, customers, employees, and sales.

Project Goals:
Database modeling for testing business data.

Using Power BI to visualize data and create dashboards.

Sales, returns, order, customer, and product analysis.

Database Structure:
Tables:
Stores: Data on stores (StoreID, StoreName, Address, Phone, etc.).

Products_PB: Data on products (ProductID, ProductName, Category, Brand, Price, StockQuantity, etc.).

Customers_PB: Information about customers (CustomerID, FirstName, LastName, Phone, Email, etc.).

Employees_PB: Data on employees (EmployeeID, FirstName, LastName, Position, StoreID, etc.).

Orders_PB: Data on orders (OrderID, CustomerID, StoreID, EmployeeID, OrderDate, TotalAmount, PaymentMethod, OrderType).

Procedures:
PopulateOrdersAndItems: Populates the Orders and Items tables with random data.

PopulateCustomers: Populates the Customers table with random customer data (names, addresses, phones, etc.).

Triggers and Sequences:
Customers_Seq: A sequence for automatically generating unique CustomerID values.

Customers_Trigger: A trigger for generating CustomerID values when inserting into the Customers_PB table.

Note: Data is randomly generated using DBMS_RANDOM functions to simulate real-world business scenarios.

Power BI Visualizations:
Dashboards:
Total Revenue: A visualization of total revenue across all orders, with filters for order type, date, and store.

Sales by Category: An analysis of sales by product category with sorting options for brands and prices.

Customers and Their Activity: A visualization showing orders by customers, including purchase frequency and total order amounts.

Returns: Data on product returns, including the number of returns per product.

Employee Performance: An analysis of employee performance by the number of orders processed and total profit.

Types of Visuals:
Bar Chart: For showing sales by category.

Line Chart: To analyze sales and order trends over time.

Pie Chart: For splitting data by payment method and order type (online or in-store).

Matrix: For displaying detailed order and product data.

Table: For displaying detailed customer and order data.

Measures and Expressions (DAX):
Total Revenue: Calculates the total revenue based on the quantity of products sold and their prices.

Average Price: Calculates the average price across products.

Total Orders: Computes the total number of orders over a specific period.

Adjusted Revenue: Computes the adjusted revenue based on price changes.

High Ticket Orders: Identifies orders with prices higher than the average across all products.

How to Use:
Set up the database using the provided SQL scripts to create the necessary tables.

Import the data into Power BI and link the tables for analysis.

Use the DAX measures to perform calculations and generate insights.

Use the visualizations to create interactive dashboards and reports.

Filter and analyze sales data based on various factors like order type, product category, and employee performance.









