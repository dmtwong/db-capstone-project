# SETUP:
USE littlelemonproject;

DESC cust;
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT; #Ensure there exist no cust record with such pk values
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '98-765-4321') AS COUNT; 
-- SETUP: cust_id is FK so it is required in the CUST table
INSERT INTO cust(cust_id, cust_name) VALUES ('99-999-9999', 'Test user John Doe'); 
INSERT INTO cust(cust_id, cust_name) VALUES ('98-765-4321', 'Test user Jane Doe'); 
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT;
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '98-765-4321') AS COUNT;
DESC Bookings;
SELECT * FROM Bookings;
-- the actual test lies below:

# 1) Testing for AddBooking: (Recap) AddBooking(IN bookingID INT, IN custID varchar(11), IN bookingDt DATE, IN tableNum INT)
-- TEST CASE: Double Booking
CALL AddBooking(5, '99-999-9999', '2022-10-10', 1); -- First one: Success (Commit)
CALL AddBooking(6, '98-765-4321', '2022-10-10', 1); -- Second one: Fails (Rollback)
CALL AddBooking(7, '98-765-4321', '2022-10-10', 5); -- Third one: Still Fails (Rollback) 
CALL AddBooking(8, '98-765-4321', '2022-10-10', 2); -- Fouth one: Success (Commit)

-- VERIFICATION
SELECT * FROM Bookings;
-- This should only return 1 row. If the add failed for case 1, you'd see 0. If the Rollback or second case failed, you'd see 2.
SELECT COUNT(*) FROM Bookings WHERE booking_date = '2022-10-10' AND table_number = 1;
SELECT * FROM Bookings WHERE booking_date = '2022-10-10' AND table_number = 1;

-- This should only return 1 row. If the Rollback for case 3 failed, you'd see 2.
SELECT * FROM Bookings WHERE booking_date = '2022-10-10' AND table_number = 5;

-- This should only return 1 row. If the add for case 4 failed, you'd see 0.
SELECT * FROM Bookings WHERE booking_date = '2022-10-10' AND table_number = 2;



