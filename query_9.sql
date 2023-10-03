select DISTINCT st.student_id, st.student_full_name, subj.subject_name
    FROM students st
    JOIN grades g ON st.student_id = g.student_id
    JOIN subjects subj ON g.subject_id = subj.subject_id
    WHERE st.student_id  = 1;