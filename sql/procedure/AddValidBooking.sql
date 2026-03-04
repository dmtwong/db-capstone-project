/*
For your third and final task, Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction. 
To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  
Use the following guidelines to complete this task:
The procedure should include two input parameters in the form of booking date and table number.
It also requires at least one variable and should begin with a START TRANSACTION statement.
Your INSERT statement must add a new booking record using the input parameter's values.
Use an IF ELSE statement to check if a table is already booked on the given date. 
If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 
The screenshot below is an example of a rollback (cancelled booking), which was enacted because table number 5 is already booked on the specified date.
*/

USE littlelemonproject;
drop procedure if exists AddValidBooking;

/*
IMPORTANT: cust_id Should be one of the input parameter,
to satisfy task requirement simply use a record that already exist in table Cust ideally should create a dummy cust with obvious value 
revised will populate one and then del it at the end

SELECT * FROM CUST WHERE cust_id = '99-999-9999';
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '00-435-7006') AS COUNT;
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT;

Describe bookings;
SELECT * FROM Bookings;
DESC cust;
INSERT INTO cust(cust_id, cust_name) -- It doesn't make sense to take only booking date and table number unless cust_id is generated on the fly  
VALUES ('99-999-9999', 'John Jack'); -- Again, all booking with cust_id '99-999-9999' is seed data as well
SELECT * FROM CUST WHERE cust_id = '99-999-9999';
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT;
*/

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDt DATE, IN tableNum INT)
BEGIN
    DECLARE count_book_exists INT DEFAULT 0;    
    
    START TRANSACTION;
    
    INSERT INTO Bookings(booking_date, table_number, cust_id) -- It doesn't make sense to take only booking date and table number unless cust_id is generated on the fly  
    VALUES (bookingDt, tableNum, '99-999-9999'); -- Again, all booking with cust_id '99-999-9999' is seed data as well

    SELECT COUNT(*) INTO count_book_exists
    FROM Bookings
    WHERE booking_date = bookingDt AND table_number = tableNum AND booking_status in ('Pending', 'Confirmed');
    IF count_book_exists > 1 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNum, ' not available - booking cancelled') AS 'Booking status';
    ELSE
        COMMIT;
        SELECT 'New booking added successfully' AS 'Booking status';
    END IF;

END //

DELIMITER ;

/*
-- recap: call CheckBooking('2022-11-12', 3);
SELECT * FROM Bookings;
call AddValidBooking('2022-10-10', 5);
SELECT * FROM Bookings;
CALL AddValidBooking('2022-12-17', 10);
SELECT * FROM Bookings;
CALL AddValidBooking('2022-12-17', 10);
SELECT * FROM Bookings;

SELECT COUNT(*) FROM CUST;
DELETE FROM Bookings WHERE cust_id = '99-999-9999';
DELETE FROM CUST WHERE cust_id = '99-999-9999';
SELECT COUNT(*) FROM CUST;
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT;
*/