SELECT * FROM "groups"

SELECT * FROM students


CREATE TABLE results (
    result_id SERIAL PRIMARY KEY,
    student_id INT UNIQUE REFERENCES students(student_id) ON DELETE CASCADE,
    group_id INT REFERENCES groups(group_id) ON DELETE CASCADE,
    total_marks INT CHECK (total_marks BETWEEN 0 AND 1300),
    gpa NUMERIC(3,2) CHECK (gpa BETWEEN 0.00 AND 5.00),
    grade VARCHAR(2)
);

INSERT INTO results (student_id, group_id, total_marks, gpa, grade) VALUES 
(1, 1, 1180, 5.00, 'A+'),
(2, 1, 1050, 4.75, 'A'),
(3, 1, 980,  4.25, 'A-'),
(4, 1, 890,  3.80, 'B'),
(5, 1, 1145, 5.00, 'A+'),
(6, 2, 1010, 4.60, 'A'),
(7, 2, 995,  4.50, 'A'),
(8, 2, 780,  3.00, 'C'),
(9, 2, 1210, 5.00, 'A+'),
(10, 2, 920, 4.00, 'A-'),
(11, 3, 960,  4.40, 'A'),
(12, 3, 1070, 4.85, 'A'),
(13, 3, 850,  3.60, 'B'),
(14, 3, 640,  2.20, 'D'),
(15, 3, 1125, 5.00, 'A+');

SELECT * FROM results

-- show department with mark/ 
SELECT groups.group_name as g_name, count(*) as total_student, ROUND(avg(total_marks)) as avg_mark FROM groups
INNER JOIN results USING(group_id)
GROUP BY groups.group_name

