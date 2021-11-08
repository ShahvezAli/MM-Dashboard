with source_data as (
    select * from 
    {{ source('laccd_data_set', 'users_c4')}}
)
select * from source_data where user_type = 'Mentee'
