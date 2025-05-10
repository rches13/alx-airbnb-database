## Normalization to 3NF

Based on the Entity-Relationship Diagram (ERD) and the database specification, the database design is already well-structured and largely adheres to 3NF principles.

**1. Review of Current Schema and 3NF Principles**

* **First Normal Form (1NF):**

    * A relation is in 1NF if every attribute is atomic (indivisible).
    * All our entities (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) satisfy 1NF. Attributes like `first_name`, `last_name`, `email`, etc., are all single-valued. There are no repeating groups.

* **Second Normal Form (2NF):**

    * A relation is in 2NF if it is in 1NF and every non-prime attribute is fully functionally dependent on the entire primary key.
    * In simpler terms, if a table has a composite primary key, each non-key attribute must depend on *all* parts of the key, not just some of them.
    * Our current schema generally satisfies 2NF. Most of our tables have single-attribute primary keys (e.g., `user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`), so 2NF is automatically met.

* **Third Normal Form (3NF):**

    * A relation is in 3NF if it is in 2NF and no non-prime attribute is transitively dependent on the primary key.
    * This means that non-key attributes should only depend on the primary key and not on other non-key attributes.

**2. Entity-by-Entity Analysis for 3NF Compliance**

* **User:**

    * `user_id` (PK), `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.
    * All non-key attributes directly depend on `user_id`.
    * **Complies with 3NF.**

* **Property:**

    * `property_id` (PK), `host_id` (FK), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.
    * All non-key attributes directly depend on `property_id`. `host_id` is a foreign key, which is allowed.
    * **Complies with 3NF.**

* **Booking:**

    * `booking_id` (PK), `property_id` (FK), `user_id` (FK), `start_date`, `end_date`, `total_price`, `status`, `created_at`.
    * All non-key attributes directly depend on `booking_id`.
    * **Complies with 3NF.**

* **Payment:**

    * `payment_id` (PK), `booking_id` (FK), `amount`, `payment_date`, `payment_method`.
    * All non-key attributes directly depend on `payment_id`.
    * **Complies with 3NF.**

* **Review:**

    * `review_id` (PK), `property_id` (FK), `user_id` (FK), `rating`, `comment`, `created_at`.
    * All non-key attributes directly depend on `review_id`.
    * **Complies with 3NF.**

* **Message:**

    * `message_id` (PK), `sender_id` (FK), `recipient_id` (FK), `message_body`, `sent_at`.
    * All non-key attributes directly depend on `message_id`.
    * **Complies with 3NF.**

**3. Conclusion**

* The provided database schema is already well-normalized and meets the requirements of 3NF.
* There are no transitive dependencies or partial dependencies identified. Each non-key attribute is directly dependent on the primary key of its respective table.
* Therefore, no further structural changes are needed to achieve 3NF.

