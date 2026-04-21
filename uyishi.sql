CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;
DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO sales VALUES (1, 'Laptop', 'Electronics', 800, 2, '2025-01-01');
INSERT INTO sales VALUES (2, 'Phone', 'Electronics', 600, 3, '2025-01-01');
INSERT INTO sales VALUES (3, 'TV', 'Electronics', 900, 1, '2025-01-02');
INSERT INTO sales VALUES (4, 'Headphones', 'Electronics', 150, 5, '2025-01-03');

INSERT INTO sales VALUES (5, 'Table', 'Furniture', 300, 1, '2025-01-01');
INSERT INTO sales VALUES (6, 'Chair', 'Furniture', 100, 4, '2025-01-02');
INSERT INTO sales VALUES (7, 'Sofa', 'Furniture', 1200, 1, '2025-01-03');
INSERT INTO sales VALUES (8, 'Bed', 'Furniture', 900, 1, '2025-01-04');

INSERT INTO sales VALUES (9, 'T-shirt', 'Clothing', 40, 6, '2025-01-01');
INSERT INTO sales VALUES (10, 'Jeans', 'Clothing', 70, 3, '2025-01-02');
INSERT INTO sales VALUES (11, 'Jacket', 'Clothing', 120, 2, '2025-01-03');
INSERT INTO sales VALUES (12, 'Shoes', 'Clothing', 90, 4, '2025-01-04');

INSERT INTO sales VALUES (13, 'Apple', 'Food', 2, 20, '2025-01-01');
INSERT INTO sales VALUES (14, 'Bread', 'Food', 3, 15, '2025-01-02');
INSERT INTO sales VALUES (15, 'Milk', 'Food', 4, 10, '2025-01-03');
INSERT INTO sales VALUES (16, 'Cheese', 'Food', 8, 5, '2025-01-04');

INSERT INTO sales VALUES (17, 'Notebook', 'Stationery', 5, 10, '2025-01-01');
INSERT INTO sales VALUES (18, 'Pen', 'Stationery', 2, 25, '2025-01-02');
INSERT INTO sales VALUES (19, 'Marker', 'Stationery', 4, 12, '2025-01-03');
INSERT INTO sales VALUES (20, 'Folder', 'Stationery', 6, 8, '2025-01-04');

-- 1
select category, sum(quantity) from sales group by category;
+-------------+---------------+
| category    | sum(quantity) |
+-------------+---------------+
| Electronics |            11 |
| Furniture   |             7 |
| Clothing    |            15 |
| Food        |            50 |
| Stationery  |            55 |
+-------------+---------------+

-- 2
select category, sum(price * quantity) from sales group by category;
+-------------+-----------------------+
| category    | sum(price * quantity) |
+-------------+-----------------------+
| Electronics |                  5050 |
| Furniture   |                  2800 |
| Clothing    |                  1050 |
| Food        |                   165 |
| Stationery  |                   196 |
+-------------+-----------------------+

-- 3
select category, avg(price) from sales group by category;
+-------------+------------+
| category    | avg(price) |
+-------------+------------+
| Electronics |   612.5000 |
| Furniture   |   625.0000 |
| Clothing    |    80.0000 |
| Food        |     4.2500 |
| Stationery  |     4.2500 |
+-------------+------------+

-- 4
select sale_date, sum(price * quantity) from sales group by sale_date;
+------------+-----------------------+
| sale_date  | sum(price * quantity) |
+------------+-----------------------+
| 2025-01-01 |                  4030 |
| 2025-01-02 |                  1605 |
| 2025-01-03 |                  2278 |
| 2025-01-04 |                  1348 |
+------------+-----------------------+

-- 5
select sum(price * quantity) from sales where category = 'Electronics';
+-----------------------+
| sum(price * quantity) |
+-----------------------+
|                  5050 |
+-----------------------+

-- 6
select category, sum(price * quantity) from sales group by category having sum(price * quantity) > 2000;
+-------------+-----------------------+
| category    | sum(price * quantity) |
+-------------+-----------------------+
| Electronics |                  5050 |
| Furniture   |                  2800 |
+-------------+-----------------------+

-- 7
select category, avg(price) from sales group by category having avg(price) > 100;
+-------------+------------+
| category    | avg(price) |
+-------------+------------+
| Electronics |   612.5000 |
| Furniture   |   625.0000 |
+-------------+------------+

-- 8
select sum(quantity) from sales where sale_date = '2025-01-01';
+---------------+
| sum(quantity) |
+---------------+
|            42 |
+---------------+

-- 9
select category, sum(quantity) from sales group by category order by sum(quantity) desc limit 1;
+------------+----------------+
| category   | total_quantity |
+------------+----------------+
| Stationery |             55 |
+------------+----------------+

-- 10
select category, sum(price * quantity) from sales where quantity > 3 group by category;
+-------------+-----------------------+
| category    | sum(price * quantity) |
+-------------+-----------------------+
| Electronics |                   750 |
| Furniture   |                   400 |
| Clothing    |                   600 |
| Food        |                   165 |
| Stationery  |                   196 |
+-------------+-----------------------+