-- Write a query to find the total number
-- of bookings made by each user, using
-- the COUNT function and GROUP BY clause.

SELECT first_name, COUNT(B.booking_id)
FROM User
INNER JOIN Booking B ON User.user_id = B.user_id
GROUP BY User.user_id
HAVING COUNT(B.booking_id) >= 3;

-- Use a window function (ROW_NUMBER, RANK)
-- to rank properties based on the total number
-- of bookings they have received.

SELECT name, booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS number
FROM (
    SELECT
        P.name,
        COUNT(B.booking_id) AS booking_count
    FROM Property P
    INNER JOIN Booking B on P.property_id = B.property_id
    GROUP BY P.property_id, P.name
) as PBbc;
