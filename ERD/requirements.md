# Entity-Relationship Diagram (ERD) - Textual Representation

This document provides a textual representation of the Entity-Relationship Diagram (ERD) for the Airbnb Database Project. It outlines the entities, their attributes, and the relationships between them.

## ER Diagram
The Entity-Relationship Diagram (ERD) below provides a visual representation of the database structure:
![ERD](<Entity Relationship Diagram (1).jpg>)

## 1. Entities and Attributes

The following entities and their attributes are defined in the ERD:

### User
* `user_id` (Primary Key, UUID, Indexed)
* `first_name` (VARCHAR, NOT NULL)
* `last_name` (VARCHAR, NOT NULL)
* `email` (VARCHAR, UNIQUE, NOT NULL)
* `password_hash` (VARCHAR, NOT NULL)
* `phone_number` (VARCHAR, NULL)
* `role` (ENUM ('guest', 'host', 'admin'), NOT NULL)
* `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Property
* `property_id` (Primary Key, UUID, Indexed)
* `host_id` (Foreign Key, references User(user_id))
* `name` (VARCHAR, NOT NULL)
* `description` (TEXT, NOT NULL)
* `location` (VARCHAR, NOT NULL)
* `pricepernight` (DECIMAL, NOT NULL)
* `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
* `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### Booking
* `booking_id` (Primary Key, UUID, Indexed)
* `property_id` (Foreign Key, references Property(property_id))
* `user_id` (Foreign Key, references User(user_id))
* `start_date` (DATE, NOT NULL)
* `end_date` (DATE, NOT NULL)
* `total_price` (DECIMAL, NOT NULL)
* `status` (ENUM ('pending', 'confirmed', 'canceled'), NOT NULL)
* `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Payment
* `payment_id` (Primary Key, UUID, Indexed)
* `booking_id` (Foreign Key, references Booking(booking_id))
* `amount` (DECIMAL, NOT NULL)
* `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
* `payment_method` (ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL)

### Review
* `review_id` (Primary Key, UUID, Indexed)
* `property_id` (Foreign Key, references Property(property_id))
* `user_id` (Foreign Key, references User(user_id))
* `rating` (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
* `comment` (TEXT, NOT NULL)
* `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Message
* `message_id` (Primary Key, UUID, Indexed)
* `sender_id` (Foreign Key, references User(user_id))
* `recipient_id` (Foreign Key, references User(user_id))
* `message_body` (TEXT, NOT NULL)
* `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## 2. Relationships Between Entities

The following relationships exist between the entities:

* **User to Property:**
    * A User can have many Properties (if they are a host).
    * A Property is hosted by one User.
    * Relationship Type: One-to-Many (User -> Property)
* **User to Booking:**
    * A User can make many Bookings (as a guest).
    * A Booking is made by one User.
    * Relationship Type: One-to-Many (User -> Booking)
* **Property to Booking:**
    * A Property can have many Bookings.
    * A Booking is for one Property.
    * Relationship Type: One-to-Many (Property -> Booking)
* **Booking to Payment:**
    * A Booking can have one Payment associated with it.
    * A Payment is for one Booking.
    * Relationship Type: One-to-One (Booking -> Payment)
* **Property to Review:**
    * A Property can have many Reviews.
    * A Review is for one Property.
    * Relationship Type: One-to-Many (Property -> Review)
* **User to Review:**
    * A User can write many Reviews.
    * A Review is written by one User.
    * Relationship Type: One-to-Many (User -> Review)
* **User to Message:**
    * A User can send many Messages (as a sender).
    * A Message is sent by one User.
    * Relationship Type: One-to-Many (User -> Message as Sender)
    * A User can receive many Messages (as a recipient).
    * A Message is received by one User.
    * Relationship Type: One-to-Many (User -> Message as Recipient)
