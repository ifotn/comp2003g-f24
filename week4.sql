USE comp2003g;

/* products table */
CREATE TABLE products (
	productId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(50) NOT NULL,
    price DEC(5,2) NOT NULL,
    description VARCHAR(300)
);

/* INSERTs w/PK enabled */
INSERT INTO products
(name, price, description)
VALUES ('Wings', 12.99, 'Saucy BBQ wings');

SELECT * FROM products;

INSERT INTO products
(name, price, description)
VALUES
('Hamburger', 14.99, 'Angus w/cheese, bacon & lettuce'),
('Pizza', 3.00, 'Olive & anchovy');

/* try manually assign productId => this works but not recommended */
INSERT INTO products
(productId, name, price, description)
VALUES
(5, 'Sushi', 15.00, 'Extremely High Quality Vegetarian Roll w/Caviar');

/* manually try existing productId */
INSERT INTO products
(productId, name, price, description)
VALUES
(5, 'Fish Tacos', 12.99, 'Grilled Mahi Mahi on corn tortillas');

INSERT INTO products
(name, price, description)
VALUES ('Veggie Hash', 17.99, 'Shredded veggies w/poached eggs & cheese');

DELETE FROM products WHERE productId = 6;

/* add PK column to restaurants */
ALTER TABLE restaurants
ADD COLUMN restaurantId INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

INSERT INTO restaurants 
(name, address, phone, category)
VALUES
('Mexican House', '24 Maple Ave', '7057267774', 'Mexican');

SELECT * FROM restaurants;

DELETE FROM restaurants WHERE restaurantId = 10 OR restaurantId = 11;
