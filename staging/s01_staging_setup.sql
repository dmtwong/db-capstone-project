USE littleLemonProject;
DROP TABLE IF EXISTS Staging_Raw_Data;

CREATE TABLE Staging_Raw_Data (    
    record_id INT, -- likely surrogate     
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
)