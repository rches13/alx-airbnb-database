-- Index on Booking.user_id to optimize JOINs and WHERE clauses filtering by user
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index on Booking.start_date to optimize date range queries
CREATE INDEX idx_booking_start_date ON Booking (start_date);

-- Index on Booking.end_date to optimize date range queries
CREATE INDEX idx_booking_end_date ON Booking (end_date);

-- Index on Property.host_id to optimize queries filtering properties by host
CREATE INDEX idx_property_host_id ON Property (host_id);