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


