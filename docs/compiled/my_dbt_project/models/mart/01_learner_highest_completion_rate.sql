WITH 01_learner_highest_completion_rate AS (
    select student_id,
        count(video_title),
        AVG(completion_rate_percent)
    FROM { { ref("raw_lms_data") } }
    group by student_id
    ORDER BY count(video_title) desc
)
select *
FROM 01_learner_highest_completion_rate
LIMIT 1