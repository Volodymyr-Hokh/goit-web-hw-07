SELECT s.student_full_name, gr.group_name, subj.subject_name, g.grade
    FROM grades g 
    JOIN students s ON g.student_id = s.student_id
    JOIN "groups" gr ON s.group_id = gr.group_id 
    JOIN subjects subj ON g.subject_id = subj.subject_id
    WHERE s.group_id = 1 AND subj.subject_id = 1