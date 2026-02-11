-- May consider to have a seperate table for tables

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_date DATE NOT NULL,
    table_number INT NOT NULL,
    booking_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed') DEFAULT 'Pending',
    cust_id VARCHAR(11) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES Cust(cust_id)
)

/*
Table 1: Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)
Table 2 (No data): Staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name, job_role, phone, email, salary 
Table 3: MenuItems (menuItems_id INT PRIMARY KEY AUTO_INCREMENT, course, starter, desert, drink, sides)
TABLE 4: Menus (menu_id INT PRIMARY KEY AUTO_INCREMENT, cuisine, menuItems_id (FK to MenuItems) 
Table 5: Orders (OrderID VARCHAR(11) PRIMARY KEY, OrderDate, Quantity, Cost, Sales, Discount, DeliveryCost, City, 
Country, PostalCode, CountryCode, cust_id FK (Cust), menu_id FK (Menus))
Table 6: OrderDeliveryStatus (delivery_id INT PRIMARY KEY AUTO_INCREMENT, delivery_date, delivery_status, OrderID FK (Orders)
*/