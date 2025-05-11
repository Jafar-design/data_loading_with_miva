
  
    

  create  table "analytics"."public"."02_ranked_students_top_and_bottom_10__dbt_tmp"
  
  
    as
  
  (
    02_ranked_students_top_and_bottom_10 AS (
    SELECT
        student_id,
        avg_completion_rate,
        RANK() OVER (ORDER BY avg_completion_rate DESC) AS rank_desc,
        RANK() OVER (ORDER BY avg_completion_rate ASC) AS rank_asc
    FROM "analytics"."public"."student_avg_completion"
)

select 'Top' AS level, student_id, avg_completion_rate
FROM 02_ranked_students_top_and_bottom_10
WHERE rank_desc <= 10
UNION 

select 'Bottom' AS level, student_id, avg_completion_rate
FROM 02_ranked_students_top_and_bottom_10
WHERE rank_asc <= 10
  );
  