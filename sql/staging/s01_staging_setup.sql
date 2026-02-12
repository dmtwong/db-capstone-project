USE littleLemonProject;
DROP TABLE IF EXISTS Staging_Raw_Data;

-- SHOW VARIABLES LIKE 'max_allowed_packet';
-- utf8mb4 standard for modern databases because it supports all international characters, symbols, and emojis.
CREATE TABLE Staging_Raw_Data (    
    record_id INT PRIMARY KEY, -- likely surrogate     
    -- Order (v5_orders_schema.sql and v_6_orderdeliverystatus_schema)
    Order_ID VARCHAR(20),       -- OrderID
    Order_Date VARCHAR(50),     
    Delivery_Date VARCHAR(50),      
    -- Customer (v1_cust_schema.sql)
    Customer_ID VARCHAR(20),    -- cust_id, 11, larger just in case
    Customer_Name VARCHAR(100), -- cust_name, 50, same    
    -- Still in Order but may consider Table Address with detail location 
    City VARCHAR(100),          
    Country VARCHAR(100),      
    Postal_Code VARCHAR(50),    
    Country_Code VARCHAR(10),   
    --  Still in Order but can be use to evaluate the business operations, increase precision for decimal
    Cost DECIMAL(12, 4),        
    Sales DECIMAL(12, 4),
    Quantity INT,
    Discount DECIMAL(12, 4),
    Delivery_Cost DECIMAL(12, 4),    
    -- Menu (v3_menuitems_schema.sql and v4_menus_schema.sql)
    Course_Name VARCHAR(100), 
    Cuisine_Name VARCHAR(100),  
    Starter_Name VARCHAR(100),  
    Desert_Name VARCHAR(100),   
    Drink VARCHAR(100),         
    Sides VARCHAR(100)          
) ENGINE=InnoDB DEFAULT CHARSET= utf8mb4; -- utf8mb4_unicode_ci; -- utf8mb4; 

SET GLOBAL local_infile = 1;
-- ALTER TABLE Staging_Raw_Data CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
LOAD DATA LOCAL INFILE 'C:\\Users\\mingt\\Documents\\db-capstone-project\\data\\landing\\database_project_v2.csv'
INTO TABLE Staging_Raw_Data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- Skips the header

SELECT count(*)
FROM staging_raw_data;

SELECT *
FROM Staging_Raw_Data 
WHERE record_id IN (80, 81, 89, 90, 91, 92);

SELECT * 
FROM Staging_Raw_Data
WHERE record_id IN (10, 11, 12, 31, 32, 33, 40, 41, 42, 43); 

SET SQL_SAFE_UPDATES = 0;
UPDATE Staging_Raw_Data 
SET Sales = REPLACE(REPLACE(Sales, '$', ''), ',', '')
WHERE Sales LIKE '%$%' OR Sales LIKE '%,%';

SET SQL_SAFE_UPDATES = 1;
SET GLOBAL local_infile = 0;
