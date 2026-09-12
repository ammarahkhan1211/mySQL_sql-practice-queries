
# SQL Data Analysis & Practice Project

## 📌 Project Overview

This project is a comprehensive SQL practice and data analysis project created using **MySQL**.

The project covers SQL concepts from beginner to intermediate level, starting with database and table creation and progressing to data filtering, aggregation, joins, date manipulation, stored procedures, CTEs, views, and window/ranking functions.

A major part of the project focuses on analyzing a **sales dataset** to answer practical business questions related to revenue, customers, products, profitability, shipping modes, customer segments, and sales trends.

The purpose of this project is to strengthen SQL skills and apply them to **real-world business and data analysis problems**.

---

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* SQL
* Relational Databases
* Excel
* Data Analysis

---

## 🗂️ Databases & Tables

The project contains multiple tables used for SQL practice and analysis.

### 1. Employee Table

The `EMPLOYEE` table contains employee information such as:

* Employee ID
* Employee Name
* Department
* Manager ID
* Salary

Example business questions explored:

* Finding employees based on salary
* Filtering employees by department
* Finding minimum salary by department
* Calculating total and average salary
* Updating employee information
* Comparing employee salary with manager salary
* Finding employee-manager relationships using Self Join

---

### 2. Department Table

The `DEPARTMENT` table contains:

* Department ID
* Department Name
* Location
* Budget
* Head of Department

Analysis included:

* Finding minimum and maximum department budgets
* Calculating total department budget
* Finding departments with the lowest budget
* Calculating average employee salary by department
* Combining employee and department information

---

### 3. Customers Table

The `CUSTOMERS` table contains:

* Customer ID
* Customer Name
* City

This table was mainly used to practice relationships between customers and their orders.

---

### 4. Orders Table

The `ORDERS` table contains:

* Order ID
* Customer ID
* Product
* Total Amount

The Customers and Orders tables were used to practice different types of SQL joins.

---

### 5. Sales Table

The `SALES` table is the main dataset used for business analysis.

It contains information related to:

* Customers
* Products
* Categories and Sub-Categories
* Regions and States
* Sales Amount
* Sold Quantity
* Unit Profit
* Shipping Mode
* Customer Segment
* Order Date

The sales data was analyzed to identify trends, top-performing products, profitable categories, customer behavior, and regional performance.

---

### 6. Student Table

The `STUDENT` table was created to practice **SQL ranking and window functions**.

It contains:

* Student ID
* Student Name
* Marks

This table was used to understand:

* `ROW_NUMBER()`
* `RANK()`
* `DENSE_RANK()`
* `NTILE()`

---

# 📚 SQL Concepts Covered

## 1. Database & Table Creation

Practiced:

* `CREATE DATABASE`
* `USE`
* `CREATE TABLE`
* `INSERT INTO`
* `DROP DATABASE`
* `DROP TABLE`
* `TRUNCATE TABLE`

---

## 2. SELECT & Filtering

Practiced retrieving and filtering data using:

* `SELECT`
* `WHERE`
* `AND`
* `OR`
* `IN`
* `NOT IN`
* `DISTINCT`

Example:

```sql
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY < 60000;
```

---

## 3. Sorting & Limiting Data

Practiced:

* `ORDER BY`
* `ASC`
* `DESC`
* `LIMIT`
* `OFFSET`

These were used to find top-performing and lowest-performing records.

---

## 4. Aggregate Functions

Practiced:

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Example:

```sql
SELECT Region, SUM(Total_Amount) AS Total_Revenue
FROM sales
GROUP BY Region
ORDER BY Total_Revenue DESC;
```

---

## 5. GROUP BY & HAVING

Used `GROUP BY` to perform analysis at different levels such as:

* Region
* Country
* Customer
* Product
* Category
* Segment
* Shipping Mode

Used `HAVING` to filter grouped results.

Example:

```sql
SELECT Customer_Name, COUNT(*) AS Number_of_Orders
FROM SALES
GROUP BY Customer_Name
HAVING COUNT(*) > 1;
```

---

## 6. Wildcard Operators

Practiced pattern matching using `LIKE`.

Examples:

* `%` — represents any number of characters
* `_` — represents a single character

Example:

```sql
SELECT *
FROM employee
WHERE EMP_NAME LIKE 'P%';
```

---

## 7. Updating & Deleting Data

Practiced modifying table data using:

* `UPDATE`
* `CASE`
* `DELETE`

Also practiced SQL Safe Update Mode while working with updates and deletes.

---

# 🔗 SQL Joins

Different types of joins were practiced using Employee, Department, Customers, and Orders tables.

### INNER JOIN

Used to return matching records between tables.

### LEFT JOIN

Used to return all records from the left table and matching records from the right table.

### RIGHT JOIN

Used to return all records from the right table and matching records from the left table.

### SELF JOIN

Used to compare records within the same table.

For example, the Employee table was joined with itself to identify:

**Employee → Manager**

```sql
SELECT 
    e.EMP_NAME AS Employee,
    m.EMP_NAME AS Manager
FROM employee e
JOIN employee m
ON e.MANAGER_ID = m.EMP_ID;
```

---

# 🔄 UNION & INTERSECT

Practiced combining results from multiple queries using:

* `UNION`
* `UNION ALL`
* `INTERSECT`

Also learned the requirements for combining result sets, such as having compatible columns and data types.

---

# 📅 Date & Time Analysis

The original `Order_Date` column in the sales dataset was stored as text.

I converted the text date into a proper SQL `DATE` format using:

```sql
STR_TO_DATE()
```

A new date column was created and populated for further analysis.

Practiced date functions including:

* `YEAR()`
* `MONTH()`
* `MONTHNAME()`
* `DAY()`
* `DAYNAME()`
* `DATE_FORMAT()`
* `STR_TO_DATE()`
* `CURDATE()`

This allowed analysis of:

* Yearly sales
* Monthly sales
* Month names
* Day names
* Year-month combinations
* Sales trends over time

---

# 📊 Sales Data Analysis

The sales dataset was used to answer practical business questions.

## 1. Regional Revenue Analysis

Identified which **Region and State** generated the highest total sales revenue.

```sql
SELECT Region, State, SUM(Total_Amount) AS Total_Revenue
FROM sales
GROUP BY Region, State
ORDER BY Total_Revenue DESC
LIMIT 1;
```

---

## 2. Top Customers

Identified the top 10 customers based on their total purchase amount.

Also counted how many times each customer placed an order.

Metrics included:

* Total Purchase Amount
* Number of Orders

---

## 3. Best-Selling Products

Analyzed products based on:

* Total Quantity Sold
* Total Revenue

This helped identify the products with the highest sales volume and revenue contribution.

---

## 4. Most Profitable Categories & Sub-Categories

Calculated total profit using:

```text
Unit Profit × Sold Quantity
```

The analysis was used to identify the top 3 most profitable combinations of:

* Category
* Sub-Category

---

## 5. Monthly Sales Trend

Analyzed sales revenue across different months and years to understand whether sales were increasing or decreasing over time.

The analysis used:

* Year
* Month
* Total Revenue

---

## 6. Yearly Revenue

Calculated total revenue for each year to compare annual sales performance.

---

## 7. Shipping Mode Analysis

Analyzed different shipping modes based on:

* Number of orders
* Total profit

This helped understand which shipping modes were most commonly used and their relati
