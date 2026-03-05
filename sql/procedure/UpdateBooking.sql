USE littlelemonproject;
drop procedure if exists UpdateBooking;

# DESC Bookings;

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN in_booking_id INT, IN in_booking_date DATE)
BEGIN
    DECLARE table_num INT;
    DECLARE curr_count INT DEFAULT 0;

    START TRANSACTION;
    -- 1. Identify which table this booking for
    SELECT table_number INTO table_num 
    FROM Bookings 
    WHERE booking_id = in_booking_id;
    -- 2. Check if that table is already occupied on the NEW date
    SELECT COUNT(*) INTO curr_count
    FROM Bookings
    WHERE booking_date = in_booking_date 
      AND table_number = table_num;
      # AND booking_id <> b_id; -- UPDATE: The task require showcase "update" so can't use insert before checking 
    -- 3. Conditional Logic
    IF curr_count > 0 THEN
        -- If someone else has the table on the new date, cancel the update
        ROLLBACK;
        SELECT CONCAT('Update Failed: Table ', table_num, ' is already booked on ', in_booking_date) AS 'Confirmation';
    ELSE
        -- If available, apply the update
        UPDATE Bookings 
        SET booking_date = in_booking_date WHERE booking_id = in_booking_id;        
        COMMIT;
        SELECT CONCAT('Booking ', in_booking_id, ' successfully updated to ', in_booking_date) AS 'Confirmation';
    END IF;
END //

DELIMITER ;