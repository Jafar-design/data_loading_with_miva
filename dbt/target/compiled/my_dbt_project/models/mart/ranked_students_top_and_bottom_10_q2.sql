WITH student_avg_completion AS (
    SELECT
        student_id,
        AVG(completion_rate_percent) AS avg_completion_rate
    FROM "analytics"."public"."raw_lms_data"
    WHERE student_id IS NOT NULL
    GROUP BY student_id
),

ranked_students AS (
    SELECT
        student_id,
        avg_completion_rate,
        RANK() OVER (ORDER BY avg_completion_rate DESC) AS rank_desc,
        RANK() OVER (ORDER BY avg_completion_rate ASC) AS rank_asc
    FROM student_avg_completion
)

SELECT
    student_id,
    avg_completion_rate,
    'Top' AS engagement_level
FROM ranked_students
WHERE rank_desc <= 10

UNION ALL

SELECT
    student_id,
    avg_completion_rate,
    'Bottom' AS engagement_level
FROM ranked_students
WHERE rank_asc <= 10