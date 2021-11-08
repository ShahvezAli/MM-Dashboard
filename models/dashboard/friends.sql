with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['id'])}} as {{ adapter.quote('id')}},
        {{ json_extract_scalar('_airbyte_data', ['status'])}} as {{ adapter.quote('status')}},
        {{ json_extract_scalar('_airbyte_data', ['friend_id'])}} as {{ adapter.quote('friend_id')}},
        {{ json_extract_scalar('_airbyte_data', ['friendable_id'])}} as {{ adapter.quote('friendable_id')}},
        {{ json_extract_scalar('_airbyte_data', ['bloker_id'])}} as {{ adapter.quote('bloker_id')}},
        {{ json_extract_scalar('_airbyte_data', ['friendable_type'])}} as {{ adapter.quote('friendable_type')}},
        {{ json_extract_scalar('_airbyte_data', ['created_at'])}} as {{ adapter.quote('created_at')}},
        {{ json_extract_scalar('_airbyte_data', ['updated_at'])}} as {{ adapter.quote('updated_at')}}
    from {{ source('staging_data_set_to_dashboard', '_airbyte_raw_friendships')}}
),
bind_type_source_data as (
    select
        cast({{ adapter.quote('id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('id') }},
        cast({{ adapter.quote('status') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('status') }},
        cast({{ adapter.quote('friend_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('friend_id') }},
        cast({{ adapter.quote('friendable_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('friendable_id') }},
        cast({{ adapter.quote('bloker_id') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('bloker_id') }},
        cast({{ adapter.quote('friendable_type') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('friendable_type') }},
        cast({{ adapter.quote('created_at') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('created_at') }},
        cast({{ adapter.quote('updated_at') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('updated_at') }}
    from source_data
),
final as (
    select * from bind_type_source_data
)
select * from final
