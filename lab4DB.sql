-- Q1 ลบแอตทริบิวต์ Order_count
Alter table customers drop column Order_count;
-- Q2 เปลี่ยนชื่อแอตทริบิวต์ Customer_name เป็น Cus_name
ALTER TABLE customers
CHANGE COLUMN Customer_name Cus_name varchar(50);
-- Q3 แสดงข้อมูลของลูกค้าทั้งหมดที่ไม่ได้มีชื่อขึ้นด้วย A, B และ C
select * from customers WHERE Cus_name NOT LIKE 'A%' AND Cus_name NOT LIKE 'B%' AND Cus_name NOT LIKE 'C%';
-- Q4 ลบลูกค้าที่รหัสประจำตัวมีเลข 1 ในเลขรหัสประจำตัวทั้งหมด
select * from customers WHERE customer_id LIKE '%1%';
-- Q5 แสดงรหัสประจำตัวของลูกค้าที่ซื้อสินค้าคนจากคำสั่งซื้อเก่าที่สุดไปคำสั่งซื้อล่าสุด
select customer_id from orders ORDER BY order_date DESC;
-- Q6 แสดงรหัสประจำตัวของลูกค้าที่มีคำสั่งซื้อล่าสุดไปคำสั่งซื้อที่เก่าที่สุด
select customer_id from orders ORDER BY order_date;
-- Q7 เปลี่ยนชนิดข้อมูลในแอตทริบิวต์ Order_date เป็น Varchar(60)
ALTER TABLE orders
MODIFY COLUMN order_date Varchar(60);
-- Q8 แสดงชื่อผลิตภัณฑ์ที่มีวันหมดอายุไปแล้ว
SELECT count(product_name) as count
FROM Expired_Products
WHERE expiration_date < '2024-01-19';
