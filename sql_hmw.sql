create database computer;
use computer;
create table comp(brand varchar(50), model varchar(50), cpu varchar(50), frequency real, ram int, os varchar(50), price int);
insert into comp values('Apple', 'MacBook Pro', 'Intel Core i7', 3.2, 16, 'macOS', 2500),
                        ('Apple', 'MacBook Air', 'Intel Core i5', 2.5, 8, 'macOS', 1500),
                        ('ASUS', 'ZenBook 13', 'Intel Core i5', 2.8, 8, 'Windows 10', 900),
                        ('ASUS', 'ROG Strix', 'AMD Ryzen 7', 3.6, 16, 'Windows 11', 1800),
                        ('HP', 'Pavilion', 'Intel Core i5', 2.4, 8, 'Windows 10', 700),
                        ('HP', 'Omen', 'Intel Core i7', 3.5, 16, 'Windows 11', 1600),
                        ('Dell', 'XPS 13', 'Intel Core i7', 3.1, 16, 'Windows 10', 2000),
                        ('Dell', 'Inspiron', 'Intel Core i5', 2.3, 8, 'Windows 10', 800),
                        ('Lenovo', 'ThinkPad X1', 'Intel Core i7', 3.3, 16, 'Windows 11', 2100),
                        ('Lenovo', 'IdeaPad 3', 'AMD Ryzen 5', 2.1, 8, 'Windows 10', 600),
                        ('Acer', 'Aspire 5', 'Intel Core i5', 2.6, 8, 'Windows 10', 750),
                        ('Acer', 'Predator', 'Intel Core i7', 3.7, 16, 'Windows 11', 1900),
                        ('MSI', 'GF63', 'Intel Core i5', 2.7, 8, 'Windows 10', 850),
                        ('MSI', 'GE76', 'Intel Core i7', 3.8, 32, 'Windows 11', 2700),
                        ('Apple', 'Mac Mini', 'M1', 3.2, 8, 'macOS', 1200),
                        ('ASUS', 'VivoBook', 'Intel Core i3', 1.8, 4, 'Windows 10', 500),
                        ('HP', 'EliteBook', 'Intel Core i7', 3.0, 16, 'Windows 10', 1700),
                        ('Dell', 'Latitude', 'Intel Core i5', 2.5, 8, 'Windows 10', 950),
                        ('Lenovo', 'Legion', 'AMD Ryzen 7', 3.9, 16, 'Windows 11', 2200),
                        ('Acer', 'Swift 3', 'AMD Ryzen 5', 2.4, 8, 'Windows 10', 780);
select * from comp order by price desc limit 1;
+-------+-------+---------------+-----------+------+------------+-------+
| brand | model | cpu           | frequency | ram  | os         | price |
+-------+-------+---------------+-----------+------+------------+-------+
| MSI   | GE76  | Intel Core i7 |       3.8 |   32 | Windows 11 |  2700 |
+-------+-------+---------------+-----------+------+------------+-------+
select * from comp order by price limit 1;
+-------+----------+---------------+-----------+------+------------+-------+
| brand | model    | cpu           | frequency | ram  | os         | price |
+-------+----------+---------------+-----------+------+------------+-------+
| ASUS  | VivoBook | Intel Core i3 |       1.8 |    4 | Windows 10 |   500 |
+-------+----------+---------------+-----------+------+------------+-------+
select frequency from comp where price between 400 and 1000 and cpu like "%Intel%";
+-----------+
| frequency |
+-----------+
|       2.8 |
|       2.4 |
|       2.3 |
|       2.6 |
|       2.7 |
|       1.8 |
|       2.5 |
+-----------+
select * from comp where brand = "Apple";
+-------+-------------+---------------+-----------+------+-------+-------+
| brand | model       | cpu           | frequency | ram  | os    | price |
+-------+-------------+---------------+-----------+------+-------+-------+
| Apple | MacBook Pro | Intel Core i7 |       3.2 |   16 | macOS |  2500 |
| Apple | MacBook Air | Intel Core i5 |       2.5 |    8 | macOS |  1500 |
| Apple | Mac Mini    | M1            |       3.2 |    8 | macOS |  1200 |
+-------+-------------+---------------+-----------+------+-------+-------+
select price from comp where brand = "ASUS" and os like "%Windows%" and ram>8 order by price;