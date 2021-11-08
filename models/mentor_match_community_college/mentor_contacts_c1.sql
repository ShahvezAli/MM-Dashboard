with source_data as (
    select contacts.id as contact_id, users.id as mentor_id, users.first_name, users.last_name, users.email, contacts.friend_id,
        contacts.friendable_id, contacts.status, contacts.created_at as created_on, contacts.updated_at as updated_on,
        users.gender, users.age, users.ethnicity, users.age_range
    from {{ source('mentor_match_community_college_data_set', 'mentors_c1')}} users
    inner join {{ source('mentor_match_community_college_data_set', 'friends_c1')}} contacts
    on contacts.friendable_id =  users.id
    where contacts.friendable_type = 'User'
),
friend_source_data as (
    select contact_id as id, mentor_id, concat(source_data.first_name, ' ', source_data.last_name) as mentor_name, source_data.email as mentor_email,
        source_data.status, created_on, updated_on, {{ datediff( 'created_on',  'updated_on', 'second') }} as response_time,
        concat(friends.first_name, ' ', friends.last_name) as mentee_name, friends.id as mentee_id, friends.email as mentee_email, 
        source_data.gender, source_data.ethnicity, source_data.age, source_data.age_range
    from source_data
    inner join {{ source('mentor_match_community_college_data_set', 'users_c1')}} friends
    on friend_id = friends.id
),
final as (
        select * from friend_source_data
)
select * from final
