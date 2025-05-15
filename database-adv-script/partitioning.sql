-- Create parent table for Booking (no data, only structure)
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create partitions for Booking by year (2024, 2025, 2026)
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_2026 PARTITION OF Booking
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Create indexes on partitions for query optimization
CREATE INDEX idx_booking_2024_start_date ON Booking_2024 (start_date);
CREATE INDEX idx_booking_2025_start_date ON Booking_2025 (start_date);
CREATE INDEX idx_booking_2026_start_date ON Booking_2026 (start_date);

-- Test Query: Fetch bookings for a specific date range
EXPLAIN ANALYZE
SELECT 
    booking_id,
    start_date,
    end_date,
    total_price,
    status
FROM 
    Booking
WHERE 
    start_date >= '2025-06-01' AND start_date < '2025-09-01';