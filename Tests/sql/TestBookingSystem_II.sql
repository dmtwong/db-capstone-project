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
CALL AddBooking(7, '98-765-4321', '2022-10-10', 5); -- Third one: Fails (Rollback) 
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

# 2) Testing for UpdateBooking: (Recap) UpdateBooking(IN in_booking_id INT, IN in_booking_date DATE)
SELECT * FROM Bookings;
-- TEST CASE on records created from above test cases (after case 1 and 4 for addBooking): 
-- UPDATE Booking on a fail case (exist of booking for same table on new date) 
-- UPDATE Booking on two succeed case (new date of booking has no conflits) 
CALL UpdateBooking(8, '2022-10-11'); -- First one: Update Fails (Rollback) 
SELECT * FROM Bookings WHERE booking_date = '2022-10-11';
SELECT * FROM Bookings WHERE booking_id = 8;
SELECT * FROM Bookings WHERE booking_date = '2022-10-12';
CALL UpdateBooking(8, '2022-10-12'); -- Second: Update Success (Commit)
SELECT * FROM Bookings WHERE booking_id = 8;
SELECT * FROM Bookings WHERE booking_date = '2022-10-12';

SELECT * FROM Bookings WHERE booking_date = '2022-11-12';
CALL UpdateBooking(8, '2022-11-12'); -- Third: Update Success (Commit)
SELECT * FROM Bookings WHERE booking_id = 8;
SELECT * FROM Bookings WHERE booking_date = '2022-11-12';

# 3) Testing for CancelBooking: (Recap) CancelBooking(IN in_booking_id INT)
-- TEST CASE on records created and then updated following scuccessfully runned above test cases:
-- Cancel Booking on 2 succeed case and 1 fail case (exist of booking for same table on new date) 
-- UPDATE Booking on two succeed case (new date of booking has no conflits) 
SELECT * FROM Bookings WHERE booking_id in (5,8);
CALL CancelBooking(8); # Case 1: Expect to be succeed

SELECT * FROM Bookings WHERE booking_id in (5,8);
CALL CancelBooking(5); # Case 2: Expect to be succeed
SELECT * FROM Bookings WHERE booking_id in (5,8);

SELECT COUNT(*) FROM Bookings; # This number should remain the same after the running the next test case
CALL CancelBooking(8); # Case : Expect to be fail; double cancel not allowed but affect no other records
SELECT COUNT(*) FROM Bookings; # This number should remain the same after the running the next test case

-- clean up cust last (but not least)
SELECT * FROM cust WHERE cust_id in ('99-999-9999','98-765-4321');
DELETE FROM cust WHERE cust_id in ('99-999-9999','98-765-4321');
SELECT * FROM cust WHERE cust_id in ('99-999-9999','98-765-4321');
