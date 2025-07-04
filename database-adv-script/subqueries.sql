-- Write a query to find all properties where
-- the average rating is greater than 4.0 using a subquery.

SELECT * FROM Property RIGHT JOIN Review ON Property.property_id=Review.property_id
WHERE (SELECT AVG(Review.rating)) > 4.0;

-- Write a correlated subquery to find
-- users who have made more than 3 bookings.

SELECT first_name, COUNT(B.booking_id)
FROM User
INNER JOIN Booking B ON User.user_id = B.user_id
GROUP BY User.user_id
HAVING COUNT(B.booking_id) >= 3;
