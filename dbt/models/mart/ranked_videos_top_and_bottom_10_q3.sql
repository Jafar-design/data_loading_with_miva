WITH video_avg_completion AS (
    SELECT
        video_title,
        AVG(completion_rate_percent) AS avg_completion_rate
    FROM {{ ref("raw_lms_data") }}
    WHERE video_title IS NOT NULL
    GROUP BY video_title
),

ranked_videos AS (
    SELECT
        video_title,
        avg_completion_rate,
        RANK() OVER (ORDER BY avg_completion_rate DESC) AS rank_desc,
        RANK() OVER (ORDER BY avg_completion_rate ASC) AS rank_asc
    FROM video_avg_completion
)

SELECT
    video_title,
    avg_completion_rate,
    'Top' AS engagement_level
FROM ranked_videos
WHERE rank_desc <= 10

UNION ALL

SELECT
    video_title,
    avg_completion_rate,
    'Bottom' AS engagement_level
FROM ranked_videos
WHERE rank_asc <= 10


