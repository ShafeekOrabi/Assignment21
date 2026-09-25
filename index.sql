1)
 CREATE DATABASE university_db;

2) 
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

3)
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE CASCADE
);

4)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

5)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
);

6)
CREATE TABLE health_records (
    record_id INT PRIMARY KEY,
    student_id INT,
    blood_group VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE
);

7)
7-1)
INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'computer science'),
(2, 'mathematics'),
(3, 'physics');


7-2)
INSERT INTO courses (course_id, course_name, credits, dept_id)
VALUES
(1, 'database systems', 4, 1),
(2, 'algorithms', 3, 1),
(3, 'calculus', 4, 2),
(4, 'quantum mechanics', 5, 3);


7-3)
INSERT INTO students (student_id, student_name)
VALUES
(1, 'alice'),
(2, 'bob'),
(3, 'charlie'),
(4, 'samy'),
(5, 'eva');


7-4)
INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES
(1, 1, 1), -- alice - database systems
(2, 1, 2), -- alice - algorithms
(3, 2, 1), -- bob - database systems
(4, 3, 2), -- charlie - algorithms
(5, 3, 3), -- charlie - calculus
(6, 4, 3), -- samy - calculus
(7, 4, 4); -- samy - quantum mechanics


7-5)
INSERT INTO health_records (record_id, student_id, blood_group)
VALUES
(1, 1, 'A+'),
(2, 2, 'B+'),
(3, 3, 'O-'),
(4, 4, 'AB+'),
(5, 5, 'A-');