-- 36 select(df_1, `Course Name`,  `Starter Name`, `Desert Name`) %>% group_by(`Course Name`,  `Starter Name`, `Desert Name`) %>% count() %>% arrange(`Course Name`)  # 36
-- 36 select(df_1, `Course Name`,  `Starter Name`, `Desert Name`, Drink, Sides) %>% group_by(`Course Name`,  `Starter Name`, `Desert Name`, Drink, Sides) %>% count() %>% arrange(`Course Name`) %>% print(n = 100)
-- 72 select(df_1, `Cuisine Name`, `Course Name`,  `Starter Name`, `Desert Name`, Drink, Sides) %>% group_by(`Cuisine Name`, `Course Name`,  `Starter Name`, `Desert Name`, Drink, Sides) %>% count() %>% arrange(`Course Name`) %>% print(n = 100)
-- drop table MenuItems;

CREATE TABLE MenuItems (
    menuItems_id INT PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(30),
    starter VARCHAR(30),
    desert VARCHAR(30),
    drink VARCHAR(30),
    sides VARCHAR(30)
);

/*
Table 1: Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)
Table 2 (No data): Staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name, job_role, phone, email, salary 

 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "Customer ID"   "Customer Name" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost" "Course Name"   "Cuisine Name"  "Starter Name"  "Desert Name"   "Drink"         "Sides"
after Cust, Staff (irre), and MenuItems
 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost"  "Cuisine Name"  
*/
