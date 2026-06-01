-- Active: 1777971446004@@127.0.0.1@5432@student_ssc

-- create DATABASE----------------------
CREATE DATABASE student_ssc

-- creat TABLE for group ----------------
CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(20) NOT NULL UNIQUE
);

-- CREATE TABLE for students-----------
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    roll_no INT NOT NULL UNIQUE,
    reg_no BIGINT NOT NULL UNIQUE,
    student_name VARCHAR(100) NOT NULL,
    group_id INT REFERENCES groups(group_id) ON DELETE SET NULL,
    session_year VARCHAR(9) DEFAULT '2026-2027'
);


-- INSERT group table data---------
INSERT INTO groups (group_name) VALUES 
('Science'),
('Commerce'),
('Humanities');

-- INSERT student TABLE data-------
INSERT INTO students(roll_no, reg_no, student_name, group_id) VALUES
(1001, 1612345678, 'Nusrat Jahan', 1),
(1002, 1612345679, 'Tanvir Ahmed', 1),
(2001, 1612345680, 'Imran Hossain', 2);

-- view all group/
SELECT * FROM groups

-- view all students/
SELECT * FROM students

-- ----------------------------practice 1 ---------------------
-- inner join to retrive students and group

SELECT * FROM students
INNER JOIN groups ON students.group_id = groups.group_id

SELECT s.student_name, g.group_name FROM groups as g
INNER JOIN students as s USING(group_id)