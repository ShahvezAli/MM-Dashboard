with source_data as (
    select * from 
    {{ source('a2mend_data_set', 'users_c5')}}
)
select * from source_data where user_type = 'Mentor'
