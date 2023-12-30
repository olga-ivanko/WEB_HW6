-- Знайти список студентів у певній групі.
SELECT 
    students.student_id,
    students.student_name,
    students.group_id
FROM
    students
WHERE
    students.group_id = 3;
    