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
(2001, 1612345680, 'Imran Hossain', 2),
(1006, 1612345616, 'Samiul Islam', 1),
(1007, 1612345617, 'Fariha Zaman', 1),
(1008, 1612345618, 'Asif Khondoker', 1),
(1009, 1612345619, 'Sadia Sultana', 1),
(2006, 1612345620, 'Imran Hossain', 2),
(2007, 1612345621, 'Rashedul Bari', 2),
(2008, 1612345622, 'Mehjabin Chowdhury', 2),
(2009, 1612345623, 'Naimur Rahman', 2),
(3006, 1612345624, 'Tahsan Khan', 3),
(3007, 1612345625, 'Mithila Rahman', 2),
(3008, 1612345626, 'Siam Ahmed', 3),
(3009, 1612345627, 'Sabila Nur', 3);

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