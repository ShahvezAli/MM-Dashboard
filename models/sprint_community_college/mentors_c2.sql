with source_data as (
    select * from 
    {{ source('sprint_community_college_data_set', 'users_c2')}}
)
select * from source_data where user_type = 'Mentor'
