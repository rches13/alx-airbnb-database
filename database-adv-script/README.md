## AirBnB Database Queries

This project contains SQL queries to demonstrate complex join operations, subquery practices, and data analysis using aggregation and window functions on the AirBnB database.

### Queries

#### Complex Join Queries

1. **INNER JOIN:** Retrieves all bookings along with the users who made them.

   ```sql
   SELECT b.booking_id, b.start_date, b.end_date, b.total_price, b.status, 
          u.user_id, u.first_name, u.last_name, u.email
   FROM Booking AS b
   INNER JOIN User AS u ON b.user_id = u.user_id;
   ```

2. **LEFT JOIN:** Retrieves all properties and their reviews, including those without reviews.

   ```sql
   SELECT p.property_id, p.name, p.location, p.pricepernight, 
          r.review_id, r.rating, r.comment
   FROM Property AS p
   LEFT JOIN Review AS r ON p.property_id = r.property_id
   ORDER BY p.property_id;
   ```

3. **FULL OUTER JOIN:** Retrieves all users and bookings, even if they do not have a match.

   ```sql
   SELECT u.user_id, u.first_name, u.last_name, u.email, 
          b.booking_id, b.start_date, b.end_date, b.total_price, b.status
   FROM User AS u
   FULL OUTER JOIN Booking AS b ON u.user_id = b.user_id;
   ```

#### Subquery Practices

1. **Non-Correlated Subquery:** Finds all properties where the average rating is greater than 4.0.

   ```sql
   SELECT p.property_id, p.name, p.location, p.pricepernight
   FROM Property AS p
   WHERE p.property_id IN (
       SELECT r.property_id
       FROM Review AS r
       GROUP BY r.property_id
       HAVING AVG(r.rating) > 4.0
   );
   ```

2. **Correlated Subquery:** Finds users who have made more than 3 bookings.

   ```sql
   SELECT u.user_id, u.first_name, u.last_name, u.email
   FROM User AS u
   WHERE (
       SELECT COUNT(b.booking_id)
       FROM Booking AS b
       WHERE b.user_id = u.user_id
   ) > 3;
   ```

#### Aggregation and Window Functions

1. **Total Bookings per User:** Finds the total number of bookings made by each user.

   ```sql
   SELECT u.user_id, u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
   FROM User AS u
   LEFT JOIN Booking AS b ON u.user_id = b.user_id
   GROUP BY u.user_id, u.first_name, u.last_name;
   ```

2. **Property Ranking by Bookings:** Ranks properties based on the number of bookings they received.

   ```sql
   SELECT p.property_id, p.name, COUNT(b.booking_id) AS booking_count,
          RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
   FROM Property AS p
   LEFT JOIN Booking AS b ON p.property_id = b.property_id
   GROUP BY p.property_id, p.name;
   ```

### Usage

Run these queries in a PostgreSQL environment to retrieve comprehensive data involving users, properties, bookings, reviews, and their relationships.


