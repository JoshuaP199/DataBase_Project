DROP DATABASE IF EXISTS college_database;
CREATE DATABASE college_database;
USE college_database;

CREATE TABLE department (
	department_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    PRIMARY KEY (department_id)
);
INSERT INTO department VALUES (DEFAULT, 'Computer Science');
INSERT INTO department VALUES (DEFAULT, 'Psychology');
INSERT INTO department VALUES (DEFAULT, 'English');
INSERT INTO department VALUES (DEFAULT, 'History');
INSERT INTO department VALUES (DEFAULT, 'Mathematics');
INSERT INTO department VALUES (DEFAULT, 'Biology');
INSERT INTO department VALUES (DEFAULT, 'Music');
INSERT INTO department VALUES (DEFAULT, 'Business');
INSERT INTO department VALUES (DEFAULT, 'Sciences');



CREATE TABLE instructor (
	instructor_id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(45) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    education VARCHAR(45) NULL DEFAULT 'High School',
    field_of_study INT,
    PRIMARY KEY (instructor_id),
    FOREIGN KEY (field_of_study) REFERENCES department(department_id)
);
INSERT INTO instructor VALUES(DEFAULT, 'Churchill', 'James', 'B.A.', 3);
INSERT INTO instructor VALUES(DEFAULT, 'Robertson', 'Sarah', 'PHD', 3);
INSERT INTO instructor VALUES(DEFAULT, 'McDonald', 'Edgar', 'Doctorate', 6);
INSERT INTO instructor VALUES(DEFAULT, 'Burns', 'Darren', 'B.S', 1);
INSERT INTO instructor VALUES(DEFAULT, 'Robinson', 'Caitlin', 'PHD', 5);
INSERT INTO instructor VALUES(DEFAULT, 'Cooper', 'Priya', 'B.S', 5);
INSERT INTO instructor VALUES(DEFAULT, 'Cheers', 'Terrily', 'B.A', 7);
INSERT INTO instructor VALUES(DEFAULT, 'Organ', 'Rashad', 'B.S.', 8);
INSERT INTO instructor VALUES(DEFAULT, 'Peltier', 'Anibal', 'B.A.', 1);
INSERT INTO instructor VALUES(DEFAULT, 'Parenti', 'Remona', 'Doctorate', 2);
INSERT INTO instructor VALUES(DEFAULT, 'Macleod', 'Elton', 'B.S', 9);
INSERT INTO instructor VALUES(DEFAULT, 'Gamble', 'Zofia', 'B.A', 4);
INSERT INTO instructor VALUES(DEFAULT, 'Stermer', 'Lamont', 'PHD', 6);
INSERT INTO instructor VALUES(DEFAULT, 'Jamerson', 'Lilith', 'B.A', 2);



CREATE TABLE student (
	student_id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(45) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    major VARCHAR(45) NULL DEFAULT 'undecided',
    credits INT NULL DEFAULT 0,
    PRIMARY KEY (student_id)
);
INSERT INTO student VALUES(DEFAULT, 'Ming', 'Yoshida', 'Mathematics', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Gensch', 'Paul', 'Psychology', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Nave', 'Audo', 'History', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Clarkson', 'Guro', DEFAULT, DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Wright', 'Mariano', 'Computer Science', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Amundsen', 'Zora', 'Biology', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Green', 'Asar', DEFAULT, DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Bosh', 'Darline', 'English', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Southers', 'Tomas', DEFAULT, DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Stidham', 'Susana', 'Business', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Mulhall', 'Rory', 'Sciences', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Mieles', 'Victor', 'Music', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Loveday', 'Lulu', 'Sciences', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Aumann', 'Tessie', 'History', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Golla', 'Fiona', 'Biology', DEFAULT);
INSERT INTO student VALUES(DEFAULT, 'Dease', 'Ken', DEFAULT, DEFAULT);



CREATE TABLE head_of_dept ( 
	department INT,
	head INT,
    FOREIGN KEY (department) REFERENCES department(department_id),
    FOREIGN KEY (head) REFERENCES instructor(instructor_id)
);
INSERT INTO head_of_dept VALUES (1, 4);
INSERT INTO head_of_dept VALUES (2, 10);
INSERT INTO head_of_dept VALUES (3, 2);
INSERT INTO head_of_dept VALUES (4, 12);
INSERT INTO head_of_dept VALUES (5, 5);
INSERT INTO head_of_dept VALUES (6, 13);
INSERT INTO head_of_dept VALUES (7, 7);
INSERT INTO head_of_dept VALUES (8, 8);
INSERT INTO head_of_dept VALUES (9, 11);



CREATE TABLE course_type (
	type_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45),
    PRIMARY KEY (type_id)
);
INSERT INTO course_type VALUES (DEFAULT, 'In-Person');
INSERT INTO course_type VALUES (DEFAULT, 'Online');
INSERT INTO course_type VALUES (DEFAULT, 'Hybrid');

CREATE TABLE course_selection (
	course_id INT NOT NULL AUTO_INCREMENT,
    department_id INT,
    name VARCHAR(45) NOT NULL,
    instructor INT,
    class_type INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (instructor) REFERENCES instructor(instructor_id),
    FOREIGN KEY (class_type) REFERENCES course_type(type_id)
);
INSERT INTO course_selection VALUES (DEFAULT, 2, 'Intro to Psychology', 10, 1);
INSERT INTO course_selection VALUES (DEFAULT, 1, 'Intro to Comp. Sci.', 4, 2);
INSERT INTO course_selection VALUES (DEFAULT, 8, 'Global Business', 8, 3);
INSERT INTO course_selection VALUES (DEFAULT, 3, 'English 101', 2, 3);
INSERT INTO course_selection VALUES (DEFAULT, 6, 'Intro to Biology', 13, 2);
INSERT INTO course_selection VALUES (DEFAULT, 9, 'Earth Science', 11, 2);
INSERT INTO course_selection VALUES (DEFAULT, 5, 'College Algebra', 6, 2);
INSERT INTO course_selection VALUES (DEFAULT, 4, 'US History', 12, 1);
INSERT INTO course_selection VALUES (DEFAULT, 5, 'Calculus l', 5, 1);
INSERT INTO course_selection VALUES (DEFAULT, 8, 'Business Writing', 8, 1);
INSERT INTO course_selection VALUES (DEFAULT, 6, 'Micro-Biology', 3, 1);
INSERT INTO course_selection VALUES (DEFAULT, 2, 'Abnormal Psychology', 14, 2);
INSERT INTO course_selection VALUES (DEFAULT, 1, 'Data Structures', 9, 1);
INSERT INTO course_selection VALUES (DEFAULT, 9, 'Intro to Physics', 11, 1);
INSERT INTO course_selection VALUES (DEFAULT, 3, 'English 102', 1, 3);
INSERT INTO course_selection VALUES (DEFAULT, 7, 'Intro to Jazz', 7, 1);



CREATE TABLE course_active (
	course_id INT,
    student_id INT,
    FOREIGN KEY(course_id) REFERENCES course_selection(course_id),
    FOREIGN KEY(student_id) REFERENCES student(student_id)
);
INSERT INTO course_active VALUES (1, 4);
INSERT INTO course_active VALUES (12, 2);
INSERT INTO course_active VALUES (8, 3);
INSERT INTO course_active VALUES (9, 1);
INSERT INTO course_active VALUES (13, 5);
INSERT INTO course_active VALUES (16, 12);
INSERT INTO course_active VALUES (14, 13);
INSERT INTO course_active VALUES (6, 11);
INSERT INTO course_active VALUES (3, 10);
INSERT INTO course_active VALUES (7, 7);
INSERT INTO course_active VALUES (11, 6);
INSERT INTO course_active VALUES (15, 8);
INSERT INTO course_active VALUES (11, 15);
INSERT INTO course_active VALUES (5, 16);
INSERT INTO course_active VALUES (8, 14);
INSERT INTO course_active VALUES (2, 9);

-- INSERT INTO course_active VALUES (, );
-- INSERT INTO course_active VALUES (, );
-- INSERT INTO course_active VALUES (, );
-- INSERT INTO course_active VALUES (, );
-- INSERT INTO course_active VALUES (, );
-- INSERT INTO course_active VALUES (, );


