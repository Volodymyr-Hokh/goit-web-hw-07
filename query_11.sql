SELECT t.teacher_full_name, st.student_full_name, AVG(g.grade) AS average_grade
    FROM teachers t
    JOIN subjects s ON t.teacher_id = s.teacher_id
    JOIN grades g ON s.subject_id = g.subject_id
    JOIN students st ON g.student_id = st.student_id
    WHERE st.student_id  = 1 AND t.teacher_id  = 1
    GROUP BY t.teacher_full_name, st.student_full_name;