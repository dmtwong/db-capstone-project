SET SQL_SAFE_UPDATES = 0;
-- SET FOREIGN_KEY_CHECKS = 0;

INSERT IGNORE INTO Cust (cust_id, cust_name)
SELECT DISTINCT 
    TRIM(Customer_ID), 
    TRIM(Customer_Name)
FROM Staging_Raw_Data;

INSERT IGNORE INTO MenuItems (course, starter, desert, drink, sides)
SELECT DISTINCT 
    TRIM(Course_Name), 
    TRIM(Starter_Name), 
    TRIM(Desert_Name), 
    TRIM(Drink), 
    TRIM(Sides)
FROM Staging_Raw_Data;

select count(*)
from cust;

select count(*)
from menuitems;

select *
from cust
limit 1;

select *
from menuitems
order by course, starter, desert;