CREATE DATABASE IF NOT EXISTS student_management_and_grading_system_db;
USE student_management_and_grading_system_db;

CREATE TABLE IF NOT EXISTS Departments (
	dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Students (
	student_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    dept_id INT,
    enrollment_year YEAR,
    UNIQUE(email),
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
);

CREATE TABLE IF NOT EXISTS Courses (
	course_id INT PRIMARY KEY,
    course_code VARCHAR(255),
    title VARCHAR(255),
    credits INT,
    dept_id INT,
    FOREIGN KEY (dept_id)
    REFERENCES Departments(dept_id)
);

CREATE TABLE IF NOT EXISTS Enrollments (
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(255),
    course_id INT,
    semester VARCHAR(255),
    ca_score DEC(5,2) CHECK (ca_score >= 0 AND ca_score <= 30),
    exam_score DEC(5,2) CHECK (exam_score >= 0 AND exam_score <= 70),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    CONSTRAINT unique_enrollment UNIQUE (student_id, course_id, semester)
);

