# Database Normalization

## Objective

Apply normalization principles and ensure the database schema is in **Third Normal Form (3NF)** by removing redundancy, ensuring dependency on keys, and eliminating transitive dependencies.

---


## Normalization Principles

- **1NF**: All attributes must contain atomic values only.
- **2NF**: Must be in 1NF and have no partial dependency (non-key attributes depend on the whole primary key).
- **3NF**: Must be in 2NF and have no transitive dependency (non-key attributes depend **only** on the primary key).

---

### 🔹 User

- **Primary Key**: `user_id`
- All fields are atomic and fully functionally dependent on the primary key.
- **Complies with 3NF**

---

### 🔹 Property

- **Primary Key**: `property_id`
- `host_id` is a foreign key to User.
- All other attributes directly describe the property and depend on `property_id`.
- **Complies with 3NF**

---

### 🔹 Booking

- **Primary Key**: `booking_id`
- `property_id` and `user_id` are foreign keys.
- `total_price`, `status`, and dates directly relate to the booking instance.
- **Complies with 3NF**

---

### 🔹 Payment

- **Primary Key**: `payment_id`
- `booking_id` is a foreign key; all other fields describe the payment.
- No transitive or partial dependencies.
- **Complies with 3NF**

---

### 🔹 Review

- **Primary Key**: `review_id`
- Foreign keys: `property_id`, `user_id`
- All other fields depend only on `review_id`
