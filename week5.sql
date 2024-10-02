USE comp2003g;

CREATE TABLE cuisines (
cuisineId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(25) NOT NULL);

INSERT INTO cuisines (name)
VALUES 
('Pub Food'),
('Japanese'),
('Fine Dining'),
('Italian'),
('Mexican');

SELECT * FROM cuisines;

-- try shrinking name column length below the size of some existing values
-- this fails as current values exceed the new limit
ALTER TABLE cuisines
MODIFY name VARCHAR(3) NOT NULL;

-- we can grow the column size as all current values still fit
ALTER TABLE cuisines
MODIFY name VARCHAR(30) NOT NULL;

SELECT * FROM customers;

-- ALTER practice using customers table
-- 1. Add a new column named `age` of type `INT` to the table
ALTER TABLE customers
ADD COLUMN age INT NOT NULL;

-- 2. You realize that the `firstName` column is too short to accommodate longer names. Change the data type of the `firstName` column to `VARCHAR(50)`.
ALTER TABLE customers
MODIFY firstName VARCHAR(50) NOT NULL;

-- 3. Rename the `phoneNumber` column in the `customers` table to `phone`.
ALTER TABLE customers
RENAME COLUMN phoneNumber TO phone;

-- 4. Remove the `deleteMe` column from the `customers` table.
ALTER TABLE customers
DROP COLUMN deleteMe;

-- 5. Move the `address` column after the `lastName` column
ALTER TABLE customers
MODIFY COLUMN address VARCHAR(255) AFTER lastName;

-- 5a. fix mistake in 5 solution => make address NOT NULL again
ALTER TABLE customers
MODIFY address VARCHAR(255) NOT NULL;

DESC customers;
