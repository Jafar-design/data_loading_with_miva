03_ranked_videos_top_and_bottom_10 AS (
    SELECT
        video_title,
        avg_completion_rate,
        RANK() OVER (ORDER BY avg_completion_rate DESC) AS rank_desc,
        RANK() OVER (ORDER BY avg_completion_rate ASC) AS rank_asc
    FROM "analytics"."public"."video_avg_completion"
)

select 'Top' AS level, video_title, avg_completion_rate
FROM 03_ranked_videos_top_and_bottom_10
WHERE rank_desc <= 10
UNION 

select 'Bottom' AS level, video_title, avg_completion_rate
FROM 03_ranked_videos_top_and_bottom_10
WHERE rank_asc <= 10