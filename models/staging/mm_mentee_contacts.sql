with source_data as (
    select mm_contacts.id as contact_id, users.id as mentee_id, users.first_name, users.last_name, users.email, users.gender, users.age, users.ethnicity, mm_contacts.friend_id, mm_contacts.friendable_id, mm_contacts.status,
        mm_contacts.created_at as created_on, mm_contacts.updated_at as updated_on
    from {{ source('dashboard_data_set', 'mm_mentees')}} users
    inner join  {{ source('dashboard_data_set', 'mm_friends')}} mm_contacts
    on mm_contacts.friendable_id =  users.id
    where mm_contacts.friendable_type = 'User'
),
friend_source_data as (
    select contact_id as id, mentee_id, concat(source_data.first_name, ' ', source_data.last_name) as mentee_name, source_data.email as mentee_email,
	source_data.status, created_on, updated_on, {{ datediff( 'created_on',  'updated_on', 'second') }} as response_time,
	concat(friends.first_name, ' ', friends.last_name) as mentor_name, friends.id as mentor_id, friends.email as mentor_email, source_data.gender,
        source_data.ethnicity, source_data.age,
        CASE WHEN source_data.age  BETWEEN '1' AND '17' THEN 'below 18 year'
        WHEN source_data.age BETWEEN '18' AND '30' THEN '(18 - 30) year'
        WHEN source_data.age BETWEEN '31' AND '50' THEN '(31 - 50) year'
        WHEN source_data.age BETWEEN '51' AND '70' THEN '(51 - 70) year'
        WHEN source_data.age  BETWEEN '71' AND '150' THEN '70+ year'
        WHEN source_data.age is null THEN 'N/A'
        END AS age_range
    from source_data
    inner join {{ source('dashboard_data_set', 'mm_users')}} friends
    on friend_id = friends.id
),
final as (
	select * from friend_source_data
)
select * from final
