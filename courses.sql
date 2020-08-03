USE college_database;

SELECT 
	s.student_id,
    s.last_name,
    cs.course_id,
    cs.name AS course
FROM student s
JOIN course_active ca
	ON ca.student_id = s.student_id
RIGHT JOIN course_selection cs
	ON cs.course_id = ca.course_id
ORDER BY course_id