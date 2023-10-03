SELECT s.subject_name, t.teacher_full_name
    FROM subjects s
    JOIN teachers t ON S.teacher_id = t.teacher_id
    WHERE t.teacher_id = 1