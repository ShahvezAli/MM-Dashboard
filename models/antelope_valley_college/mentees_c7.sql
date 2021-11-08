with source_data as (
    select * from 
    {{ source('antelope_valley_college_data_set', 'users_c7')}}
)
select * from source_data where user_type = 'Mentee'
