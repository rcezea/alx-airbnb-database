-- SQL scripts to populate the database with sample data.

-- Insert sample users into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('b98a90de-dc8b-4a3b-b5d7-35e0a93f1cb2', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('a74c971d-3875-40a1-bfa4-c7051b23210d', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_2', '234-567-8901', 'host'),
('f8e2c4f5-845f-4279-8c63-39cf21b4644a', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password_3', '345-678-9012', 'admin');

-- Insert sample properties into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('12a9d6a0-93c5-4892-bf9d-9ad54f178cfd', 'a74c971d-3875-40a1-bfa4-c7051b23210d', 'Beachside Villa', 'A beautiful villa by the beach with a private pool.', 'Miami, FL', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('e0baf2e1-6b45-4316-bd58-3d84f6b5c572', 'a74c971d-3875-40a1-bfa4-c7051b23210d', 'Mountain Retreat', 'A cozy cabin in the mountains perfect for a weekend getaway.', 'Aspen, CO', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample bookings into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('d6a39a5f-445d-4517-85c3-7ccf5f0cdb77', '12a9d6a0-93c5-4892-bf9d-9ad54f178cfd', 'b98a90de-dc8b-4a3b-b5d7-35e0a93f1cb2', '2023-07-15', '2023-07-20', 1250.00, 'confirmed', CURRENT_TIMESTAMP),
('4fc395b1-3c63-4f02-a74d-6886b02c28ad', 'e0baf2e1-6b45-4316-bd58-3d84f6b5c572', 'b98a90de-dc8b-4a3b-b5d7-35e0a93f1cb2', '2023-08-05', '2023-08-10', 900.00, 'pending', CURRENT_TIMESTAMP),
('2eaa8ff9-4e98-48de-8e39-42f94a4e3f36', '12a9d6a0-93c5-4892-bf9d-9ad54f178cfd', 'f8e2c4f5-845f-4279-8c63-39cf21b4644a', '2023-07-01', '2023-07-05', 1000.00, 'confirmed', CURRENT_TIMESTAMP);

-- Insert sample payments into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('1b2b4f35-c0d5-44b2-93b6-dcb5b9b2e7ea', 'd6a39a5f-445d-4517-85c3-7ccf5f0cdb77', 1250.00, CURRENT_TIMESTAMP, 'credit_card'),
('aa4ff1c1-0710-42e7-8d68-fc0c4b08c81a', '4fc395b1-3c63-4f02-a74d-6886b02c28ad', 900.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample reviews into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('f70a3c6e-5a56-4a2e-9673-df7a540c9d44', '12a9d6a0-93c5-4892-bf9d-9ad54f178cfd', 'b98a90de-dc8b-4a3b-b5d7-35e0a93f1cb2', 5, 'Amazing property! The beach view and private pool made our stay unforgettable.', CURRENT_TIMESTAMP),
('d4d41a9d-3a94-41ad-9737-56a229392319', 'e0baf2e1-6b45-4316-bd58-3d84f6b5c572', 'f8e2c4f5-845f-4279-8c63-39cf21b4644a', 4, 'Very peaceful retreat, perfect for relaxation. Would love to return.', CURRENT_TIMESTAMP);

-- END OF SCRIPT
