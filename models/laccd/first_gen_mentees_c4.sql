with source_data as (
    select *
    from {{ source('laccd_data_set', 'users_c4')}} users
    inner join {{ source('laccd_data_set', 'description_users_c4')}} description_users
    on description_users.user_id =  users.id
    where description_users.user_description_id = 5
),
final as (
    select * from source_data
)
select * from final
