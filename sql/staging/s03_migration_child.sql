-- SET SQL_SAFE_UPDATES = 0;
-- SET FOREIGN_KEY_CHECKS = 0;

INSERT IGNORE INTO Menus (
cuisine, menuItems_id) SELECT DISTINCT 
    TRIM(s.Cuisine_Name), 
    mi.menuItems_id
FROM Staging_Raw_Data s
JOIN MenuItems mi ON 
    TRIM(s.Course_Name) = mi.course AND 
    TRIM(s.Starter_Name) = mi.starter AND 
    TRIM(s.Desert_Name) = mi.desert AND 
    TRIM(s.Drink) = mi.drink AND 
    TRIM(s.Sides) = mi.sides;

INSERT INTO Orders (
	order_id_pk, 
    OrderID, OrderDate, Quantity, Cost, Sales, 
    Discount, DeliveryCost, City, Country, 
    PostalCode, CountryCode, cust_id, menu_id
) SELECT
	s.record_id,
    TRIM(s.Order_ID),
    CAST(s.Order_Date AS DATE),   
    CAST(s.Quantity AS UNSIGNED),
    CAST(s.Cost AS DECIMAL(10,2)),
    CAST(s.Sales AS DECIMAL(10,2)),
    CAST(s.Discount AS DECIMAL(10,2)),
    CAST(s.Delivery_Cost AS DECIMAL(10,2)),
    TRIM(s.City),
    TRIM(s.Country),
    TRIM(s.Postal_Code),
    TRIM(s.Country_Code),
    TRIM(s.Customer_ID),         
    m.menu_id                    
FROM Staging_Raw_Data s
JOIN MenuItems mi ON 
    TRIM(s.Course_Name) = mi.course AND 
    TRIM(s.Starter_Name) = mi.starter AND 
    TRIM(s.Desert_Name) = mi.desert AND 
    TRIM(s.Drink) = mi.drink AND 
    TRIM(s.Sides) = mi.sides
JOIN Menus m ON 
    TRIM(s.Cuisine_Name) = m.cuisine AND 
    mi.menuItems_id = m.menuItems_id;

INSERT INTO OrderDeliveryStatus (delivery_date, delivery_status, order_id_pk)
SELECT 
    CAST(Delivery_Date AS DATE),
    'Delivered', 
    record_id    
FROM Staging_Raw_Data;

select count(*)
from menus;

select count(*)
from orders;

select count(*)
from OrderDeliveryStatus;

select *
from menus
limit 1;

select *
from orders
-- order by course, starter, desert;
where OrderID = '54-366-6861'
limit 5;

select *
from OrderDeliveryStatus
limit 5;

select *
from orderdeliverystatus
-- order by course, starter, desert;
where order_id_pk in (1, 1001, 2001, 3001, 4001)
-- limit 5;