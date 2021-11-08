with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['id'])}} as {{ adapter.quote('id')}},
        {{ json_extract_scalar('_airbyte_data', ['type'])}} as {{ adapter.quote('user_type')}},
        {{ json_extract_scalar('_airbyte_data', ['uuid'])}} as {{ adapter.quote('uuid')}},
        {{ json_extract_scalar('_airbyte_data', ['email'])}} as {{ adapter.quote('email')}},
        {{ json_extract_scalar('_airbyte_data', ['image'])}} as {{ adapter.quote('image')}},
        {{ json_extract_scalar('_airbyte_data', ['active'])}} as {{ adapter.quote('active')}},
        {{ json_extract_scalar('_airbyte_data', ['complete'])}} as {{ adapter.quote('is_profile_complete')}},
        {{ json_extract_scalar('_airbyte_data', ['birthdate'])}} as {{ adapter.quote('birthdate')}},
        {{ json_extract_scalar('_airbyte_data', ['gender_id'])}} as {{ adapter.quote('gender')}},
        {{ json_extract_scalar('_airbyte_data', ['ethnicity_id'])}} as {{ adapter.quote('ethnicity')}},
        {{ json_extract_scalar('_airbyte_data', ['last_name'])}} as {{ adapter.quote('last_name')}},
        {{ json_extract_scalar('_airbyte_data', ['college_id'])}} as {{ adapter.quote('college_id')}},
        {{ json_extract_scalar('_airbyte_data', ['college_name'])}} as {{ adapter.quote('college_name')}},
        {{ json_extract_scalar('_airbyte_data', ['slug'])}} as {{ adapter.quote('slug')}},
        {{ json_extract_scalar('_airbyte_data', ['created_at'])}} as {{ adapter.quote('created_at')}},
        {{ json_extract_scalar('_airbyte_data', ['first_name'])}} as {{ adapter.quote('first_name')}},
        {{ json_extract_scalar('_airbyte_data', ['updated_at'])}} as {{ adapter.quote('updated_at')}},
        {{ json_extract_scalar('_airbyte_data', ['description'])}} as {{ adapter.quote('description')}},
        {{ json_extract_scalar('_airbyte_data', ['sign_in_count'])}} as {{ adapter.quote('sign_in_count')}},
        {{ json_extract_scalar('_airbyte_data', ['last_sign_in_at'])}} as {{ adapter.quote('last_sign_in_at')}},
        {{ json_extract_scalar('_airbyte_data', ['last_sign_in_ip'])}} as {{ adapter.quote('last_sign_in_ip')}},
        {{ json_extract_scalar('_airbyte_data', ['other_gender_id'])}} as {{ adapter.quote('other_gender_id')}},
        {{ json_extract_scalar('_airbyte_data', ['welcome_message'])}} as {{ adapter.quote('welcome_message')}},
        {{ json_extract_scalar('_airbyte_data', ['college_location'])}} as {{ adapter.quote('college_location')}},
        {{ json_extract_scalar('_airbyte_data', ['state_college_id'])}} as {{ adapter.quote('state_college_id')}},
        {{ json_extract_scalar('_airbyte_data', ['current_sign_in_at'])}} as {{ adapter.quote('current_sign_in_at')}},
        {{ json_extract_scalar('_airbyte_data', ['current_sign_in_ip'])}} as {{ adapter.quote('current_sign_in_ip')}},
        {{ json_extract_scalar('_airbyte_data', ['state_university_id'])}} as {{ adapter.quote('state_university_id')}},
        {{ json_extract_scalar('_airbyte_data', ['encrypted_password'])}} as {{ adapter.quote('password')}},
        {{ json_extract_scalar('_airbyte_data', ['is_online'])}} as {{ adapter.quote('is_online')}}
    from {{ source('staging_data_set', '_airbyte_raw_users')}}
),
user_data as (
    select
        cast({{ adapter.quote('id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('id') }},
        cast({{ adapter.quote('user_type') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('user_type') }},
        cast({{ adapter.quote('uuid') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('uuid') }},
        cast({{ adapter.quote('email') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('email') }},
        cast({{ adapter.quote('image') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('image') }},
        cast({{ adapter.quote('active') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('is_active') }},
        cast({{ adapter.quote('is_profile_complete') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('is_profile_complete') }},
        cast({{ adapter.quote('birthdate') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('birthdate') }},
        cast({{ adapter.quote('gender') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('gender') }},
        cast({{ adapter.quote('ethnicity') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('ethnicity') }},
        cast({{ adapter.quote('last_name') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('last_name') }},
        cast({{ adapter.quote('college_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('college_id') }},
        cast({{ adapter.quote('college_name') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('college_name') }},
        cast({{ adapter.quote('slug') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('slug') }},
        cast({{ adapter.quote('created_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('created_at') }},
        cast({{ adapter.quote('first_name') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('first_name') }},
        cast({{ adapter.quote('updated_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('updated_at') }},
        cast({{ adapter.quote('description') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('description') }},
        cast({{ adapter.quote('sign_in_count') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('sign_in_count') }},
        cast({{ adapter.quote('last_sign_in_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('last_sign_in_at') }},
        cast({{ adapter.quote('last_sign_in_ip') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('last_sign_in_ip') }},
        cast({{ adapter.quote('other_gender_id') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('other_gender_id') }},
        cast({{ adapter.quote('welcome_message') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('welcome_message') }},
        cast({{ adapter.quote('college_location') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('college_location') }},
        cast({{ adapter.quote('state_college_id') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('state_college_id') }},
        cast({{ adapter.quote('current_sign_in_at') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('current_sign_in_at') }},
        cast({{ adapter.quote('current_sign_in_ip') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('current_sign_in_ip') }},
        cast({{ adapter.quote('state_university_id') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('state_university_id') }},
        cast({{ adapter.quote('password') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('password') }},
        cast({{ adapter.quote('is_online') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('is_online') }}
    from source_data
),
final as (
    select
        id, password, user_type, uuid, email, image, is_active, is_profile_complete, birthdate, first_name, last_name, created_at, updated_at,
        college_id, description, sign_in_count, last_sign_in_at, last_sign_in_ip, other_gender_id, welcome_message, college_name, slug,
        college_location, state_college_id, current_sign_in_at, current_sign_in_ip, state_university_id, is_online,
        {{ datediff('birthdate', current_timestamp(), 'year') }} as age,
        CASE WHEN (gender = '1') THEN 'Male'
        WHEN (gender = '2') THEN 'Female'
        WHEN (gender = '3') THEN 'Other'
        WHEN gender is null THEN 'N/A'
        END AS gender,
        CASE WHEN (ethnicity = '1') THEN 'American Indian or Alaska Native'
        WHEN (ethnicity = '2') THEN 'Asian'
        WHEN (ethnicity = '3') THEN 'Black or African American'
        WHEN (ethnicity = '4') THEN 'Native Hawaiian or Other Pacific Islander'
        WHEN (ethnicity = '5') THEN 'White'
        WHEN (ethnicity = '6') THEN 'Hispanic or Latino'
        WHEN (ethnicity = '7') THEN 'Bi-Cultural'
        WHEN ethnicity is null THEN 'N/A'
        END AS ethnicity
    from user_data
)
select
        id, password, user_type, uuid, email, college_name, slug, image, is_active, is_profile_complete, birthdate, first_name, last_name, created_at, updated_at,
        college_id, description, sign_in_count, last_sign_in_at, last_sign_in_ip, other_gender_id, welcome_message,
        college_location, state_college_id, current_sign_in_at, current_sign_in_ip, state_university_id, is_online, age,  gender, ethnicity,
        CASE WHEN age  BETWEEN '1' AND '17' THEN 'below 18 year'
	WHEN age BETWEEN '18' AND '30' THEN '(18 - 30) year'
        WHEN age BETWEEN '31' AND '50' THEN '(31 - 50) year'
        WHEN age BETWEEN '51' AND '70' THEN '(51 - 70) year'
        WHEN age  BETWEEN '71' AND '150' THEN '70+ year'
        WHEN age is null THEN 'N/A'
        END AS age_range
from final
