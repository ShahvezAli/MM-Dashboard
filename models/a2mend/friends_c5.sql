with source_data as (
    select * from 
    {{ source('public_a2mend_data_set', 'mm_friends')}}
)
select * from source_data