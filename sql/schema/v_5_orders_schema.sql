-- select(df_1, `Order ID`) %>% mutate(n = nchar(`Order ID`)) %>% count(n) 21000 count of 11 
-- select(df_1, `Postal Code`) %>% mutate(n = nchar(`Postal Code`)) %>% count(n) # from 5 to 19
-- select(df_1, `Country Code`) %>% mutate(n = nchar(`Country Code`)) %>% count(n) 21000 count of 2
-- group_by(df_1, `Order ID`) %>% summarise(distinct_count = n_distinct(`Delivery Date`)) %>% arrange(desc(distinct_count)) only has 1 de date for each order

CREATE TABLE Orders (
	order_id_pk INT PRIMARY KEY AUTO_INCREMENT,
    OrderID VARCHAR(11),
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Cost DECIMAL(10, 2),          
    Sales DECIMAL(10, 2),         
    Discount DECIMAL(10, 2),      
    DeliveryCost DECIMAL(10, 2),  
    City VARCHAR(50),             
    Country VARCHAR(50),          
    PostalCode VARCHAR(25),       # from 5 to 19
    CountryCode VARCHAR(2),       
    cust_id VARCHAR(11) NOT NULL,
    menu_id INT NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES cust(cust_id),
    FOREIGN KEY (menu_id) REFERENCES menus(menu_id));

/*
Table 1: Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)
Table 2 (No data): Staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name, job_role, phone, email, salary 
Table 3: MenuItems (menuItems_id INT PRIMARY KEY AUTO_INCREMENT, course, starter, desert, drink, sides)
TABLE 4: Menus (menu_id INT PRIMARY KEY AUTO_INCREMENT, cuisine, menuItems_id (FK to MenuItems) 

 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "Customer ID"   "Customer Name" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost" "Course Name"   "Cuisine Name"  "Starter Name"  "Desert Name"   "Drink"         "Sides"
after Cust, Staff (irre), MenuItems, and Menus
 [1] "Row Number"        "Delivery Date"        
*/