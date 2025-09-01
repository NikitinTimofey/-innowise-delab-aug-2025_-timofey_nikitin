select  
  d.device_type,  
  count(*) filter (where f.is_complete) as completes,  
  count(*) as total,  
  round(100.0 * count(*) filter (where f.is_complete) / nullif(count(*),0),2) as complete_rate_pct  
from fact_stream_event f  
join dim_device d on f.device_id = d.device_id  
where f.event_time >= now() - interval '30 days'  
group by d.device_type  
order by complete_rate_pct desc;