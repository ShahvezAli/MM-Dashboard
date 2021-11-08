with source_data as (
    select users.id, users.first_name, users.last_name, users.email, old_colleges.degree, old_colleges.department, old_colleges.university, 
	    old_colleges.created_at, old_colleges.updated_at, users.gender, users.ethnicity, users.age, users.age_range
    from {{ source('mentor_match_community_college_data_set', 'mentors_c1')}} users
    inner join {{ source('mentor_match_community_college_data_set', 'old_colleges_c1')}} old_colleges
    on old_colleges.mentor_id =  users.id
),
final as (
    select * from source_data
)
select * from final
