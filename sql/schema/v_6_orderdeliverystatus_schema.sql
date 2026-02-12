CREATE TABLE OrderDeliveryStatus (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    delivery_date DATE,
    delivery_status ENUM('Pending', 'Cancelled', 'Delivered') DEFAULT 'Delivered',
    OrderID VARCHAR(20) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)

/*
Table 1: Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)
Table 2 (No data): Staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name, job_role, phone, email, salary 
Table 3: MenuItems (menuItems_id INT PRIMARY KEY AUTO_INCREMENT, course, starter, desert, drink, sides)
TABLE 4: Menus (menu_id INT PRIMARY KEY AUTO_INCREMENT, cuisine, menuItems_id (FK to MenuItems) 
Table 5 Orders (OrderID VARCHAR(11) PRIMARY KEY, OrderDate, Quantity, Cost, Sales, Discount, DeliveryCost, City, 
Country, PostalCode, CountryCode, cust_id FK (Cust), menu_id FK (Menus))

 [1] "Row Number"    "Order ID"      "Order Date"    "Delivery Date" "Customer ID"   "Customer Name" "City"         
 [8] "Country"       "Postal Code"   "Country Code"  "Cost"          "Sales"         "Quantity"      "Discount"     
[15] "Delivery Cost" "Course Name"   "Cuisine Name"  "Starter Name"  "Desert Name"   "Drink"         "Sides"
after Cust, Staff (irre), MenuItems, and Menus
 [1] "Row Number"           
*/