-- Seed the Database for an Airbnb-like Application

-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
    ('a1b2c3d4-e5f6-7890-1234-567890abcdef', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+15551234567', 'guest'),
    ('b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+15559876543', 'host'),
    ('c3d4e5f6-a7b8-9012-3456-7890abcdef2', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', '+15552468135', 'guest'),
    ('d4e5f6a7-b8c9-0123-4567-890abcdef3', 'Bob', 'Williams', 'bob.williams@example.com', 'hashed_password_4', '+15557890123', 'host'),
    ('e5f6a7b8-c9d0-1234-5678-90abcdef41', 'Sarah', 'Brown', 'sarah.brown@example.com', 'hashed_password_5', '+15553691470', 'admin');

-- Insert sample data into the Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
    ('p1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Cozy Apartment in Downtown', 'A beautiful apartment in the heart of the city.', '123 Main St, Anytown, USA', 100.00),
    ('p2c3d4e5-f6a7-8901-2345-67890abcdef2', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Luxury Villa with Ocean View', 'A stunning villa with breathtaking ocean views.', '456 Ocean Blvd, Seaside, USA', 250.00),
    ('p3d4e5f6-a7b8-9012-3456-7890abcdef3', 'd4e5f6a7-b8c9-0123-4567-890abcdef3', 'Rustic Cabin in the Mountains', 'A charming cabin nestled in the mountains.', '789 Mountain Rd, Hilltop, USA', 150.00),
    ('p4e5f6a7-b8c9-0123-4567-890abcdef4', 'd4e5f6a7-b8c9-0123-4567-890abcdef3', 'Spacious Loft in Art District', 'A modern and spacious loft in the vibrant art district.', '234 Art St, Cityville, USA', 120.00),
    ('p5f6a7b8-c9d0-1234-567890abcdef5', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Beachfront Condo', 'A beautiful condo right on the beach.', '987 Beach Ave, Coasttown, USA', 200.00);

-- Insert sample data into the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
    ('b1b2c3d4-e5f6-7890-1234-567890abcdef', 'p1b2c3d4-e5f6-7890-1234-567890abcdef', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-01-15', '2024-01-20', 500.00, 'confirmed'),
    ('b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'p2c3d4e5-f6a7-8901-2345-67890abcdef2', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', '2024-02-01', '2024-02-08', 1750.00, 'confirmed'),
    ('b3d4e5f6-a7b8-9012-3456-7890abcdef2', 'p3d4e5f6-a7b8-9012-3456-7890abcdef3', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-03-01', '2024-03-05', 600.00, 'canceled'),
    ('b4e5f6a7-b8c9-0123-4567-890abcdef3', 'p4e5f6a7-b8c9-0123-4567-890abcdef4', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', '2024-04-10', '2024-04-17', 840.00, 'pending'),
     ('b5f6a7b8-c9d0-1234-567890abcdef4', 'p1b2c3d4-e5f6-7890-1234-567890abcdef', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', '2024-05-20', '2024-05-25', 500.00, 'confirmed');

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
    ('pa1b2c3d4-e5f6-7890-1234-567890abcdef', 'b1b2c3d4-e5f6-7890-1234-567890abcdef', 500.00, 'credit_card'),
    ('pa2c3d4e5-f6a7-8901-2345-67890abcdef1', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 1750.00, 'paypal'),
    ('pa3d4e5f6-a7b8-9012-3456-7890abcdef2', 'b3d4e5f6-a7b8-9012-3456-7890abcdef2', 600.00, 'credit_card'),
    ('pa4e5f6a7-b8c9-0123-4567-890abcdef3', 'b4e5f6a7-b8c9-0123-4567-890abcdef3', 840.00, 'stripe'),
    ('pa5f6a7b8-c9d0-1234-567890abcdef4', 'b5f6a7b8-c9d0-1234-567890abcdef4', 500.00, 'paypal');

-- Insert sample data into the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
    ('r1b2c3d4-e5f6-7890-1234-567890abcdef', 'p1b2c3d4-e5f6-7890-1234-567890abcdef', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Great location and very clean apartment.'),
    ('r2c3d4e5-f6a7-8901-2345-67890abcdef1', 'p2c3d4e5-f6a7-8901-2345-67890abcdef2', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', 4, 'Beautiful villa, but a bit far from the city center.'),
    ('r3d4e5f6-a7b8-9012-3456-7890abcdef2', 'p1b2c3d4-e5f6-7890-1234-567890abcdef', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Excellent stay.  Highly recommended!'),
    ('r4e5f6a7-b8c9-0123-4567-890abcdef3', 'p3d4e5f6-a7b8-9012-3456-7890abcdef3', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', 3, 'The cabin was cozy, but could use some updates.'),
    ('r5f6a7b8-c9d0-1234-567890abcdef4', 'p5f6a7b8-c9d0-1234-567890abcdef5', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 5, 'Amazing view and great host.');

-- Insert sample data into the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
    ('m1b2c3d4-e5f6-7890-1234-567890abcdef', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Hi Jane, I have a question about the apartment.', '2024-01-10 10:00:00'),
    ('m2c3d4e5-f6a7-8901-2345-67890abcdef1', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'Sure John, what is your question?', '2024-01-10 10:15:00'),
    ('m3d4e5f6-a7b8-9012-3456-7890abcdef2', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', 'd4e5f6a7-b8c9-0123-4567-890abcdef3', 'We are looking forward to our stay at the cabin!', '2024-02-20 14:00:00'),
    ('m4e5f6a7-b8c9-0123-4567-890abcdef3', 'd4e5f6a7-b8c9-0123-4567-890abcdef3', 'c3d4e5f6-a7b8-9012-3456-7890abcdef2', 'Great! We are excited to host you.', '2024-02-20 15:30:00'),
    ('m5f6a7b8-c9d0-1234-567890abcdef4', 'a1b2c3d4-e5f6-7890-1234-567890abcdef', 'b2c3d4e5-f6a7-8901-2345-67890abcdef1', 'Just booked the beachfront condo!', '2024-05-18 09:00:00');
