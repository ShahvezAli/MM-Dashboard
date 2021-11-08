with source_data as (
    select * from 
    {{ source('public_headerlabs_data_set', 'mm_description_users')}}
)
select * from source_data