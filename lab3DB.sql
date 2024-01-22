-- Q1 แสดงข้อมูลลูกค้าที่มาจากเมือง Mora ทั้งหมด
SELECT * FROM Customers WHERE city = 'Mora';

-- Q2 เพิ่มลูกค้าใหม่ที่มีรายละเอียดดังนี้ รหัสประจำตัวลูกค้า '07-1137077', ชื่อลูกค้า 'Audi', ชื่อประเทศ 'SU-Land',จำนวนการสั่งสินค้า 0 
insert into customers (customer_id, customer_name, city, order_count)
values ('07-1137077', 'Audi', 'SU-Land', 0);

-- Q3 เปลี่ยนชื่อลูกค้าที่มีรหัสประจำตัว ‘71-4595008’ เป็น 'Anna'
UPDATE Customers
SET customer_name = 'Anna'
WHERE customer_id = '71-4595008';

-- Q4 แสดงคำสั่งซื้อล่าสุดสำหรับลูกค้าแต่ละคน โดยมีรายละเอียดดังนี้ customer_id, latest_your_order
SELECT customer_id, MAX(order_date) AS latest_your_order
FROM orders
GROUP BY customer_id;

-- Q5 แสดงจำนวนคำสั่งซื้อทั้งหมดสำหรับลูกค้าแต่ละคน โดยมีรายละเอียดดังนี้ customer_id, total_orders
SELECT customer_id, COUNT(order_id) AS total_orders FROM Orders GROUP BY customer_id;

-- Q6 แสดงชื่อผลิตภัณฑ์และราคาจากตาราง “products” ซึ่งมีราคาน้อยกว่า 20 
SELECT product_name, unit_price
FROM Products
WHERE unit_price < 20;

-- Q7 แสดงการคำนวณจำนวนคำสั่งซื้อเฉลี่ยต่อเมือง โดยมีรายละเอียดดังนี้ ชื่อเมือง, ค่าเฉลี่ยจำนวนคำสั่งชื่อ ("avg_order_count")
SELECT city, AVG(order_count) AS avg_order_count
FROM Customers
GROUP BY city;

-- Q8 แสดงชื่อผลิตภัณฑ์และราคาจากตาราง “products” ซึ่งมีราคาตั้งแต่ 20 ถึง 50 
SELECT product_name, unit_price FROM products WHERE unit_price BETWEEN 20 AND 50;

-- Q9 แสดงข้อมูลลูกค้าทั้งหมดที่ชื่อ 'Anna'
SELECT * FROM Customers WHERE customer_name = 'Anna';

-- Q10 แสดงชื่อผลิตภัณฑ์ที่มีวันหมดอายุก่อนปี 2023
SELECT product_name
FROM Expired_Products
WHERE expiration_date < '2023-01-01';
