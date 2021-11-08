with source_data as (
    select *
    from {{ source('public_data_set_to_dashboard', 'mm_users')}}
)
select * from source_data where user_type = 'College'
