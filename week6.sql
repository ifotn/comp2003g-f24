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

UPDATE restaurants SET email = NULL WHERE restaurantId = 2;
-- WHERE do NULLs appear when sorting a column with some null values?
SELECT * FROM restaurants ORDER BY email;

-- upper before lower?
INSERT INTO cuisines (name) VALUES ('mexican');

-- spaces before alpha?
INSERT INTO cuisines (name) VALUES ('   Mexican');