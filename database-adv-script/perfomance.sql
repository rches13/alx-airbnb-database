-- Initial Query: Retrieve all confirmed bookings with user, property, and payment details
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
    Payment AS pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed' AND b.start_date >= '2025-01-01';

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
    Payment AS pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed' AND b.start_date >= '2025-01-01';

-- Refactored Query: Optimize by using LEFT JOIN for Payment, limiting columns, and keeping WHERE clause
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
    Payment AS pay ON b.booking_id = pay.booking_id
WHERE 
    b.status = 'confirmed' AND b.start_date >= '2025-01-01';