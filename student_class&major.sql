USE college_database;

SELECT 
	department_id,
    name AS class,
    s.student_id,
    major
FROM course_selection cs
LEFT JOIN course_active ca
	ON ca.course_id = cs.course_id
LEFT JOIN student s
	ON s.student_id = ca.student_id
ORDER BY department_id