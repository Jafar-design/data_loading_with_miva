WITH video_avg_completion AS (
    SELECT
        video_title,
        AVG(completion_rate_percent) AS avg_completion_rate
    FROM "analytics"."public"."lms_engagement_data"
    WHERE video_title IS NOT NULL
    GROUP BY video_title
)

select * FROM video_avg_completion