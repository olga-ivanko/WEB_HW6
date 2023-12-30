-- Список курсів, які певному студенту читає певний викладач
SELECT
    students.student_name,
    professors.professor_name,
    subjects.subject_name
FROM
    grades
JOIN
    students ON students.student_id = grades.student_id
JOIN
    professors ON professors.professor_id = subjects.professor_id
JOIN
    subjects ON subjects.subject_id = grades.subject_id
WHERE
    students.student_id = 10 AND professors.professor_id = 3
GROUP BY
    students.student_name,
    professors.professor_name,
    subjects.subject_name;