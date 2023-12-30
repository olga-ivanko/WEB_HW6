-- Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT 
    ROUND(AVG(grades.grade))
FROM 
    grades;