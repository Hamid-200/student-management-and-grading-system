# Student Management and Grading System

This repository contains the complete MySQL database architecture, data seeding scripts, and advanced analytical queries for a Student Management and Grading System. The project focuses on strict data integrity enforcement, complex mathematical aggregations, and automated reporting.

## Database Architecture
The schema is designed to track students, courses, departments, and enrollments with strict data validation:
*   **Departments & Courses:** Standardized academic catalog mapping[cite: 5].
*   **Students:** Tracks enrollment details with foreign key constraints linking to specific departments[cite: 5].
*   **Enrollments:** Acts as the transactional bridge, utilizing `CHECK` constraints to keep scores within valid ranges (e.g., exams strictly capped at 70) and a composite `UNIQUE` constraint to prevent duplicate course registrations in a single semester[cite: 5].

## Key Features & Advanced SQL
*   **Dynamic GPA Calculation:** Uses nested `CASE` statements within `SUM()` functions to automatically calculate weighted GPAs based on raw scores and course credits[cite: 4].
*   **Departmental Ranking:** Implements Common Table Expressions (CTEs) and the `RANK() OVER(PARTITION BY...)` window function to accurately identify and rank the top-performing students within each specific department[cite: 4].
*   **Automated Transcripts:** Wraps complex multi-table joins and grading logic into a reusable MySQL `VIEW` (`Student_Transcripts`), simplifying repetitive reporting[cite: 4].

## Repository Structure
*   `SMS creation.sql`: Contains the Data Definition Language (DDL) scripts to create the tables, define data types, and enforce constraints[cite: 5].
*   `SMS insertion.sql`: Populates the database with sample departments, courses, students, and varied academic performance records[cite: 6].
*   `SMS core queries.sql`: Houses the advanced analytical queries for grading, ranking, and failure rate analysis[cite: 4].

## How to Run
1. Clone this repository to your local machine.
2. Open your preferred MySQL environment (e.g., MySQL Workbench).
3. Execute `SMS creation.sql` to generate the schema[cite: 5].
4. Run `SMS insertion.sql` to seed the database with sample records[cite: 6].
5. Open `SMS core queries.sql` to test the ranking, GPA calculation, and transcript views[cite: 4].
