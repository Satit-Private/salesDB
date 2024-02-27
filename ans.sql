-- Q1 แสดงชื่อของลูกค้า (name)  ที่ชำระเงินสูงสุด
SELECT c.customer_name as name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
ORDER BY p.amount DESC
LIMIT 1;

-- Q2 แสดงชื่อสินค้า (product_name) ที่มีการซื้อมากกว่า 1 ครั้ง
SELECT product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_details
    GROUP BY product_id
    HAVING COUNT(*) > 1
);

-- Q3 แสดงชื่อของลูกค้าที่เคยซื้อสินค้าที่มีชื่อว่า “Sugar - Brown”
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_id IN (
        SELECT order_id
        FROM order_details
        WHERE product_id = (
            SELECT product_id
            FROM products
            WHERE product_name = 'Sugar - Brown'
        )
    )
);

-- Q4 แสดงชื่อสินค้า (products) ที่เคยถูกซื้อด้วยลูกค้าที่มีรหัสประจำตัวคือ “71-4595008”
SELECT product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_details
    WHERE order_id IN (
        SELECT order_id
        FROM orders
        WHERE customer_id = '71-4595008'
    )
);

-- Q5 แสดงชื่อลูกค้าที่สั่งซื้อสินค้าอย่างน้อยหนึ่งรายการโดยสินค้าชิ้นนั้นต้องมีราคาต่อหน่วย (unit_price) มากกว่า $50
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_id IN (
        SELECT order_id
        FROM order_details
        WHERE product_id IN (
            SELECT product_id
            FROM products
            WHERE unit_price > 50
        )
    )
);

-- Q6 แสดงชื่อลูกค้า (name) พร้อมกับจำนวนคำสั่งซื้อทั้งหมด (total_orders) และจำนวนเงินที่ชำระทั้งหมด (total_payment) ของลูกค้าแต่ละคน
SELECT c.customer_name AS name, (
    SELECT COUNT(*) 
    FROM orders 
    WHERE orders.customer_id = c.customer_id
) AS total_orders, (
    SELECT SUM(amount) 
    FROM payments 
    WHERE order_id IN (
        SELECT order_id 
        FROM orders 
        WHERE orders.customer_id = c.customer_id
    )
) AS total_payment
FROM customers c;

-- Q7 แสดงข้อมูลชื่อลูกค้า รหัสคำสั่งซื้อ และวิธีการชำระเงินสำหรับคำสั่งซื้อที่มียอดการชำระเงินรวมเกิน $100
SELECT c.customer_name AS Name, o.order_id AS ID, p.payment_method AS Method
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN payments p ON o.order_id = p.order_id
WHERE o.order_id IN (
    SELECT order_id
    FROM payments
    GROUP BY order_id
    HAVING SUM(amount) > 100
);

-- Q8 แสดงชื่อลูกค้า รหัสคำสั่งซื้อ และจำนวนเงินรวมสำหรับคำสั่งซื้อที่เกิดขึ้นตั้งแต่วันที่ 1 มกราคม 2023
SELECT c.customer_name AS Name, o.order_id AS ID, (
    SELECT SUM(amount)
    FROM payments
    WHERE order_id = o.order_id
) AS total_payment
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2023-01-01';


