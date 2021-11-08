with source_data as (
    select *
    from {{ source('sprint_community_college_data_set', 'users_c2')}} users
    inner join {{ source('sprint_community_college_data_set', 'description_users_c2')}} description_users
    on description_users.user_id =  users.id
    where description_users.user_description_id = 5
),
final as (
    select * from source_data
)
select * from final
