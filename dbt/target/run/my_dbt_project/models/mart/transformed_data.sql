
  
    

  create  table "analytics"."public"."transformed_data__dbt_tmp"
  
  
    as
  
  (
    select scr.district_id,
    sd.district_name,
    scr.crime_type,
    scr.nearest_police_patrol,
    sd.population,
    sd.governor,
    scr.day_of_week,
    scr.date,
    scr.time
FROM "analytics"."public"."stg_crime_reports" AS scr
    LEFT JOIN "analytics"."public"."stg_districts" AS sd ON scr.district_id = sd.district_id
  );
  