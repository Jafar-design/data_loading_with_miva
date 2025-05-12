
with student_data AS (
    select * from {{ ref('raw_lms_data') }}
    where lower(role) = 'student'
)
select * FROM student_data