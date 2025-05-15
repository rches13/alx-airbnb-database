-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM User AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
-- Ranking properties by number of bookings with RANK and ROW_NUMBER
SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number
FROM 
    Property AS p
LEFT JOIN 
    Booking AS b ON p.property_id = b.property_id
GROUP BY 
    p.property_id,
    p.name
ORDER BY 
    booking_count DESC;
