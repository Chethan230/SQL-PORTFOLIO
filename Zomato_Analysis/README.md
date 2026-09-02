# 🍴 Zomato Analysis

## 📌 Project Overview

This project demonstrates SQL Server database programming and data analysis using a Zomato restaurant dataset.

The project focuses on writing SQL queries and implementing SQL concepts such as user-defined functions, stored procedures, transactions, views, triggers, subqueries, window functions, aggregate functions, and conditional logic.

## 🛠️ Technologies Used

- Microsoft SQL Server
- SQL
- SQL Server Management Studio (SSMS)

## 📊 Dataset

The Zomato dataset contains restaurant information including:

- Restaurant Name
- Restaurant Type
- Rating
- Number of Ratings
- Average Cost
- Online Order
- Table Booking
- Cuisine Type
- Area
- Local Address
- Delivery Time

## 🔍 SQL Concepts Covered

### 1. User-Defined Function

Created a function to transform:

`Quick Bites` → `Quick Chicken Bites`

### 2. Subquery

Used a subquery to identify the restaurant with the maximum number of ratings.

### 3. CASE Statement

Created a rating status based on restaurant ratings:

- Excellent
- Good
- Average
- Bad

### 4. Mathematical Functions

Used:

- `CEILING()`
- `FLOOR()`
- `ABS()`

### 5. Date Functions

Used:

- `GETDATE()`
- `YEAR()`
- `DATENAME()`

### 6. ROLLUP

Calculated the total average cost by restaurant type using `ROLLUP`.

### 7. Stored Procedure

Created a stored procedure to display restaurants where table booking is available.

### 8. Transaction Management

Updated the cuisine type from `Cafe` to `Cafeteria`, checked the result, and rolled back the transaction.

### 9. ROW_NUMBER()

Generated row numbers and identified the top-rated restaurants.

### 10. WHILE Loop

Used a `WHILE` loop to display numbers from 1 to 50.

### 11. View

Created a view containing the top 5 highest-rated restaurants.

### 12. Trigger

Created an `AFTER INSERT` trigger to display a message whenever a new restaurant record is inserted.

## ▶️ How to Run

1. Open Microsoft SQL Server Management Studio.
2. Import the Zomato dataset.
3. Create the `ZOMATO` database.
4. Open the `Zomato_Analysis.sql` file.
5. Execute the queries step by step.

## 👨‍💻 Author

Chethan D

This project was created as part of SQL practice and database management learning.
