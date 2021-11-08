with source_data as (
    select * from {{ source('mentor_match_dashboard_data_set', 'users')}}
)
select * from source_data where user_type = 'Mentor'
