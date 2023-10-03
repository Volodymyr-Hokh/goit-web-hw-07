SELECT s.student_full_name, g.group_name
    FROM students s 
    JOIN "groups" g ON s.group_id = g.group_id
    WHERE g.group_id = 1
    ORDER BY s.student_full_name 