with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['user_id'])}} as {{ adapter.quote('user_id')}},
        {{ json_extract_scalar('_airbyte_data', ['user_description_id'])}} as {{ adapter.quote('user_description_id')}}
    from {{ source('staging_data_set', '_airbyte_raw_user_descriptions_users')}}
),
final as (
    select
        cast({{ adapter.quote('user_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('user_id') }},
        cast({{ adapter.quote('user_description_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('user_description_id') }}
    from source_data
)
select * from final
