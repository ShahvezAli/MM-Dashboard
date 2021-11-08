with source_data as (
    select * from 
    {{ source('public_laccd_data_set', 'mm_friends')}}
)
select * from source_data