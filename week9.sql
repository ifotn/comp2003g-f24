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

