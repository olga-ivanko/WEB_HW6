-- Знайти які курси читає певний викладач.
SELECT
    professors.professor_id,
    professors.professor_name,
    subjects.subject_name
FROM
    professors
JOIN
    subjects ON subjects.professor_id = professors.professor_id
WHERE
    professors.professor_id = 2;
