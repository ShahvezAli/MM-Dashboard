with source_data as (
    select * from 
    {{ source('mentor_match_community_college_data_set', 'users_c1')}}
)
select * from source_data where user_type = 'Mentor'
