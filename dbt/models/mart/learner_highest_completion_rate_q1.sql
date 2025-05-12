WITH learner_highest_completion_rate AS (
    select student_id,
        count(video_title) number_of_videos,
        AVG(completion_rate_percent) avg_completion_rate_percent
    FROM {{ ref("student_data") }}
    group by student_id
    ORDER BY count(video_title) desc
)
select *
FROM learner_highest_completion_rate
LIMIT 1

