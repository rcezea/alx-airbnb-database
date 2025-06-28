# Entities and Attributes

---

## User
- user_id: Primary Key, UUID, Indexed 
- first_name: VARCHAR, NOT NULL 
- last_name: VARCHAR, NOT NULL 
- email: VARCHAR, UNIQUE, NOT NULL 
- password_hash: VARCHAR, NOT NULL 
- phone_number: VARCHAR, NULL 
- role: ENUM (guest, host, admin), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Property
- property_id: Primary Key, UUID, Indexed
- host_id: Foreign Key, references User(user_id)
- name: VARCHAR, NOT NULL 
- description: TEXT, NOT NULL 
- location: VARCHAR, NOT NULL 
- pricepernight: DECIMAL, NOT NULL 
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

## Booking
- booking_id: Primary Key, UUID, Indexed 
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- start_date: DATE, NOT NULL 
- end_date: DATE, NOT NULL 
- total_price: DECIMAL, NOT NULL 
- status: ENUM (pending, confirmed, canceled), NOT NULL 
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Payment
- payment_id: Primary Key, UUID, Indexed
- booking_id: Foreign Key, references Booking(booking_id)
- amount: DECIMAL, NOT NULL 
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 
- payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

---

## Review
- review_id: Primary Key, UUID, Indexed 
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL 
- comment: TEXT, NOT NULL 
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Message
- message_id: Primary Key, UUID, Indexed 
- sender_id: Foreign Key, references User(user_id)
- recipient_id: Foreign Key, references User(user_id)
- message_body: TEXT, NOT NULL 
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

# Relationships
- User to Message (sender_id, recipient_id): One to Many
- User to Property (host_id): One to Many
- User to Booking (user_id): One to Many
- User to Review (user_id): One to Many
- Property to Booking (property_id): One to Many
- Booking to Payment (payment_id): One to One
- Property to Review (property_id): One to One

---

# ER diagram

[Lucidchart ER Diagram](https://lucid.app/lucidchart/2a5aa36c-9387-4bfa-a0a1-d728b212bfcf/edit?viewport_loc=-1135%2C-1861%2C2134%2C1635%2C0_0&invitationId=inv_1c535b81-34dd-4739-912e-e8d66b59ca8b)