with source_data as (
    select * from {{ source('dashboard_data_set', 'mm_users')}} users
    inner join  {{ source('dashboard_data_set', 'mm_college_mentees')}} college_mentees
    on college_mentees.mentee_id =  users.id
)
select * from source_data
