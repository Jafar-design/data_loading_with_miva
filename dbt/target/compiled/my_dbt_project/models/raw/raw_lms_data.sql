with raw_lms_data as (
    select *
    from "analytics"."public"."lms_engagement_data"
)
SELECT * FROM raw_lms_data