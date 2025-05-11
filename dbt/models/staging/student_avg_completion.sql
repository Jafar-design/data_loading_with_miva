WITH student_avg_completion AS (
    SELECT
        student_id,
        AVG(completion_rate_percent) AS avg_completion_rate
    FROM {{ ref('lms_engagement_data') }}
    WHERE student_id IS NOT NULL
    GROUP BY student_id
)

select * FROM student_avg_completion