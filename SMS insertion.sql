
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Mathematics');

INSERT INTO Courses (course_id, course_code, title, credits, dept_id) VALUES
(101, 'CS101', 'Introduction to Computer Science', 3, 1),
(102, 'CS201', 'Data Structures & Algorithms', 4, 1),
(201, 'EE201', 'Circuit Analysis', 4, 2),
(202, 'EE202', 'Digital Logic Design', 3, 2),
(301, 'MTH102', 'Linear Algebra', 3, 3);

INSERT INTO Students (student_id, first_name, last_name, email, dept_id, enrollment_year) VALUES
('STU101', 'Alex', 'Johnson', 'alex.j@univ.edu', 1, 2024),
('STU102', 'Beatrix', 'Kiddo', 'b.kiddo@univ.edu', 2, 2025),
('STU103', 'Charlie', 'Davis', 'c.davis@univ.edu', 1, 2024),
('STU104', 'Diana', 'Prince', 'd.prince@univ.edu', 3, 2023),
('STU105', 'Ethan', 'Hunt', 'e.hunt@univ.edu', 1, 2025),
('STU106', 'Fiona', 'Gallagher', 'f.gallagher@univ.edu', 2, 2024),
('STU107', 'George', 'Clark', 'g.clark@univ.edu', 3, 2025),
('STU108', 'Hannah', 'Abbott', 'h.abbott@univ.edu', 1, 2023),
('STU109', 'Ian', 'Malcolm', 'i.malcolm@univ.edu', 3, 2024),
('STU110', 'Julia', 'Roberts', 'j.roberts@univ.edu', 2, 2025);

INSERT INTO Enrollments (student_id, course_id, semester, ca_score, exam_score) VALUES
-- High Performers (Totals: 91, 80, 93, 85)
('STU101', 101, 'Fall 2025', 27.00, 64.00),
('STU101', 301, 'Fall 2025', 23.00, 57.00),
('STU104', 301, 'Fall 2025', 28.50, 64.50),
('STU108', 102, 'Spring 2026', 25.00, 60.00),

-- Average Performers (Totals: 66, 64, 57, 63, 51)
('STU102', 201, 'Fall 2025', 19.50, 46.50),
('STU103', 101, 'Fall 2025', 18.00, 46.00),
('STU105', 101, 'Spring 2026', 16.50, 40.50),
('STU106', 202, 'Fall 2025', 21.00, 42.00),
('STU107', 301, 'Spring 2026', 15.00, 36.00),

-- Low / Failing Scores (Totals: 41, 37, 43)
('STU103', 301, 'Fall 2025', 12.00, 29.00),
('STU109', 301, 'Spring 2026', 10.50, 26.50),
('STU110', 201, 'Spring 2026', 13.50, 29.50);

