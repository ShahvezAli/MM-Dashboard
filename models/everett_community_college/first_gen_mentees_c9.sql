with source_data as (
    select *
    from {{ source('everett_community_college_data_set', 'users_c9')}} users
    inner join {{ source('everett_community_college_data_set', 'description_users_c9')}} description_users
    on description_users.user_id =  users.id
    where description_users.user_description_id = 5
),
final as (
    select * from source_data
)
select * from final
