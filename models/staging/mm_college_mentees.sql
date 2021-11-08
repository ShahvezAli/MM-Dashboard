with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['id'])}} as {{ adapter.quote('id')}},
        {{ json_extract_scalar('_airbyte_data', ['mentee_id'])}} as {{ adapter.quote('mentee_id')}},
        {{ json_extract_scalar('_airbyte_data', ['college_id'])}} as {{ adapter.quote('college_id')}},
        {{ json_extract_scalar('_airbyte_data', ['created_at'])}} as {{ adapter.quote('created_at')}},
        {{ json_extract_scalar('_airbyte_data', ['updated_at'])}} as {{ adapter.quote('updated_at')}}
    from {{ source('staging_data_set', '_airbyte_raw_colleges_mentees')}}
),
bind_type_source_data as (
    select
        cast({{ adapter.quote('id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('id') }},
        cast({{ adapter.quote('mentee_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('mentee_id') }},
        cast({{ adapter.quote('college_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('college_id') }},
        cast({{ adapter.quote('created_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('created_at') }},
        cast({{ adapter.quote('updated_at') }} as {{ dbt_utils.type_timestamp()}}) as {{ adapter.quote('updated_at') }}
    from source_data
),
final as (
    select * from bind_type_source_data
)
select * from final
