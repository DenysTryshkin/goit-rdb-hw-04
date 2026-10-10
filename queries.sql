USE goit_rdb_hw_03;

SELECT *
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id;

-- Count rows after joining eight tables

SELECT COUNT(*) AS total_rows
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id;
-- Compare INNER JOIN and LEFT JOIN

SELECT COUNT(*) AS total_rows
FROM orders
LEFT JOIN customers
    ON orders.customer_id = customers.id
LEFT JOIN employees
    ON orders.employee_id = employees.employee_id
LEFT JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id;

-- Filter by employee ID

SELECT *
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3
    AND orders.employee_id <= 10;

-- Group by category

SELECT
    categories.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(order_details.quantity) AS average_quantity
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3
    AND orders.employee_id <= 10
GROUP BY categories.name;

-- Filter groups using HAVING

SELECT
    categories.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(order_details.quantity) AS average_quantity
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3
    AND orders.employee_id <= 10
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21;

-- Sort categories by row count
SELECT
    categories.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(order_details.quantity) AS average_quantity
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3
    AND orders.employee_id <= 10
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21
ORDER BY total_rows DESC;

-- Limit results and skip the first row
SELECT
    categories.name AS category_name,
    COUNT(*) AS total_rows,
    AVG(order_details.quantity) AS average_quantity
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id
INNER JOIN employees
    ON orders.employee_id = employees.employee_id
INNER JOIN shippers
    ON orders.shipper_id = shippers.id
INNER JOIN order_details
    ON orders.id = order_details.order_id
INNER JOIN products
    ON order_details.product_id = products.id
INNER JOIN categories
    ON products.category_id = categories.id
INNER JOIN suppliers
    ON products.supplier_id = suppliers.id
WHERE orders.employee_id > 3
    AND orders.employee_id <= 10
GROUP BY categories.name
HAVING AVG(order_details.quantity) > 21
ORDER BY total_rows DESC
LIMIT 4 OFFSET 1;