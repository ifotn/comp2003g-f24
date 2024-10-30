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