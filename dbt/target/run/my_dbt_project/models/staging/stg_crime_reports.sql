
  create view "analytics"."public"."stg_crime_reports__dbt_tmp"
    
    
  as (
    SELECT id,
    district_id,
    timestamp,
    CASE
        WHEN lower(crime_type) = 'assult' THEN 'assault'
        WHEN lower(crime_type) = 'frued' THEN 'fraud'
        ELSE lower(crime_type)
    END crime_type,
    CASE
        WHEN nearest_police_patrol LIKE '% miles' THEN REPLACE(nearest_police_patrol, ' miles', '')::FLOAT * 1.60934
        ELSE REPLACE(nearest_police_patrol, ' km', '')::FLOAT
    END AS nearest_police_patrol,
    EXTRACT(
        DOW
        FROM timestamp
    ) AS day_of_week,
    -- Day of the week (0=Sunday, 6=Saturday)
    DATE(timestamp) AS date,
    -- Extracts the date part
    TO_CHAR(timestamp, 'HH24:MI:SS') AS time
FROM public.raw_crime_reports
WHERE (
        crime_type IS NOT NULL
        AND crime_type != ''
    )
  );