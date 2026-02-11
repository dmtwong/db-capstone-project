CREATE TABLE Menus (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    cuisine VARCHAR(20),
	menuItems_id INT,
    FOREIGN KEY (menuItems_id) REFERENCES MenuItems(menuItems_id)
);

/*
Table 1: Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)
Table 2 (No data): Staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name, job_role, phone, email, salary 
Table 3: MenuItems (menuItems_id INT PRIMARY KEY AUTO_INCREMENT, course, starter, desert, drink, sides)

 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "Customer ID"   "Customer Name" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost" "Course Name"   "Cuisine Name"  "Starter Name"  "Desert Name"   "Drink"         "Sides"
after Cust, Staff (irre), MenuItems, and Menus
 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost" 
*/