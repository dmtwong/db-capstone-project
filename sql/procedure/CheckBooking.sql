/*
Task 2
For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.
The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.
The output of your procedure should be similar to the following screenshot:
*/
USE littlelemonproject;
Describe bookings;

-- SELECT * FROM Bookings;
drop procedure if exists CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookingDt DATE, IN tableNum INT)
BEGIN
    DECLARE tbl_status VARCHAR(50);   
    IF EXISTS (
        SELECT 1 FROM bookings 
        WHERE booking_date = bookingDt 
        AND table_number = tableNum 
        AND booking_status IN ('Pending', 'Confirmed')
    ) THEN
        SET tbl_status = CONCAT('Table ', tableNum, ' is already onhold/reserved.');
    ELSE
        SET tbl_status = CONCAT('Table ', tableNum, ' is available.');
    END IF;
    
    SELECT tbl_status AS 'Booking Status Check';
END //

DELIMITER ;

/*
SELECT * from bookings order by booking_date;
call CheckBooking('2022-11-12', 3);
call CheckBooking('2022-11-12', 4);
*/