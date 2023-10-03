SELECT st.group_id, gr.group_name, ROUND(AVG(g.grade), 2) AS average_grade
    FROM students st
    JOIN grades g ON st.student_id = g.student_id
    JOIN subjects subj ON g.subject_id = subj.subject_id
    JOIN groups gr ON st.group_id = gr.group_id
    WHERE subj.subject_id  = 1
    GROUP BY st.group_id, gr.group_name;