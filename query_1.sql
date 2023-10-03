SELECT s.student_id, s.student_full_name, ROUND(AVG(g.grade), 2) AS average_grade
    FROM students s
    JOIN grades g ON s.student_id = g.student_id
    GROUP BY s.student_id, s.student_full_name
    ORDER BY average_grade DESC
    LIMIT 5;