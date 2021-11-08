with source_data as (
    select *
    from {{ source('dashboard_data_set', 'mm_users')}} users
    inner join {{ source('dashboard_data_set', 'mm_description_users')}} description_users
    on description_users.user_id =  users.id
    where description_users.user_description_id = 5
),
final as (
    select * from source_data
)
select * from final
