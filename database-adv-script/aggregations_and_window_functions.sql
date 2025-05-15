-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
