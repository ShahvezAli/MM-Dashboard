with source_data as (
    select users.id as id, college.id as user_college_id, users.password as password, users.user_type as user_type, 
        users.uuid as uuid, users.email as email, users.college_name as college_name, users.slug as slug, users.image as image,
        users.is_active as is_active, users.is_profile_complete as is_profile_complete, users.birthdate as birthdate,
        users.first_name as first_name, users.last_name as last_name, users.created_at as created_at, users.updated_at as updated_at,
        users.college_id as college_id, users.description as description, users.sign_in_count as sign_in_count,
        users.last_sign_in_at as last_sign_in_at, users.last_sign_in_ip as last_sign_in_ip, users.other_gender_id as other_gender_id,
        users.welcome_message as welcome_message, users.college_location as college_location, users.state_college_id as state_college_id,
        users.current_sign_in_at as current_sign_in_at, users.current_sign_in_ip as current_sign_in_ip, users.state_university_id as state_university_id,
        users.is_online as is_online, users.age as age, users.gender as gender, users.ethnicity as ethnicity, users.age_range as age_range from
    {{ source('public_everett_community_college_data_set', 'mm_users')}} users
    inner join {{ source('public_everett_community_college_data_set', 'mm_colleges')}} college
    on college.id =  users.college_id
    where college.college_name = 'Everett Community College'
)
select id, password, user_type, uuid, email, college_name, slug, image, is_active, is_profile_complete, birthdate, 
        first_name, last_name, created_at, updated_at, college_id, description, sign_in_count, last_sign_in_at, 
        last_sign_in_ip, other_gender_id, welcome_message, college_location, state_college_id, current_sign_in_at, 
        current_sign_in_ip, state_university_id, is_online, age, gender, ethnicity, age_range 
    from source_data