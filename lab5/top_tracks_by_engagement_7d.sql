select  
  t.track_id,  
  t.title,  
  sum(f.play_duration_seconds) as total_play_seconds,  
  count(*) as play_count,  
  avg(f.percent_played) as avg_percent_played  
from fact_stream_event f  
join dim_track t on f.track_id = t.track_id  
where f.event_time >= now() - interval '7 days'  
group by t.track_id, t.title  
order by total_play_seconds desc  
limit 10;  