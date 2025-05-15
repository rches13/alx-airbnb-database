-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking AS b
INNER JOIN 
    User AS u ON b.user_id = u.user_id
INNER JOIN 
    Property AS p ON b.property_id = p.property_id
INNER JOIN 
    Payment AS pay ON b.booking_id = pay.booking_id;

-- EXPLAIN for Initial Query
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking AS b
INNER JOIN 
    User AS u ON b.user_id = u.user_id
INNER JOIN 
    Property AS p ON b.property_id = p.property_id
INNER JOIN 
    Payment AS pay ON b.booking_id = pay.booking_id;

-- Refactored Query: Optimize by using LEFT JOIN for Payment and limiting columns
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM 
    Booking AS b
INNER JOIN 
    User AS u ON b.user_id = u.user_id
INNER JOIN 
    Property AS p ON b.property_id = p.property_id
LEFT JOIN 
    Payment AS pay ON b.booking_id = pay.booking_id;