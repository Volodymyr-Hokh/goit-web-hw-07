SELECT t.teacher_full_name, round(AVG(g.grade), 2) AS average_grade
    FROM teachers t
    JOIN subjects s ON t.teacher_id = s.teacher_id
    JOIN grades g ON s.subject_id = g.subject_id
    WHERE t.teacher_id  = 1
    GROUP BY t.teacher_full_name;