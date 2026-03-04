/*
Task 1
Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 
You can use simple INSERT statements to complete this task.
*/
USE littlelemonproject;
Describe bookings;
/* For existing cust_id, the rest just like the project requested
select *
from cust
limit 4;
*/
truncate Bookings;
INSERT INTO Bookings (booking_id, booking_date, table_number, cust_id)
VALUES 
(1, '2022-10-10', 5, '00-090-3491'),
(2, '2022-11-12', 3, '00-381-6823'),
(3, '2022-10-11', 2, '00-352-9063'),
(4, '2022-10-13', 2, '00-090-3491');

