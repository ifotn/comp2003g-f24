/* connect to our db for this class */
USE comp2003g;

DROP TABLE restaurants;

CREATE TABLE restaurants (
	name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    priceRange INT NOT NULL,
    logo BLOB,
    email VARCHAR(50),
    phone CHAR(10) NOT NULL,
    category VARCHAR(25) NOT NULL
);

/* try inserting blank record */
INSERT INTO restaurants (name, address, priceRange, phone, category)
VALUES (NULL, NULL, NULL, NULL, NULL);

INSERT INTO restaurants (name, address, priceRange, phone, category)
VALUES ('TFC', NULL, NULL, NULL, NULL);