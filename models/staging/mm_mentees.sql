with source_data as (
    select * from {{ source('dashboard_data_set', 'mm_users')}}
)
select * from source_data where user_type = 'Mentee'
