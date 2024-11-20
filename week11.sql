USE comp2003g;

-- all products above the average price
SELECT AVG(price) FROM products;
SELECT * FROM products WHERE price > 12.355455;

-- use subquery 
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT * FROM products;

-- insert new product; are 2 step query and subquery results still the same?
INSERT INTO products (name, price, description, restaurantId)
VALUES ('Butter Chicken', 16.99, 'Tender pieces of barbecued chicken cooked with butter and cream of tomatoes', 4);


-- 1. Restaurants with Orders Above the Overall Average Total
SELECT AVG(total) FROM orders;
SELECT name, total
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
WHERE total > (SELECT AVG(total) FROM orders);

-- 2. Orders placed at either "Sakana House South", "Mexican House", or "Pizzeria Italia"
SELECT name, orderId, total, orderDate
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
WHERE name IN ('Sakana House South', 'Mexican House', 'Pizzeria Italia');

-- 2a. Try NOT IN to get the opposite results
SELECT name, orderId, total, orderDate
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
WHERE name NOT IN ('Sakana House South', 'Mexican House', 'Pizzeria Italia');
    
-- 3. Maximum Order Total for Each Restaurant.  Rich screwed up - this doesn't need a subquery but we will do it anyway!
SELECT name, MAX(total) AS highestOrder
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
GROUP BY name;    
    
-- 4. Orders Above the Average for Sakana House South
-- subquery 1st: avg total of Sakana House South orders
SELECT AVG(total) 
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
WHERE name = 'Sakana House South';

SELECT name, orderId, total, orderDate
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
WHERE name = 'Sakana House South'
AND total > (SELECT AVG(total) 
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
WHERE name = 'Sakana House South');
    
    
-- 5. Restaurants with Total Sales Greater Than $310
SELECT name, SUM(total) AS totalSales
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId
GROUP BY name
HAVING SUM(total) > 310;

SELECT name
FROM restaurants
WHERE restaurantId IN (SELECT restaurantId FROM orders GROUP BY restaurantId HAVING SUM(total) > 310);

-- Solo Practice:
-- 1. Customer names who have placed orders
SELECT orders.customerId
FROM orders;

SELECT CONCAT(customers.firstName, ' ', customers.lastName) AS name
FROM customers
WHERE customers.customerId IN (
SELECT orders.customerId
FROM orders);
 
-- 2. Drivers who have not delivered any orders (use NOT IN)
SELECT CONCAT(drivers.firstName, ' ' , drivers.lastName) AS drivers
FROM drivers
WHERE drivers.driverId NOT IN (
SELECT orders.driverId
FROM orders
WHERE driverId IS NOT NULL);

SELECT orders.driverId
FROM orders
WHERE driverId IS NOT NULL;

-- 3. Product names that have been ordered at least once (no duplicates)
SELECT products.name 
FROM products
WHERE products.productId IN (
SELECT products.productId
FROM products
INNER JOIN orderItems ON orderitems.productId = products.productId);

SELECT name
FROM products
WHERE productId IN (
	SELECT productId
    FROM orderItems
) GROUP BY name;

-- use DISTINCT to remove any duplicates
SELECT DISTINCT name
FROM products
WHERE productId IN (SELECT productId FROM orderItems);

-- 4. Drivers who have picked up orders on Cundles Road
SELECT CONCAT(drivers.firstName, ' ', drivers.lastName) as driver
FROM drivers
WHERE drivers.driverId IN 
(SELECT driverId 
FROM orders 
INNER JOIN restaurants ON restaurants.restaurantId = orders.restaurantId
WHERE restaurants.address LIKE '%Cundles Road%')
GROUP BY driver;
 

-- 5. Customer name with the highest average order total
-- subquery first
SELECT customerId
FROM ORDERS
GROUP BY customerId
ORDER BY AVG(total) DESC LIMIT 1;

SELECT firstName, lastName
FROM customers
WHERE customerId = (SELECT customerId
FROM ORDERS
GROUP BY customerId
ORDER BY AVG(total) DESC LIMIT 1);

