with source_data as (
    select
        {{ json_extract_scalar('_airbyte_data', ['id'])}} as {{ adapter.quote('id')}},
        {{ json_extract_scalar('_airbyte_data', ['degree_id'])}} as {{ adapter.quote('degree')}},
        {{ json_extract_scalar('_airbyte_data', ['department'])}} as {{ adapter.quote('department')}},
	{{ json_extract_scalar('_airbyte_data', ['university_id'])}} as {{ adapter.quote('university')}},
	{{ json_extract_scalar('_airbyte_data', ['mentor_id'])}} as {{ adapter.quote('mentor_id')}},
	{{ json_extract_scalar('_airbyte_data', ['created_at'])}} as {{ adapter.quote('created_at')}},
	{{ json_extract_scalar('_airbyte_data', ['updated_at'])}} as {{ adapter.quote('updated_at')}}
    from {{ source('staging_data_set_to_dashboard', '_airbyte_raw_old_colleges')}}
),
bind_type_source_data as (
    select
        cast({{ adapter.quote('id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('id') }},
        cast({{ adapter.quote('degree') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('degree') }},
        cast({{ adapter.quote('department') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('department') }},
        cast({{ adapter.quote('university') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('university') }},
        cast({{ adapter.quote('mentor_id') }} as {{ dbt_utils.type_int()}}) as {{ adapter.quote('mentor_id') }},
        cast({{ adapter.quote('created_at') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('created_at') }},
        cast({{ adapter.quote('updated_at') }} as {{ dbt_utils.type_string()}}) as {{ adapter.quote('updated_at') }}
    from source_data
),
final as (
    select id, department, mentor_id, created_at, updated_at,
	CASE WHEN degree = '1' THEN 'AA/AS'
	WHEN degree = '2' THEN 'BA/BS'
	WHEN degree = '3' THEN 'MA/MS'
	WHEN degree = '4' THEN 'Ed.D/Ph.D'
        WHEN degree = '5' THEN 'JD'
        WHEN degree is null THEN 'N/A'
        END AS degree,
	university
    from bind_type_source_data
)
select * from final
