with source_data as (
    select * from 
    {{ source('public_laccd_data_set', 'mm_description_users')}}
)
select * from source_data