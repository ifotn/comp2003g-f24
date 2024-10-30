USE comp2003g;

SELECT * FROM cuisines;
SELECT * FROM restaurants;

-- add new column to store cuisineId
ALTER TABLE restaurants
ADD COLUMN cuisineId INT NOT NULL;

-- update restaurants to set cuisineId based on category values
UPDATE restaurants SET cuisineId = 1 WHERE category = 'Pub Food';
UPDATE restaurants SET cuisineId = 2 WHERE category = 'Japanese';
UPDATE restaurants SET cuisineId = 3 WHERE category = 'Fine Dining';
UPDATE restaurants SET cuisineId = 4 WHERE category = 'Italian';
UPDATE restaurants SET cuisineId = 5 WHERE category = 'Mexican';
UPDATE restaurants SET cuisineId = 6 WHERE category = 'Indian';

-- remove text category column
ALTER TABLE restaurants
DROP COLUMN category;

INSERT INTO restaurants (name, address, priceRange, phone, cuisineId)
VALUES ('Invalid', 'Nowhere', 1, '7050000000', 800);

DELETE FROM restaurants WHERE restaurantId = 12;

-- add FK constraint to cuisineId
ALTER TABLE restaurants
ADD FOREIGN KEY (cuisineId) REFERENCES cuisines(cuisineId);

SELECT * FROM products;

ALTER TABLE products
ADD COLUMN restaurantId INT NOT NULL;

UPDATE products SET restaurantId = 1;

ALTER TABLE products
ADD FOREIGN KEY (restaurantId) REFERENCES restaurants(restaurantId);

ALTER TABLE orders
ADD COLUMN customerId INT NOT NULL,
ADD COLUMN driverId INT;

UPDATE orders SET customerId = 3;

ALTER TABLE orders
ADD FOREIGN KEY (customerId) REFERENCES customers(customerId);

ALTER TABLE orders
ADD COLUMN restaurantId INT NOT NULL;

UPDATE orders SET restaurantId = 2;

ALTER TABLE orders
ADD FOREIGN KEY (restaurantId) REFERENCES restaurants(restaurantId);

ALTER TABLE orders
DROP COLUMN restaurant;

-- create junction between orders & products since they have many to many relationship
CREATE TABLE orderItems
(orderItemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
productId INT NOT NULL,
orderId INT NOT NULL,
quantity INT NOT NULL,
price DECIMAL(6,2) NOT NULL,
FOREIGN KEY (productId) REFERENCES products(productId),
FOREIGN KEY (orderId) REFERENCES orders(orderId));