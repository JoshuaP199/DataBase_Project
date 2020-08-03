USE college_database;

-- UPDATE 
UPDATE student
SET credits = 16, major = 'Computer Science'
WHERE student_id = 9;

SELECT student_id, major, credits
FROM student



-- INSERT
INSERT INTO course_active VALUES (13, 9);

SELECT *
FROM course_active
ORDER BY course_id



-- DELETE
DELETE FROM course_selection
	WHERE course_id = 10;
    
SELECT *
FROM course_selection