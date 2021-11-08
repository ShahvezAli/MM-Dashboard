with source_data as (
    select * from 
    {{ source('everett_community_college_data_set', 'users_c9')}}
)
select * from source_data where user_type = 'Mentor'
