with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['id'])}} as {{ adapter.quote('id')}},
        {{ json_extract_scalar('_airbyte_data', ['user_id'])}} as {{ adapter.quote('user_id')}},
        {{ json_extract_scalar('_airbyte_data', ['name'])}} as {{ adapter.quote('activity_type')}},
        {{ json_extract_scalar('_airbyte_data', ['count'])}} as {{ adapter.quote('activity_count')}},
        {{ json_extract_scalar('_airbyte_data', ['created_at'])}} as {{ adapter.quote('created_at')}},
        {{ json_extract_scalar('_airbyte_data', ['updated_at'])}} as {{ adapter.quote('updated_at')}}
    from {{ source('staging_data_set', '_airbyte_raw_activities')}}
),
user_data as (
    select
        cast({{ adapter.quote('id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('id') }},
        cast({{ adapter.quote('user_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('user_id') }},
        cast({{ adapter.quote('activity_type') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('activity_type') }},
        cast({{ adapter.quote('activity_count') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('activity_count') }},
        cast({{ adapter.quote('created_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('created_at') }},
        cast({{ adapter.quote('updated_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('updated_at') }}
    from source_data
),
final as (
    select user_data.id, user_data.user_id, user_data.activity_type, user_data.activity_count, user_data.created_at,
        user_data.updated_at, users.age_range, users.ethnicity, users.gender
    from user_data
    inner join {{ source('dashboard_data_set', 'mm_users')}} users
    on user_data.user_id = users.id
)
select * from final
