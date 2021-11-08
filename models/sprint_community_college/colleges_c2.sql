with source_data as (
    select * from 
    {{ source('public_sprint_community_college_data_set', 'mm_users')}}
)
select * from source_data where user_type = 'College' and college_name = 'Sprint Community College'