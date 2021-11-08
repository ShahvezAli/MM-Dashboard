with source_data as (
    select * from 
    {{ source('headerlabs_data_set', 'users_c6')}}
)
select * from source_data where user_type = 'Mentee'
