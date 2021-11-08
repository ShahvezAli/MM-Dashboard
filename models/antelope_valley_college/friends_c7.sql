with source_data as (
    select * from 
    {{ source('public_antelope_valley_college_data_set', 'mm_friends')}}
)
select * from source_data