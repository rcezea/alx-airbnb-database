-- Write SQL CREATE INDEX commands to create
-- appropriate indexes for those columns

-- User Table Index
CREATE INDEX idx_user ON User(user_id);

-- Property Table Index
CREATE INDEX idx_prop ON Property(property_id);
-- Filter property based on host
CREATE INDEX idx_property_host_id ON Property(host_id);
-- Filter property based on price
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);

-- Booking Table Index
CREATE INDEX idx_book ON Booking(booking_id);
-- For filtering bookings made on property
CREATE INDEX idx_booking_property_id ON Booking(property_id);
-- For filtering booking made by a user
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Payment Table Index
CREATE INDEX idx_pmt ON Payment(payment_id);

-- Review Table Index
CREATE INDEX idx_rev ON Review(review_id);
-- For querying reviews by property
CREATE INDEX idx_review_property_id ON Review(property_id);

-- Message Table Index
CREATE INDEX idx_msg ON Message(message_id);

-- Filtering inbox/sent messages
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);

-- Composite index for paginated inboxes
CREATE INDEX idx_message_recipient_id_msg_id ON Message(recipient_id, message_id);
CREATE INDEX idx_message_sender_id_msg_id ON Message(sender_id, message_id);
