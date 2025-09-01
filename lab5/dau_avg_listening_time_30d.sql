select  
  date_trunc('day', f.event_time) as day,  
  count(distinct f.user_id) as dau,  
  sum(f.play_duration_seconds) as total_play_seconds,  
  (sum(f.play_duration_seconds)::numeric / nullif(count(distinct f.user_id),0)) as avg_seconds_per_user  
from fact_stream_event f  
where f.event_time >= now() - interval '30 days'  
group by 1  
order by 1;  