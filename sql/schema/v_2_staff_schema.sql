-- Note that Staff information is mentioned to be maintained in the database system but the sample dataset contain no staff data 
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(255) NOT NULL,
    job_role VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

/*
Cust(cust_id VARCHAR(11) PRIMARY KEY, cust_name, phone, email) 
(to be consider: address VARCHAR(255) NULL, visits_cnt INT DEFAULT 0, isBook TINYINT DEFAULT 0, tot_spent DECIMAL(8, 2) DEFAULT 0.00)

*/
