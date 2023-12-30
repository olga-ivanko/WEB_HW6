-- Знайти студента із найвищим середнім балом з певного предмета.
SELECT
    students.student_id,
    students.student_name,
    ROUND(MAX(grades.grade), 2) as highest_grade
FROM
    students
JOIN
    grades ON students.student_id = grades.student_id
JOIN
    subjects ON grades.subject_id = subjects.subject_id
WHERE
    subjects.subject_name = 'Math'
GROUP BY
    students.student_id, students.student_name
ORDER BY
    highest_grade DESC
LIMIT 1;
