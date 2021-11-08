with source_data as (
    select activities.id, activities.user_id, activities.activity_type, activities.activity_count,
    activities.created_at, activities.updated_at, activities.age_range, activities.gender, activities.ethnicity
    from
    {{ source('public_a2mend_data_set', 'mm_activities')}} activities
    inner join {{ source('a2mend_data_set', 'users_c5')}} users
    on activities.user_id =  users.id    
)
select * from source_data
