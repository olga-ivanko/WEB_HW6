--Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    group_id INTEGER PRIMARY KEY,
    group_name VARCHAR(10)
);

-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(50) NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups (group_id) 
);

--Table professors
DROP TABLE IF EXISTS professors;
CREATE TABLE professors (
    professor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    professor_name VARCHAR(50) NOT NULL
);

--Table subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(25) UNIQUE NOT NULL,
    professor_id INTEGER,
    FOREIGN KEY (professor_id) REFERENCES professors (professor_id)
);

--Table grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    grade_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER, 
    grade INTEGER NOT NULL,
    date_received DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);
