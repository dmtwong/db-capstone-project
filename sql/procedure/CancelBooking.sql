DROP procedure if exists CancelBooking; 

DELIMITER //
CREATE PROCEDURE CancelBooking(IN in_booking_id INT)
BEGIN
	DECLARE curr_count INT DEFAULT 0;
    # DECLARE curr_booking_id INT DEFAULT in_booking_id; 
    
    SELECT COUNT(*) FROM Bookings WHERE booking_id = in_booking_id INTO curr_count;
    
    IF curr_count = 1 THEN
		DELETE FROM Bookings 
        WHERE booking_id = in_booking_id;
        COMMIT;
        SELECT CONCAT('Booking ', in_booking_id, ' canceled') AS 'Confirmation';
	ELSE 
		SELECT CONCAT('Cancel Failed: Booking ID ', in_booking_id, ' does not exist') AS 'Confirmation';
	END IF;
END //

DELIMITER ;

