CREATE DATABASE comp2003g;

USE comp2003g;

CREATE TABLE restaurants (
	name VARCHAR(50),
    address VARCHAR(255),
    priceRange INT,
    logo BLOB,
    email VARCHAR(50)
);

DROP TABLE restaurants;

CREATE TABLE restaurants (
	name VARCHAR(50),
    address VARCHAR(255),
    priceRange INT,
    logo BLOB,
    email VARCHAR(50),
    phone CHAR(10)
);

INSERT INTO restaurants
(name, address, priceRange, email, phone) VALUES 
('The First Class', '1 Georgian Dr', 1, 'tfc@georgiancollege.ca', '7057281968');

/*  Sue Student 123456
Joe Blow 345678 */

