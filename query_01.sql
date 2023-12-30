-- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT
    students.student_id,
    students.student_name,
    ROUND(AVG(grades.grade), 2) as average_grade
FROM
    students
JOIN
    grades ON students.student_id = grades.student_id
GROUP BY
    students.student_id, students.student_name
ORDER BY
    average_grade DESC
LIMIT 5;