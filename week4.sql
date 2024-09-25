USE comp2003g;

/* products table */
CREATE TABLE products (
	productId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(50) NOT NULL,
    price DEC(5,2) NOT NULL,
    description VARCHAR(300)
);