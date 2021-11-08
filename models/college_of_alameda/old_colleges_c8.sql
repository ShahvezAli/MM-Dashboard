with source_data as (
    select colleges.id, colleges.department, colleges.mentor_id, colleges.degree, colleges.university, 
        colleges.created_at, colleges.updated_at from
    {{ source('public_college_of_alameda_data_set', 'mm_old_colleges')}} colleges
    inner join {{ source('college_of_alameda_data_set', 'users_c8')}} users
    on colleges.mentor_id = users.id
)
select * from source_data
