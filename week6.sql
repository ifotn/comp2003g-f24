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
 
