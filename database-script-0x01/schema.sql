-- Write SQL queries to define the database schema (create tables, set constraints).

-- CREATE USER TABLE

CREATE TABLE User (
    user_id VARCHAR(36) PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    email VARCHAR(36) UNIQUE NOT NULL,
    password_hash VARCHAR(36) NOT NULL,
    phone_number VARCHAR(36) NOT NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATE USER TABLE INDEX
CREATE INDEX idx_user ON User(user_id);

-- CREATE PROPERTY TABLE
CREATE TABLE Property (
    property_id VARCHAR(36) PRIMARY KEY,
    host_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (host_id) REFERENCES User(user_id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    location VARCHAR(50) NOT NULL ,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CREATE PROPERTY TABLE INDEX
CREATE INDEX idx_prop ON Property(property_id);

-- CREATE BOOKING TABLE
CREATE TABLE Booking (
    booking_id VARCHAR(36) PRIMARY KEY ,
    property_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    user_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CREATE BOOKING TABLE INDEX
CREATE INDEX idx_book ON Booking(booking_id);

-- CREATE PAYMENT TABLE
CREATE TABLE Payment (
    payment_id VARCHAR(36) PRIMARY KEY,
    booking_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL
);
-- CREATE PAYMENT TABLE INDEX
CREATE INDEX idx_pmt ON Payment(payment_id);

-- CREATE REVIEW TABLE
CREATE TABLE Review (
    review_id VARCHAR(36) PRIMARY KEY ,
    property_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    user_id VARCHAR(36) NOT NULL ,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CREATE REVIEW TABLE INDEX
CREATE INDEX idx_rev ON Review(review_id);
-- CREATE MESSAGE TABLE
    CREATE TABLE Message (
        message_id VARCHAR(36) PRIMARY KEY ,
        sender_id VARCHAR(36) NOT NULL ,
        FOREIGN KEY (sender_id) REFERENCES User(user_id),
        recipient_id VARCHAR(36) NOT NULL,
        FOREIGN KEY (recipient_id) REFERENCES User(user_id),
        message_body VARCHAR(255) NOT NULL,
        sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
-- CREATE MESSAGE TABLE INDEX
CREATE INDEX idx_msg ON Message(message_id);

-- END OF SCRIPT
