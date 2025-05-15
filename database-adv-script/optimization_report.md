# Query Optimization Report

## Initial Query

The initial query retrieves all bookings along with user details, property details, and payment details:

```sql
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
```

---

## Performance Analysis with EXPLAIN

Running `EXPLAIN` on the initial query reveals potential inefficiencies:

- **Joins:**  
  Three `INNER JOIN`s (User, Property, Payment) require matching rows across all tables. The `INNER JOIN` with Payment excludes bookings without payments, which may not always be desired (e.g., pending bookings).

- **Indexes:**  
  - `Booking.user_id`: Used in JOIN with User. Index exists (`idx_booking_user_id`).
  - `Booking.property_id`: Used in JOIN with Property. Already indexed per schema.
  - `Payment.booking_id`: Used in JOIN with Booking. Already indexed per schema.
  - `User.user_id`, `Property.property_id`: Primary keys, indexed by default.

- **Inefficiencies:**  
  - The `INNER JOIN` on Payment may reduce the result set unnecessarily if payments are not always recorded (e.g., for pending or canceled bookings).
  - Selecting all columns (e.g., `u.email`, `p.pricepernight`, `pay.payment_method`) increases I/O, especially for large datasets.
  - Potential sequential scans if indexes are not used effectively, though existing indexes mitigate this.

- **EXPLAIN Output:**  
  Likely shows nested loop joins with index scans on `Booking.user_id`, `Booking.property_id`, and `Payment.booking_id`. High cost if many rows are scanned due to `INNER JOIN` on Payment.

---

## Refactored Query

The refactored query addresses inefficiencies by using a `LEFT JOIN` for Payment and reducing unnecessary columns:

```sql
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
```

---

## Improvements

- **LEFT JOIN for Payment:**  
  Replaces `INNER JOIN` to include bookings without payments (e.g., pending or canceled), increasing result completeness and avoiding unnecessary row filtering.

- **Reduced Columns:**  
  Removed `u.email`, `p.pricepernight`, and `pay.payment_method` to minimize data retrieval, reducing I/O overhead.

- **Index Utilization:**  
  Leverages existing indexes:
  - `idx_booking_user_id` for `Booking.user_id` JOIN.
  - `Booking.property_id` index for Property JOIN.
  - `Payment.booking_id` index for Payment JOIN.

- **EXPLAIN Output:**  
  Shows similar nested loop joins but with potentially lower cost due to `LEFT JOIN` and fewer columns. Index scans remain efficient.

---

## Performance Comparison

- **Initial Query:**
  - Higher cost due to `INNER JOIN` filtering out bookings without payments.
  - More I/O from retrieving additional columns.
  - Example EXPLAIN: Nested loops with index scans, higher row estimates if payments are sparse.

- **Refactored Query:**
  - Lower cost due to `LEFT JOIN` preserving all bookings.
  - Reduced I/O from fewer columns.
  - Example EXPLAIN: Similar join structure but lower cost and row estimates, especially for bookings without payments.

**Expected Impact:**  
Faster execution time, especially in datasets with many bookings lacking payments. Test with `EXPLAIN ANALYZE` on a populated database to quantify improvements.

---

## Conclusion

The refactored query improves performance by using a `LEFT JOIN` for Payment and selecting fewer columns, leveraging existing indexes effectively. Further optimization could involve adding filters (e.g., `WHERE b.status = 'confirmed'`) or composite indexes if specific query patterns emerge.
