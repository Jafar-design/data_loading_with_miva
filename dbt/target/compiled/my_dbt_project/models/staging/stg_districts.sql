SELECT district_id,
    CASE
        WHEN district_name LIKE '%District District' THEN REPLACE(district_name, 'District District', 'District')
        ELSE district_name
    END,
    population,
    CASE
        WHEN governor LIKE '% District' THEN REPLACE(governor, ' District', '')
        WHEN governor = 'AlRoumi' THEN 'Al Roumi'
        ELSE governor
    END
FROM public.raw_districts