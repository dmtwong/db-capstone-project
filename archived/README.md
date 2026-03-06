---
title: "readme_databaseProject"
author: "David W."
date: "2026-03-15"
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

## Lessons Learned
* **Atomicity:** Gained hands-on experience in managing database states; learned why "Insert-then-Check" patterns are superior for concurrency.
* **Versioning:** Refined my Git workflow, moving from simple commits to a feature-branch system that mimics real-world collaborative development.
* **Refactoring:** Learned the value of peer review by treating my earlier commits as "feedback" for subsequent improvements in logic.

## Key Achievements
- **Transactional Integrity:** Implemented ACID-compliant stored procedures to prevent double-bookings during high-concurrency requests.
- **Defensive Engineering:** Designed secure procedures with parameter validation and explicit naming conventions to prevent SQL injection and logic errors.
- **Test-Driven Design:** Built a comprehensive test suite (`TestBookingSystem_II.sql`) that validates system behavior across successful and conflicting booking states.
- **Full Lifecycle Management:** Developed complete CRUD functionality for reservations, ensuring the database remains in a consistent state throughout every user interaction.

## Tech Stack
Database: MySQL 8.0.45

Language: Python 3.8.8

Database Drivers/API: mysql-connector-python

Version Control: Git (Feature Branch Workflow)

## Database Architecture:
Please see: Documentation/ER_diagram/png/little_lemon.png

## Setup Instructions
1. **Prerequisites:** Ensure MySQL Server is running.
2. **Environment Setup:** setup `.env` and configure your database credentials.
   *(Note: `.env` file is not commit for security, please create one for yourself)*
3. **Initialization:** Execute SQL scripts in the `/sql` folder in dependency order (Schema -> Staging -> Populating).
4. **Testing:** Run the scripts in `/Tests/sql` to verify the system logic.

## Git Workflow for Contributors
1. Branching: 
Create a feature branch from main (e.g., feat/add-reporting-query).

2. Commits: 

3. Merge: 
Open a Pull Request for self-review before merging into main.



