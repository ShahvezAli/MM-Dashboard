with source_data as (
    select * from 
    {{ source('mentor_community_college_data_set', 'users_c3')}}
)
select * from source_data where user_type = 'Mentee'
