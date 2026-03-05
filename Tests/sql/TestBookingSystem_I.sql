# 1) Testing for CheckBooking 
SELECT * from bookings order by booking_date;
call CheckBooking('2022-11-12', 3); -- Case 1, exist booking on exact date and table: Expect Table 3 is already onhold/reserved.
call CheckBooking('2022-11-12', 4); -- Case 2, exist booking on exact date but not table: Expect Table 4 is available
call CheckBooking('2022-11-13', 3); -- Case 3, exist booking on exact table but not date: Expect Table 3 is available

# 2) Testing for AddValidBooking 
DESC Bookings;
-- SETUP: cust_id is FK so it is required in the CUST table
-- It doesn't make sense to take only booking date and table number without cust_id unless cust_id is generated on the fly  
-- for project purpose populating the seed data for the CUST table first,
DESC cust;
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT; #Ensure there exist no cust record with such pk values
INSERT INTO cust(cust_id, cust_name) 
VALUES ('99-999-9999', 'John Jack'); -- Again, all booking with cust_id '99-999-9999' is seed data as well
SELECT EXISTS(SELECT * FROM CUST WHERE cust_id = '99-999-9999') AS COUNT;
-- the actual test lies below:
SELECT * FROM Bookings;
CALL AddValidBooking('2022-10-10', 5); ## Case 1: Expect booking found and hence print "booking cancelled"
CALL AddValidBooking('2022-12-17', 10); ## Case 2a: Expect booking not found and hence print "booking added" after adding it as record with dummy cust_id
CALL AddValidBooking('2022-12-17', 10); ## Case 2b: Expect after case 2 booking will be found and hence print "booking cancelled" 
SELECT * FROM Bookings;
-- clean up bookings first
DELETE FROM Bookings WHERE cust_id = '99-999-9999';
SELECT * FROM Bookings;

-- clean up cust last (but not least)
SELECT * FROM cust WHERE cust_id = '99-999-9999';
DELETE FROM cust WHERE cust_id = '99-999-9999';
SELECT * FROM cust WHERE cust_id = '99-999-9999';
