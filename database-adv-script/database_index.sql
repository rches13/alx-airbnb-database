-- Index on Booking.user_id to optimize JOINs and WHERE clauses filtering by user
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index on Booking.start_date to optimize date range queries
CREATE INDEX idx_booking_start_date ON Booking (start_date);

-- Index on Booking.end_date to optimize date range queries
CREATE INDEX idx_booking_end_date ON Booking (end_date);

-- Index on Property.host_id to optimize queries filtering properties by host
CREATE INDEX idx_property_host_id ON Property (host_id);

-- Performance Test 1: Correlated subquery for users with multiple bookings
-- Before index (run before creating idx_booking_user_id)
EXPLAIN ANALYZE
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM User AS u
WHERE (
    SELECT COUNT(b.booking_id)
    FROM Booking AS b
    WHERE b.user_id = u.user_id
) > 3;

-- After index (run after creating idx_booking_user_id)
EXPLAIN ANALYZE
SELECT u.user_id, u.first_name, u.last_name, u.email
FROM User AS u
WHERE (
    SELECT COUNT(b.booking_id)
    FROM Booking AS b
    WHERE b.user_id = u.user_id
) > 3;

-- Performance Test 2: Date range query for bookings
-- Before index (run before creating idx_booking_start_date, idx_booking_end_date)
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date
FROM Booking b
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';

-- After index (run after creating idx_booking_start_date, idx_booking_end_date)
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date
FROM Booking b
WHERE b.start_date >= '2025-01-01' AND b.end_date <= '2025-12-31';

-- Performance Test 3: Properties by host
-- Before index (run before creating idx_property_host_id)
EXPLAIN ANALYZE
SELECT p.property_id, p.name
FROM Property p
WHERE p.host_id = 'some_uuid';

-- After index (run after creating idx_property_host_id)
EXPLAIN ANALYZE
SELECT p.property_id, p.name
FROM Property p
WHERE p.host_id = 'some_uuid';