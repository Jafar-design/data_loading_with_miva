ranked_students_top_and_bottom AS (
    SELECT
        student_id,
        avg_completion_rate,
        RANK() OVER (ORDER BY avg_completion_rate DESC) AS rank_desc,
        RANK() OVER (ORDER BY avg_completion_rate ASC) AS rank_asc
    FROM {{ ref('student_avg_completion') }}
)

select 'Top' AS level, student_id, avg_completion_rate
FROM ranked_students_top_and_bottom
WHERE rank_desc <= 10
UNION 

select 'Bottom' AS level, student_id, avg_completion_rate
FROM ranked_students_top_and_bottom
WHERE rank_asc <= 10


