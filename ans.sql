-- Q1 แสดงชื่อของลูกค้าและจำนวนเงินที่มาจากคำสั่งซื้อสูงสุด (highest_order_amount) ของลูกค้าแต่ละราย
SELECT customer_name, MAX(amount) AS highest_order_amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Payments ON Orders.order_id = Payments.order_id
group by Customers.customer_id;

-- Q2 แสดงข้อมูลวิธีการชำระเงินและจำนวนเงินรวม (sum_amount) ของแต่ละวิธีการชำระเงินจากตาราง  “Payments”  โดยที่จำนวนเงินรวมน้อยกว่า $200 
SELECT payment_method, SUM(amount) as sum_amount
FROM Payments
GROUP BY payment_method
HAVING SUM(amount) < 200;

-- Q3 แสดงรายการสินค้าทั้งหมดพร้อมกับปริมาณรวมที่ขายได้ (total_quantity_sold)
SELECT product_name, SUM(quantity) AS total_quantity_sold
FROM Products
JOIN Order_Details ON Products.product_id = Order_Details.product_id
GROUP BY product_name;

-- Q4 แสดงข้อมูลวิธีการชำระเงินและคำนวณเปอร์เซ็นต์ของยอดขายรวมสำหรับแต่ละวิธีการชำระเงิน (percentage_of_total_sales)

SELECT
    p.payment_method,
    (SUM(p.amount) / (SELECT SUM(amount) FROM payments)) * 100 AS percentage_of_total_sales
FROM
    payments p
GROUP BY
    p.payment_method;

-- Q5 คำนวณรายได้รวม (total_revenue) โดยการคูณปริมาณ “quantity” และราคาต่อชิ้น “unit_price”
   SELECT 
    SUM(od.quantity * p.unit_price) AS total_revenue
FROM
    order_details od
        JOIN
    products p ON od.product_id = p.product_id;

-- Extra แสดงรหัสประจำตัวลูกค้าและชื่อลูกค้าของ 5 อันดับแรกที่มียอดสั่งซื้อรวมสูงสุด (total_order_amount)

SELECT
    c.customer_id,
    c.customer_name,
    SUM(p.amount) AS total_order_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    payments p ON o.order_id = p.order_id
GROUP BY
    c.customer_id, c.customer_name
ORDER BY
    total_order_amount DESC
LIMIT 5;  
