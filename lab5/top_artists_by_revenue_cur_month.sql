select  
  a.artist_id,  
  a.name,  
  sum(f.revenue_amount) as total_revenue,  
  round(sum(f.revenue_amount)::numeric / nullif(count(*),0),6) as avg_revenue_per_play  
from fact_stream_event f  
join dim_artist a on f.artist_id = a.artist_id  
where f.event_time >= date_trunc('month', now())
group by a.artist_id, a.name  
order by total_revenue desc  
limit 5;  