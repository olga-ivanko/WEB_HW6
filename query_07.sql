-- Знайти оцінки студентів у окремій групі з певного предмета.
SELECT 
    grades.student_id,
    students.student_name,
    students.group_id, 
    subjects.subject_name,
    grades.grade
FROM
    grades
JOIN
    students ON students.student_id = grades.student_id
JOIN 
    subjects  ON subjects.subject_id = grades.subject_id
WHERE
    students.group_id = 1 AND subjects.subject_name = "Physics";