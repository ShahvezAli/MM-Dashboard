{% macro set_gender(column_name) %}
	{% if column_name == '1' %}
		'Male'
	{% endif %}

	{% if column_name == '2' %}
		'Female'
	{% endif %}

        {% if column_name == '3' %}
                'Other'
        {% endif %}
        {% if column_name == null %}
                ''
        {% endif %}
{% endmacro %}


{% macro calculate_percent(total_user, type_user) %}
	({{type_user}} * 100) / {{total_user}}
{% endmacro %}


{% macro current_timestamp() -%}
  {{ return(adapter.dispatch('current_timestamp', 'dbt_utils')()) }}
{%- endmacro %}


{% macro datediff(first_date, second_date, diff_in) %}
  {{ return(adapter.dispatch('datediff', 'dbt_utils')(first_date, second_date, diff_in)) }}
{% endmacro %}

{% macro concat(fields) -%}
  {{ return(adapter.dispatch('concat', 'dbt_utils')(fields)) }}
{%- endmacro %}

{% macro user_college_name(id, college_id, college_name) %}
  {% if id == college_id %}
	college_name
  {% else%}
	'N/A'
  {% endif %}
{% endmacro %}
