with raw_lms_data as (
    select *
    from {{ ref('lms_engagement_data') }}
)
SELECT * FROM raw_lms_data
