select DISTINCT st.student_full_name, t.teacher_full_name, subj.subject_name
    FROM students st
    JOIN grades g ON st.student_id = g.student_id
    JOIN subjects subj ON g.subject_id = subj.subject_id
    JOIN teachers t ON subj.teacher_id = t.teacher_id 
    WHERE st.student_id  = 1 AND subj.teacher_id = 1;