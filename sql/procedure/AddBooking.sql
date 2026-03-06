USE littlelemonproject;
DESC Bookings;
drop procedure if exists AddBooking;


DELIMITER //
CREATE PROCEDURE AddBooking(IN in_booking_id INT, IN in_cust_id varchar(11), IN in_booking_date DATE, IN in_table_number INT)
BEGIN
    DECLARE count_book_exists INT DEFAULT 0;
    
    START TRANSACTION;
    
    INSERT INTO Bookings(booking_id, booking_date, table_number, booking_status, cust_id) # booking_status: enum with default  
    VALUES (in_booking_id, in_booking_date, in_table_number, 'Confirmed', in_cust_id); 

    SELECT COUNT(*) INTO count_book_exists
    FROM Bookings
    WHERE booking_date = in_booking_date AND table_number = in_table_number AND booking_status in ('Pending', 'Confirmed');
    IF count_book_exists > 1 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', in_table_number, ' not available - new booking cancelled') AS 'Confirmation';
    ELSE
        COMMIT;
        SELECT 'New booking added' AS 'Confirmation';
    END IF;

END //

DELIMITER ;