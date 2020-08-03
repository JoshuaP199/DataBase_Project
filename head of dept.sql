USE college_database;

SELECT 
	i.instructor_id,
    i.last_name,
    i.education,
    i.field_of_study,
    d.name AS department
FROM instructor i
LEFT JOIN head_of_dept hod
	ON hod.head = i.instructor_id
LEFT JOIN department d
	ON d.department_id = hod.department
ORDER BY i.field_of_study