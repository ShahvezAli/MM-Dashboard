with source_data as (
    select users.id, users.user_type, concat(users.first_name,  ' ', users.last_name) as name, users.email, users.gender, users.age, users.ethnicity,
        users.age_range, mm_contacts.friend_id as friend_id, mm_contacts.friendable_id, mm_contacts.status, mm_contacts.created_at as created_on,
        mm_contacts.updated_at as updated_on
    from {{ source('dashboard_data_set', 'mm_users')}} users
    inner join  {{ source('dashboard_data_set', 'mm_friends')}} mm_contacts
    on mm_contacts.friendable_id =  users.id
    where mm_contacts.status= '2' and mm_contacts.friendable_type = 'User'
),
friend_source_data as (
    select source_data.id, source_data.user_type, source_data.name, source_data.email, friend_user.email as firend_email,
	{{ datediff( 'created_on',  'updated_on', 'second') }} as response_time, concat(friend_user.first_name, ' ', friend_user.last_name) as firend_name,
	 source_data.status, created_on, updated_on
    from source_data
    inner join {{ source('dashboard_data_set', 'mm_users')}} friend_user
    on friend_id = friend_user.id
),
final as (
        select * from friend_source_data
)
select * from final
