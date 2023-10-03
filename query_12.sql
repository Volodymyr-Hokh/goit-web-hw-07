SELECT gr.group_name, s.student_full_name, subj.subject_name, g.grade, g.date
    FROM grades g
    JOIN subjects subj ON g.subject_id = subj.subject_id 
    JOIN students s ON g.student_id = s.student_id
    JOIN "groups" gr ON s.group_id = gr.group_id 
    WHERE g.subject_id = 2 AND gr.group_id = 1
    AND g.date = (
        SELECT MAX(date)
        FROM grades
        WHERE subject_id = 2
    );
