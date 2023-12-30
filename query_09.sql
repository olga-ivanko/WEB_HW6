-- Знайти список курсів, які відвідує студент.
SELECT 
    students.student_name,
    subjects.subject_name
FROM
    grades
JOIN
    students ON grades.student_id = students.student_id
JOIN
    subjects ON subjects.subject_id = grades.subject_id
WHERE
    students.student_id = 8
GROUP BY
    subjects.subject_name;