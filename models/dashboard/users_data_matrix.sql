with mentee_users as (
   select 
	count(1) as total_user_count,
	count(1) filter (where (user_type = 'Mentee')) as total_mentee_count,
        count(1) filter (where (user_type = 'Mentor')) as total_mentor_count,
        count(1) filter (where (user_type = 'College')) as total_college_count,
        count(1) filter (where (user_type = 'Admin')) as total_admin_count,
	count(1) filter (where (user_type = 'Mentee' and gender = 'Male')) as total_male_mentee,
	count(1) filter (where (user_type = 'Mentor' and gender = 'Male')) as total_male_mentor,
        count(1) filter (where (user_type = 'Mentee' and gender = 'Female')) as total_female_mentee,
        count(1) filter (where (user_type = 'Mentor' and gender = 'Female')) as total_female_mentor,
	count(1) filter (where (user_type = 'Mentee' and date(updated_at) > NOW() - INTERVAL '1' MONTH)) as last_month_active_mentee,
        count(1) filter (where (user_type = 'Mentor' and date(updated_at) > NOW() - INTERVAL '1' MONTH)) as last_month_active_mentor,
        count(1) filter (where (user_type = 'Mentee' and is_profile_complete = 'false')) as total_incomplete_profile_mentee,
        count(1) filter (where (user_type = 'Mentor' and is_profile_complete = 'false')) as total_incomplete_profile_mentor,
        count(1) filter (where (user_type = 'Mentee' and date(created_at) > NOW() - INTERVAL '7' DAY)) as last_week_newly_active_mentee,
        count(1) filter (where (user_type = 'Mentor' and date(created_at) > NOW() - INTERVAL '7' DAY)) as last_week_newly_active_mentor
   from {{ source('mentor_match_dashboard_data_set', 'users')}}
),
final as (
    select
	total_user_count,
	total_mentee_count,
        ((total_mentee_count::numeric(16, 2)*100)/total_user_count)::numeric(16, 2) as mentee_percent,
	total_male_mentee,
	total_female_mentee,
	last_month_active_mentee,
	last_week_newly_active_mentee,
	total_incomplete_profile_mentee,
        ((total_incomplete_profile_mentee::numeric(16, 2)*100)/total_mentee_count)::numeric(16, 2) as incomplete_profile_mentee_percent,
	total_mentor_count,
	((total_mentor_count::numeric(16, 2)*100)/total_user_count)::numeric(16, 2) as mentor_percent,
	total_male_mentor,
	total_female_mentor,
	last_month_active_mentor,
	last_week_newly_active_mentor,
	total_incomplete_profile_mentor,
	((total_incomplete_profile_mentor::numeric(16, 2)*100)/total_mentor_count)::numeric(16, 2) as incomplete_profile_mentor_percent,
	total_college_count
    from mentee_users
)
select * from final
