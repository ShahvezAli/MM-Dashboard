with source_data as (
    select * from 
    {{ source('college_of_alameda_data_set', 'users_c8')}}
)
select * from source_data where user_type = 'Mentee'
