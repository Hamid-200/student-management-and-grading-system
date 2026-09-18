select * from courses;
select * from departments;
select * from enrollments;
select * from students;

-- Grade Calculation

SELECT
CONCAT(first_name, ' ', last_name) AS full_name,
course_code,
ca_score,
exam_score,
(ca_score + exam_score) AS total_score,
CASE
	WHEN (ca_score + exam_score) >= 70 THEN 'A'
	WHEN (ca_score + exam_score) >= 60 THEN 'B'
	WHEN (ca_score + exam_score) >= 50 THEN 'C'
	WHEN (ca_score + exam_score) >= 45 THEN 'D'
	WHEN (ca_score + exam_score) >= 40 THEN 'E'
	ELSE 'F'
END AS Grade
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY full_name;

-- GPA calculation for each student

SELECT CONCAT(first_name, ' ', last_name) AS full_name,
enrollments.student_id,
/*CASE
	WHEN (ca_score + exam_score) >= 70 THEN 5
	WHEN (ca_score + exam_score) >= 60 THEN 4
	WHEN (ca_score + exam_score) >= 50 THEN 3
	WHEN (ca_score + exam_score) >= 45 THEN 2
	WHEN (ca_score + exam_score) >= 40 THEN 1
	ELSE '0'
END AS Grade_point,
((CASE
	WHEN (ca_score + exam_score) >= 70 THEN 5
	WHEN (ca_score + exam_score) >= 60 THEN 4
	WHEN (ca_score + exam_score) >= 50 THEN 3
	WHEN (ca_score + exam_score) >= 45 THEN 2
	WHEN (ca_score + exam_score) >= 40 THEN 1
	ELSE '0'
END)
* credits) AS Quality_point,*/
ROUND(
	SUM(
		(CASE
			WHEN (ca_score + exam_score) >= 70 THEN 5
			WHEN (ca_score + exam_score) >= 60 THEN 4
			WHEN (ca_score + exam_score) >= 50 THEN 3
			WHEN (ca_score + exam_score) >= 45 THEN 2
			WHEN (ca_score + exam_score) >= 40 THEN 1
			ELSE 0
		END) * credits
		) / SUM(credits), 2) AS GPA
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
JOIN students ON enrollments.student_id = students.student_id
GROUP BY enrollments.student_id;

-- Top Performing Student per Department

WITH studentGPAs AS (
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
enrollments.student_id,
departments.dept_name,
ROUND(
	SUM(
		(CASE
			WHEN (ca_score + exam_score) >= 70 THEN 5
			WHEN (ca_score + exam_score) >= 60 THEN 4
			WHEN (ca_score + exam_score) >= 50 THEN 3
			WHEN (ca_score + exam_score) >= 45 THEN 2
			WHEN (ca_score + exam_score) >= 40 THEN 1
			ELSE 0
		END) * credits
		) / SUM(credits), 2) AS GPA
FROM enrollments
JOIN courses ON enrollments.course_id = courses.course_id
JOIN students ON enrollments.student_id = students.student_id
JOIN departments ON students.dept_id = departments.dept_id
GROUP BY 
	enrollments.student_id,
	students.first_name,
	students.last_name,
	departments.dept_name
)

SELECT *,
RANK() OVER(PARTITION BY dept_name ORDER BY GPA DESC) AS rank_per_department
FROM studentGPAs;

-- Failure Rate per Courses

SELECT course_code,
title,
ROUND(
	SUM(
		CASE 
			WHEN (ca_score + exam_score) < 45 THEN 1
			ELSE 0
		END
		) / COUNT(student_id) * 100, 2) AS failure_rate
FROM enrollments
JOIN courses ON enrollments.course_id =  courses.course_id
GROUP BY course_code, title;

-- View creation for student transcripts

CREATE VIEW Student_Transcripts AS
	SELECT
	CONCAT(first_name, ' ', last_name) AS full_name,
	course_code,
	ca_score,
	exam_score,
	(ca_score + exam_score) AS total_score,
	CASE
		WHEN (ca_score + exam_score) >= 70 THEN 'A'
		WHEN (ca_score + exam_score) >= 60 THEN 'B'
		WHEN (ca_score + exam_score) >= 50 THEN 'C'
		WHEN (ca_score + exam_score) >= 45 THEN 'D'
		WHEN (ca_score + exam_score) >= 40 THEN 'E'
		ELSE 'F'
	END AS Grade
	FROM students
	JOIN enrollments ON students.student_id = enrollments.student_id
	JOIN courses ON enrollments.course_id = courses.course_id
	ORDER BY full_name;
    
    SELECT * FROM student_transcripts;
    
    
    
