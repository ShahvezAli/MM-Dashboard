with source_data as (
    select * from 
    {{ source('public_college_of_alameda_data_set', 'mm_users')}}
)
select * from source_data where user_type = 'College' and college_name = 'College of Alameda'