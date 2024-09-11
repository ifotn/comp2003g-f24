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

INSERT INTO restaurants
(name, address, priceRange, email, phone) VALUES 
('The First Class', '1 Georgian Dr', 1, 'tfc@georgiancollege.ca', '7057281968');

/* this should finally work! */
INSERT INTO restaurants
(name, address, priceRange, email, phone, category) VALUES 
('The First Class', '1 Georgian Dr', 1, 'tfc@georgiancollege.ca', '7057281968', 'Pub Food');

DROP TABLE restaurants;

CREATE TABLE restaurants (
	name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    priceRange INT NOT NULL DEFAULT 2,
    logo BLOB,
    email VARCHAR(50),
    phone CHAR(10) NOT NULL,
    category VARCHAR(25) NOT NULL
);

/* test default price range */
INSERT INTO restaurants
(name, address, email, phone, category) VALUES 
('The First Class', '1 Georgian Dr', 'tfc@georgiancollege.ca', '7057281968', 'Pub Food');

/* test case-sensitivity of SQL */
SELECT * FROM restaurants;
select * from restaurants;
SELECT * FROM RESTAURANTS;

INSERT INTO restaurants
(name, address, priceRange, email, phone, category) VALUES
('Sakana House South', '750 Big Bay Point Road', 3, 'south@sakanahouse.com', '7057210888', 'Japanese'),
('Sakana House North', '347 Cundles Road East', 3, 'north@sakanahouse.com', '7057210888', 'Japanese'),
('Taj Bistro', '140 Dunlop Street East', 2, 'food@tajbistro.ca', '7052528257', 'Indian'),
('Crazy Fox Bistro', '135 Bayfield Street', 4, 'yum@thecrazyfoxbistro.com', '7057375000', 'Fine Dining'),
('Side Door Cafe', '89 Bayfield Stree', 4, 'takeout@michaelandmarions.com', '7057211188', 'Fine Dining');

/* use the \ character to escape single quotes inside string values */
INSERT INTO restaurants
(name, address, priceRange, email, phone, category) VALUES
('Donaleigh\'s Public House', '28 Dunlop Street East', 2, 'pints@donaleighs.ca', '7052527333', 'Pub Food');

/* query practice with WHERE clauses */
SELECT * FROM restaurants 
WHERE name = 'Sakana House North';

INSERT INTO restaurants
(name, address, phone, category) VALUES
('Pizzeria Italia', '4 Mulcaster Street', '7055554444', 'Italian');

/* is the query filter case-sensitive? */
SELECT * FROM restaurants 
WHERE name = 'sakana House North';

SELECT * FROM restaurants
WHERE category = 'Fine Dining';

SELECT * FROM restaurants
WHERE category <> 'Fine Dining';

/* all restaurants with an email address */
SELECT * FROM restaurants
WHERE email IS NOT NULL;

/* where clause practice */
SELECT * FROM restaurants WHERE
name = 'Taj Bistro';

SELECT * FROM restaurants WHERE
category = 'Japanese'
AND priceRange = 3;

SELECT * FROM restaurants WHERE
priceRange < 4;

SELECT * FROM restaurants WHERE
name <> 'Crazy Fox Bistro';

SELECT * FROM restaurants WHERE
name != 'Crazy Fox Bistro';

/* LIKE + % is used for partial matches - usually for keyword searches */
SELECT * FROM restaurants WHERE
name LIKE 'S%';

SELECT * FROM restaurants WHERE
priceRange > 1 
AND priceRange < 4;

/* this fails as 2nd condition is missing a column to evaluate */
SELECT * FROM restaurants WHERE
priceRange > 1 AND < 4;

SELECT * FROM restaurants WHERE
priceRange BETWEEN 2 AND 3;

SELECT * FROM restaurants WHERE
address LIKE '%Bayfield Street%';

SELECT * FROM restaurants WHERE
email IS NULL;

