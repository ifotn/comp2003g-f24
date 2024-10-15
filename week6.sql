USE comp2003g;

DESC restaurants;
SELECT * FROM restaurants;

INSERT INTO cuisines (name) VALUES
('@@@my place'),
('123 cuisine');

-- sorting rules tests
-- characters or numbers?
SELECT * FROM cuisines ORDER BY name;

/* final sorting order rules after testing in ascending order (a-z)
1. NULL values
2. Spaces
3. Special characters
4. Digits
5. Uppercase characters
6. Lowercase characters
*/

UPDATE restaurants SET email = NULL WHERE restaurantId = 2;
-- WHERE do NULLs appear when sorting a column with some null values?
SELECT * FROM restaurants ORDER BY email;

-- upper before lower?
INSERT INTO cuisines (name) VALUES ('mexican');

-- spaces before alpha?
INSERT INTO cuisines (name) VALUES ('   Mexican');

-- sorting practice
-- 1. customers by first name
SELECT * FROM customers ORDER BY firstName;

-- 2. List products by price, lowest to highest
SELECT * FROM products ORDER BY price;

-- 3. List products by price, highest to lowest
SELECT * FROM products ORDER BY price DESC;

-- 4. List drivers, first by lastName, then firstName
SELECT * FROM drivers ORDER BY lastName, firstName;

-- 5. additional sorting examples
-- Jamari: restaurants by price range
SELECT * FROM restaurants ORDER BY priceRange; 

-- Jamie: restaurants by category
SELECT * FROM restaurants ORDER BY category;

-- Jamie: restaurants by address
SELECT * FROM restaurants ORDER BY address;

-- GROUPING function examples
-- 1. average product price.  use an alias as a friendly column name instead for readability
SELECT AVG(price) AS averagePrice FROM products;

-- 2. cheapest restaurant
SELECT MIN(priceRange) AS cheapest, name FROM restaurants GROUP BY name HAVING cheapest < 3 ;

-- 3. most expensive product
SELECT name, MAX(price) AS mostExpensive FROM products GROUP BY name ORDER BY mostExpensive DESC LIMIT 1;

-- 4. how many drivers have a Mazda 3
SELECT COUNT(vehicle) AS driverCount FROM drivers WHERE vehicle = 'Mazda 3';

-- GROUPING practice
-- 1. How many drivers have a Honda?
SELECT COUNT(vehicle) AS driverCount 
FROM drivers
WHERE vehicle LIKE '%Honda%';

-- confirm answer
SELECT * FROM drivers WHERE vehicle LIKE '%Honda%';

-- 2. How many restaurants are in each category?
SELECT category, COUNT(category) AS restaurantCount FROM restaurants GROUP BY category;

-- 3. How many orders are there for each restaurant?
SELECT restaurant, COUNT(orderId) AS orderCount 
FROM orders 
GROUP BY restaurant;

-- 4. What is the total revenue for each restaurant?
SELECT restaurant, SUM(total) as totalRevenue FROM orders GROUP BY restaurant;

-- 4b. What is the total revenue for each restaurant, from highest earning restaurant to lowest?
SELECT restaurant, SUM(total) as totalRevenue FROM orders GROUP BY restaurant ORDER BY totalRevenue DESC;

-- 5. The most recent order?
SELECT MAX(orderDate) AS mostRecent, orderId FROM Orders GROUP BY orderId LIMIT 1;

-- HAVING practice - using filters on GROUPS
-- 1. Total number of orders per restaurant where the total number of orders is more than 3 
SELECT restaurant, COUNT(orderId) AS orderCount 
FROM orders 
GROUP BY restaurant
HAVING orderCount > 3;

-- 2. Restaurants that have an average order total above $40
SELECT restaurant, COUNT(orderId) AS orderCount, AVG(total) AS averageOrder 
FROM orders
GROUP BY restaurant
HAVING averageOrder > 40;
    
-- 3. Restaurants with more than 2 orders, but only for orders placed after October 10, 2024. Show the count of orders for each restaurant that meets these criteria. 
SELECT restaurant, COUNT(orderId) AS orderCount
FROM orders
WHERE orderDate > '2024-10-10'
GROUP BY restaurant
HAVING orderCount > 2;

-- 4. Restaurants whose total sales (sum of all order totals) exceed $200
SELECT restaurant, SUM(total) AS totalSales
FROM orders
GROUP BY restaurant
HAVING totalSales > 200;

-- 5. Restaurants that have placed between 2 and 5 orders 
SELECT restaurant, COUNT(orderId) AS orderCount
FROM orders
GROUP BY restaurant
HAVING orderCount BETWEEN 2 AND 5;