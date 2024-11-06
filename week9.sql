USE comp2003g;

-- try a 2 table query without a join
-- this returns a Cartesian product: each record in 1 table is combined with each record in the other
-- 25 orders / 9 restaurants => 225 results (9 x 25)
SELECT orders.*, restaurants.*
FROM orders, restaurants;

-- check how many orders and restaurants there actually are
SELECT * FROM orders;
SELECT * FROM restaurants;

-- rewrite using a JOIN to specify exactly how orders and restaurants are connected
-- FK in orders equals PK in parent
SELECT orders.*, restaurants.*
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId;

-- reverse order of tables in same query
-- this works the same with INNER JOIN; order of tables doesn't matter
SELECT orders.*, restaurants.*
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId;

-- extend to 3 tables, adding driver name
SELECT orderId, orderDate, total, name AS restaurant, firstName, lastName
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
INNER JOIN drivers ON orders.driverId = drivers.driverId;

-- extend to 4 tables, adding cuisine name
SELECT cuisines.name AS cuisine, restaurants.name AS restaurant, orderId, orderDate, total, firstName, lastName
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
INNER JOIN drivers ON orders.driverId = drivers.driverId
INNER JOIN cuisines ON restaurants.cuisineId = cuisines.cuisineId;

/* select data from tables in an indirect relationship (great grandparent - child) 
including intermediate grandparent and parent tables */
SELECT firstName, lastName, name AS product
FROM customers
INNER JOIN orders ON customers.customerId = orders.customerId
INNER JOIN orderItems ON orders.orderId = orderItems.orderId
INNER JOIN products ON orderItems.productId = products.productId; 

-- add a few order items
INSERT INTO orderItems (productId, orderId, quantity, price) VALUES
(10, 101, 1, 4.99),
(11, 101, 2, 5.99),
(12, 101, 3, 8.99),
(3, 102, 12, 3.00);

-- show all orders, their restaurants and driver if any
-- LEFT JOIN: show all records on the left side of the equals sign, even when table on right side has no matching records
SELECT orderId, orderDate, total, restaurants.name AS restaurant, firstName, lastName
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
LEFT JOIN drivers ON orders.driverId = drivers.driverId;

-- LEFT JOIN / LEFT OUTER JOIN are the same
SELECT orderId, orderDate, total, restaurants.name AS restaurant, firstName, lastName
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
LEFT OUTER JOIN drivers ON orders.driverId = drivers.driverId;

-- JOIN practice
-- 1. Show all restaurants and their related cuisines (names of both only)
SELECT restaurants.name AS restaurant, cuisines.name AS cuisine
FROM restaurants
INNER JOIN cuisines ON cuisines.cuisineId = restaurants.cuisineId;

-- 2. Show how many restaurants there are for each cuisine. Use JOIN and GROUP BY
SELECT COUNT(restaurantId) AS restaurantCount, cuisines.name AS cuisine
FROM restaurants
INNER JOIN cuisines ON cuisines.cuisineId = restaurants.cuisineId
GROUP BY cuisine;

-- 3. Show the total order revenue for Sakana House North
SELECT restaurants.name as restaurant, SUM(total) as revenue
FROM restaurants
INNER JOIN orders ON orders.restaurantId = restaurants.restaurantId
WHERE restaurants.name = "Sakana House North";
 
-- 4. Show how many orders were made by each customer, order by first, then last (include all customers)
-- this almost works, but only shows customers who have made at least 1 order
SELECT COUNT(orderId) AS orderCount, firstName, lastName 
FROM orders 
INNER JOIN customers ON orders.customerId = customers.customerId
GROUP BY firstName, lastName;

-- use RIGHT JOIN to show all customers (table right of =) even without matching records in left side table
SELECT COUNT(orderId) AS orderCount, firstName, lastName 
FROM orders 
RIGHT JOIN customers ON orders.customerId = customers.customerId
GROUP BY firstName, lastName;

-- 5. Show the total value delivered by each type of vehicle, even those who haven't many any deliveries
-- this shows only records with matching values in each table
SELECT vehicle, SUM(total) AS revenue
FROM drivers
INNER JOIN orders ON drivers.driverId = orders.driverId
GROUP BY vehicle;

-- use an OUTER JOIN instead of INNER to include all vehicles even those never used for an order
SELECT vehicle, SUM(total) AS revenue
FROM drivers
LEFT JOIN orders ON drivers.driverId = orders.driverId
GROUP BY vehicle;

-- 6. Show the customer who has spent the most money ordering (name and total value of their orders)
SELECT customers.firstName AS firstName, customers.lastName AS lastName, SUM(orders.total) AS Total
FROM customers
INNER JOIN orders ON customers.customerId = orders.customerId
GROUP BY customers.firstName, customers.lastName
ORDER BY SUM(orders.total) DESC
LIMIT 1;

