# Database Schema Definition (schema.sql)

This directory contains the `schema.sql` file, which defines the database schema for an Airbnb-like application. The schema is designed to store information about users, properties, bookings, payments, reviews, and messages.

## File Description

* `schema.sql`: This file contains SQL `CREATE TABLE` statements that define the structure of the database. It includes:
    * Table definitions for `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.
    * Data types for each column.
    * Primary key and foreign key constraints to enforce relationships between tables.
    * `NOT NULL`, `UNIQUE`, and `CHECK` constraints to ensure data integrity.
    * Indexes to improve query performance.

## Database Schema Overview

### Entities and Attributes

* **User**
    * `user_id` (UUID, Primary Key)
    * `first_name` (VARCHAR, Not Null)
    * `last_name` (VARCHAR, Not Null)
    * `email` (VARCHAR, Unique, Not Null)
    * `password_hash` (VARCHAR, Not Null)
    * `phone_number` (VARCHAR)
    * `role` (ENUM\['guest', 'host', 'admin'\], Not Null)
    * `created_at` (TIMESTAMP, Default: Current Timestamp)
* **Property**
    * `property_id` (UUID, Primary Key)
    * `host_id` (UUID, Foreign Key referencing `User`)
    * `name` (VARCHAR, Not Null)
    * `description` (TEXT, Not Null)
    * `location` (VARCHAR, Not Null)
    * `pricepernight` (DECIMAL, Not Null)
    * `created_at` (TIMESTAMP, Default: Current Timestamp)
    * `updated_at` (TIMESTAMP, On Update: Current Timestamp)
* **Booking**
    * `booking_id` (UUID, Primary Key)
    * `property_id` (UUID, Foreign Key referencing `Property`)
    * `user_id` (UUID, Foreign Key referencing `User`)
    * `start_date` (DATE, Not Null)
    * `end_date` (DATE, Not Null)
    * `total_price` (DECIMAL, Not Null)
    * `status` (ENUM\['pending', 'confirmed', 'canceled'\], Not Null)
    * `created_at` (TIMESTAMP, Default: Current Timestamp)
* **Payment**
    * `payment_id` (UUID, Primary Key)
    * `booking_id` (UUID, Foreign Key referencing `Booking`)
    * `amount` (DECIMAL, Not Null)
    * `payment_date` (TIMESTAMP, Default: Current Timestamp)
    * `payment_method` (ENUM\['credit\_card', 'paypal', 'stripe'\], Not Null)
* **Review**
    * `review_id` (UUID, Primary Key)
    * `property_id` (UUID, Foreign Key referencing `Property`)
    * `user_id` (UUID, Foreign Key referencing `User`)
    * `rating` (INTEGER, Not Null, Check: 1-5)
    * `comment` (TEXT, Not Null)
    * `created_at` (TIMESTAMP, Default: Current Timestamp)
* **Message**
    * `message_id` (UUID, Primary Key)
    * `sender_id` (UUID, Foreign Key referencing `User`)
    * `recipient_id` (UUID, Foreign Key referencing `User`)
    * `message_body` (TEXT, Not Null)
    * `sent_at` (TIMESTAMP, Default: Current Timestamp)

### Relationships

The database schema defines the following relationships:

* A `User` can host many `Property` records.
* A `User` can make many `Booking` records.
* A `Property` can be associated with many `Booking` records.
* A `Booking` is associated with one `Payment` record.
* A `Property` can have many `Review` records.
* A `User` can write many `Review` records.
* A `User` can send and receive many `Message` records.

### Indexes

For improved query performance, the following indexes are defined:

* `User`: Index on `email`
* `Property`: Index on `host_id`
* `Booking`: Indexes on `property_id` and `user_id`
* `Payment`: Index on `booking_id`
* `Review`: Indexes on `property_id` and `user_id`
* `Message`: Indexes on `sender_id` and `recipient_id`

## Usage

This schema can be used to create the database for an Airbnb-like application using a relational database management system (RDBMS) such as PostgreSQL or MySQL. Execute the `schema.sql` script to create the tables and their relationships.
