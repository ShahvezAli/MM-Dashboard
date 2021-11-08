with source_data as (
    select * from 
    {{ source('public_mentor_match_community_college_data_set', 'mm_description_users')}}
)
select * from source_data