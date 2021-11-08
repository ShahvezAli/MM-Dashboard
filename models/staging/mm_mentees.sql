with source_data as (
    select users.id, users.password, users.user_type, users.uuid, users.email, users.college_name, users.slug, users.image, 
        users.is_active, users.is_profile_complete, users.birthdate, users.first_name, users.last_name, users.college_id,
        users.description, users.sign_in_count, users.last_sign_in_at, users.last_sign_in_ip, users.other_gender_id,
        users.welcome_message, users.college_location, users.state_college_id, users.current_sign_in_at, users.current_sign_in_ip,
        users.state_university_id, users.is_online, users.age, users.gender, users.ethnicity, users.age_range,
        college_mentees.created_at, college_mentees.updated_at
    from {{ source('dashboard_data_set', 'mm_users')}} users
    inner join  {{ source('dashboard_data_set', 'mm_college_mentees')}} college_mentees
    on college_mentees.mentee_id =  users.id
    where users.user_type = 'Mentee'
)
select * from source_data
