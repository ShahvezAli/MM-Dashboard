with source_data as (
    select * from 
    {{ source('public_college_of_alameda_data_set', 'mm_friends')}}
)
select * from source_data