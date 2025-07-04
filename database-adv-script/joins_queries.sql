-- Write a query using an INNER JOIN to retrieve
-- all bookings and the respective users who made those bookings.

SELECT * FROM BOOKINGS LEFT JOIN USERS ON BOOKINGS.user_id=USERS.user_id;

-- Write a query using aLEFT JOIN to retrieve
-- all properties and their reviews, including
-- properties that have no reviews.

SELECT * FROM BOOKINGS RIGHT JOIN USERS ON PROPERTY.review_id=REVIEW.user_id;

-- Write a query using a FULL OUTER JOIN to retrieve
-- all users and all bookings, even if the user has
-- no booking or a booking is not linked to a user.

SELECT * FROM BOOKINGS LEFT JOIN USERS ON BOOKINGS.user_id=USERS.user_id
UNION
SELECT * FROM BOOKINGS RIGHT JOIN USERS ON BOOKINGS.user_id=USERS.user_id;
