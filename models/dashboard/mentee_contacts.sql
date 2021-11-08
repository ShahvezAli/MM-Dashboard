with source_data as (
    select users.id, users.first_name, users.last_name, users.email, contacts.friend_id, contacts.friendable_id, contacts.status,
	contacts.created_at as created_on, contacts.updated_at as updated_on
    from {{ source('mentor_match_dashboard_data_set', 'mentees')}} users
    inner join  {{ source('mentor_match_dashboard_data_set', 'friends')}} contacts
    on contacts.friendable_id =  users.id
    where contacts.friendable_type = 'User'
),
friend_source_data as (
    select source_data.id as mentee_id, concat(source_data.first_name, ' ', source_data.last_name) as mentee_name, source_data.email as mentee_email,
        source_data.status, created_on, updated_on, {{ datediff( 'created_on',  'updated_on', 'second') }} as response_time,
        concat(friends.first_name, ' ', friends.last_name) as mentor_name, friends.id as mentor_id, friends.email as mentor_email
    from source_data
    inner join {{ source('mentor_match_dashboard_data_set', 'users')}} friends
    on friend_id = friends.id
),
final as (
        select * from friend_source_data
)
select * from final
