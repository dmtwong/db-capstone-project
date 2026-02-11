---
title: "readme_databaseProject"
author: "David W."
date: "2026-02-11"
output: 
  html_document: 
    keep_md: true
keep_md: default
---

## Project Overview
A multi-phase project transitioning legacy restaurant booking system to a robust MySQL environment. Given the request, several aspects will be considered when engaging with this project:

1. Maintaining consistency when updating code.

2. Ensuring there are sufficient structures in place to save, alter and query data. 

3. Ensuring there is a mechanism for displaying the data in a manner that is easily interpretable. 

4. Checking that there is a front-end system for accessing and updating the data. 

## Tech Stack
Database: MySQL 8.0.45

Language: Python 3.9.13

Database Drivers/API: mysql-connector-python (May consider switching to use SQLAlchemy)

Version Control: Git (Feature Branch Workflow)

## Database Schema

Requirement of Little lemon to build the relational database system in mysql and possibly handling booking data as well: 

##### *Bookings*: To store information about booked tables in the restaurant including booking id, date and table number.

##### *Orders*: To store information about each order such as order date, quantity and costs (including delivery cost).

##### *Order delivery status*: To store information about the delivery status of each order such as delivery date and status.

##### *menus*: To store information about cuisine and which set of menu items.

##### *menuitems*: To store information about set of starters, courses, drinks, desserts and sides.

##### *cust*: To store information about the customer names and contact details (phone and email).

##### *staff*: Including role and salary.

Archived: (for now)
The database follows a relational model centered around customer orders, loyalty tracking maybe added on top of the project requirement if it is allowed.

Customers: customer infor and contact, may include visit frequency, and lifetime spending.

Items: Menu management (ENUM constraints for categories and availability (optional))

Orders: The central transaction table, with automated payment status flags as optional.

Order_Items: Associative table handling many-to-many relationships, and historical price snapshots (optional)

## Setup Instructions
1. Prerequisites:
Ensure MySQL Server is running.

2. Dependencies:
mysql-connector-python 
sqlalchemy 
python-dotenv

3. Database Initialization
Run the SQL scripts located in the /sql folder in the following order:

- One script or each table, starting from tables that with no foreign keys, naming convention stick to v*_num*_*tbl_name*_schema.sql

Archived:
v1_initial_schema.sql (Customers and Items)
v2_orders_setup.sql (Orders and Order_Items)

## Git Workflow for Contributors
1. Branching: 
Create a feature branch from main (e.g., feat/add-reporting-query).

2. Commits: 

3. Merge: 
Open a Pull Request for self-review before merging into main.

