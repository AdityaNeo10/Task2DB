# Task2DB
The task focuses on data insertion, updating, deletion, and null handling using a relational e-commerce database schema. All operations follow proper constraints, safe deletion practices, and demonstrate key DML concepts.


# Task 2 – SQL Data Insertion, Updating, Deletion, and NULL Handling

Objective:
Practice data manipulation using `INSERT`, `UPDATE`, `DELETE`, and handle `NULL` and default values in a normalized e-commerce database.

 Schema Overview:
- `Users`: Stores user information
- `Products`: Product catalog
- `Orders`: Customer orders
- `OrderItems`: Items in each order
- `Payments`: Payment details per order

 Operations Performed:

 INSERT:
- 3 users, 3 products, 3 orders
- OrderItems and Payments related to those orders
- One product inserted with NULL description

 UPDATE:
- Changed order status from 'Pending' to 'Delivered'
- Updated password for a user
- Set product description to NULL for testing null-handling

 DELETE:
- Safely deleted payment with method 'Cash on Delivery'
- Simulated out-of-stock product and deleted it

 NULL HANDLING:
- Queried all products with NULL descriptions
  Notes:
- All foreign keys respected
- ENUM, DEFAULT, and AUTO_INCREMENT fields used properly
- Safe deletion handled via subqueries to avoid MySQL Workbench's Safe Update Mode errors

  Tested On:
- MySQL Workbench (with Safe Update Mode)
- DB Fiddle (MySQL 8.0)

  File:
- `task2_final.sql` – contains all DML and DDL statements required for submission

