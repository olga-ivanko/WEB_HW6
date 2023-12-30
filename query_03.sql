-- Знайти середній бал у групах з певного предмета.
SELECT 
    groups.group_id,
    groups.group_name,
    ROUND(AVG(grades.grade),2) as average_grade
FROM
    groups
JOIN
    students ON groups.group_id = students.group_id 
JOIN
	grades ON students.student_id = grades.student_id 
JOIN
	subjects ON subjects.subject_id = grades.subject_id
WHERE
    subjects.subject_name = 'Math'
GROUP BY
    groups.group_id
ORDER BY
    groups.group_id;