USE comp2003g;

-- try a 2 table query without a join
-- this returns a Cartesian product: each record in 1 table is combined with each record in the other
-- 25 orders / 9 restaurants => 225 results (9 x 25)
SELECT orders.*, restaurants.*
FROM orders, restaurants;

-- check how many orders and restaurants there actually are
SELECT * FROM orders;
SELECT * FROM restaurants;

-- rewrite using a JOIN to specify exactly how orders and restaurants are connected
-- FK in orders equals PK in parent
SELECT orders.*, restaurants.*
FROM orders
INNER JOIN restaurants ON orders.restaurantId = restaurants.restaurantId;

-- reverse order of tables in same query
-- this works the same with INNER JOIN; order of tables doesn't matter
SELECT orders.*, restaurants.*
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId;

-- extend to 3 tables, adding driver name
SELECT orderId, orderDate, total, name AS restaurant, firstName, lastName
FROM restaurants
INNER JOIN orders ON restaurants.restaurantId = orders.restaurantId
INNER JOIN drivers ON orders.driverId = drivers.driverId;


