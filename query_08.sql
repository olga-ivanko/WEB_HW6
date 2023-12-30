-- Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT
    professors.professor_name,
    subjects.subject_name,
    ROUND(AVG(grades.grade))
FROM
    grades
JOIN
    subjects ON subjects.subject_id = grades.subject_id
JOIN
    professors ON professors.professor_id = subjects.professor_id
WHERE
    professors.professor_id = 2
GROUP BY
    professors.professor_name, subjects.subject_name;