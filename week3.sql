/* connect to the comp2003g db */
USE comp2003g;

/* check what's in the db currently */
SELECT * FROM restaurants;

/* insert some dummy data for update/delete practice */
INSERT INTO restaurants (name, address, phone, category) 
VALUES ('Delete Me 1', '1 Bye Bye', '1111111111', 'Leaving Soon'),
('Delete Me 2', '2 Bye Bye', '2222222222', 'Leaving Soon'),
('Delete Me 2', '22 Bye Bye', '2222222222', 'Leaving Soon'),
('Delete Me 3', '3 Bye Bye', '3333333333', 'Leaving Soon'),
('Delete Me 5', '5 Bye Bye', '5555555555', 'Leaving Soon');

/* DELETE practice */
DELETE FROM restaurants WHERE name = 'Delete Me 1';
DELETE FROM restaurants WHERE name LIKE '%2%';
DELETE FROM restaurants WHERE name LIKE 'Delete%' AND address <> '5 Bye Bye';

/* UPDATE practice */
UPDATE restaurants
SET name = 'Mexican House'
WHERE name = 'Delete Me 5';

UPDATE restaurants
SET phone = '7057267774', category = 'Mexican', address = '24 Maple Ave'
WHERE name = 'Mexican House';

SELECT * FROM restaurants
WHERE category = 'Japanese';

UPDATE restaurants
SET priceRange = 4
WHERE category = 'Japanese';

UPDATE restaurants
SET address = '89 Bayfield Street'
WHERE name = 'Side Door Cafe';

