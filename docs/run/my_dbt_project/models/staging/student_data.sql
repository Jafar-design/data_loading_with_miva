
  create view "analytics"."public"."student_data__dbt_tmp"
    
    
  as (
    with student_data AS (
    select * from "analytics"."public"."raw_lms_data"
    where lower(role) = 'student'
)
select * FROM student_data
  );