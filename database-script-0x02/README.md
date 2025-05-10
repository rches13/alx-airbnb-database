
# Database Seeding Script for an Airbnb-like Application

This document outlines the purpose and usage of the provided SQL script. This script is designed to populate the database of an Airbnb-like application with sample data for testing and development purposes. It inserts records into the following tables:

-   `User`
-   `Property`
-   `Booking`
-   `Payment`
-   `Review`
-   `Message`

## Purpose

The primary goal of this script is to:

-   Provide realistic sample data for various entities within the application.
-   Facilitate initial testing of application features and functionalities.
-   Offer a starting point for developers to understand the database schema and relationships.

## Usage

To execute this script, you will need a SQL client or tool that can connect to your application's database. Follow these steps:

1.  **Connect to your database:** Ensure that your database server is running and you have the necessary credentials to connect to the database used by your Airbnb-like application.
2.  **Open a SQL client:** Use a tool like MySQL Workbench, pgAdmin, Dbeaver, or any other SQL client compatible with your database system.
3.  **Open the script:** Copy the entire content of the provided SQL script into the query editor of your SQL client.
4.  **Execute the script:** Run the script against your database. This will execute the `INSERT INTO` statements, adding the sample data to the respective tables.

**Important Considerations:**

-   **Database Schema:** This script assumes that the target database already has the tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) created with the appropriate columns and data types. Ensure your database schema matches the structure implied by the `INSERT INTO` statements.
-   **Unique IDs:** The `user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, and `message_id` columns utilize UUIDs (Universally Unique Identifiers). This helps ensure the uniqueness of each record.
-   **Password Hashing:** The `password_hash` column in the `User` table contains placeholder hashed passwords. In a real application, you should never store plain text passwords.
-   **Date and Time Formats:** The script uses the `YYYY-MM-DD` format for dates and `YYYY-MM-DD HH:MM:SS` format for timestamps. Ensure your database is configured to handle these formats correctly.

## Sample Data Overview

Here's a brief overview of the sample data being inserted:

**User Table:**
-   Includes a mix of guests, hosts, and an admin user.
-   Each user has a unique ID, name, email, hashed password, phone number, and role.

**Property Table:**
-   Contains sample listings with different hosts, names, descriptions, locations, and nightly prices.

**Booking Table:**
-   Features several booking records with associations to users and properties.
-   Includes different booking statuses (confirmed, canceled, pending).

**Payment Table:**
-   Stores payment information related to the bookings, including the amount and payment method.

**Review Table:**
-   Provides sample reviews for properties, including ratings and comments from users.

**Message Table:**
-   Includes a few sample messages exchanged between users.

## Next Steps

After successfully executing this script, your database will be populated with sample data. You can then:

-   Start your application and verify that the data is being retrieved and displayed correctly.
-   Use this data to test various features like user authentication, property listings, booking management, payments, reviews, and messaging.
-   Modify or extend the script to add more sample data as needed for specific testing scenarios.