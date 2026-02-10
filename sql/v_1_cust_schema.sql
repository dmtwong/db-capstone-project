CREATE DATABASE IF NOT exists littleLemonProject; 
USE littleLemonProject;
DROP TABLE if exists Cust; 

CREATE TABLE Cust(
    cust_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) NULL, 
    address VARCHAR(255) NULL,       
    visits_cnt INT DEFAULT 0,
    isBook TINYINT DEFAULT 0,
    tot_spent DECIMAL(8, 2) DEFAULT 0.00
);