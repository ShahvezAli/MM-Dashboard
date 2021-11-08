with source_data as (
    select users.id, users.first_name, users.last_name, users.email, old_colleges.degree, old_colleges.department, old_colleges.university, 
	old_colleges.created_at, old_colleges.updated_at, users.gender, users.ethnicity, users.age,
        CASE WHEN users.age  BETWEEN '1' AND '17' THEN 'below 18 year'
        WHEN users.age BETWEEN '18' AND '30' THEN '(18 - 30) year'
        WHEN users.age BETWEEN '31' AND '50' THEN '(31 - 50) year'
        WHEN users.age BETWEEN '51' AND '70' THEN '(51 - 70) year'
        WHEN users.age  BETWEEN '71' AND '150' THEN '70+ year'
        WHEN users.age is null THEN 'N/A'
        END AS age_range
    from {{ source('dashboard_data_set', 'mm_mentors')}} users
    inner join  {{ source('dashboard_data_set', 'mm_old_colleges')}} old_colleges
    on old_colleges.mentor_id =  users.id
),
final as (
    select * from source_data
)
select * from final
