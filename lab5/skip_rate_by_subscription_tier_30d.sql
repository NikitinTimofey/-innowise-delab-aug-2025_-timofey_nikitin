select  
  u.subscription_tier,  
  count(*) filter (where f.is_skip) as skips,  
  count(*) as total_play_events,  
  round(100.0 * count(*) filter (where f.is_skip) / nullif(count(*),0),2) as skip_rate_pct  
from fact_stream_event f  
join dim_user u on f.user_id = u.user_id  
where f.event_time >= now() - interval '30 days'  
group by u.subscription_tier  
order by skip_rate_pct desc;  