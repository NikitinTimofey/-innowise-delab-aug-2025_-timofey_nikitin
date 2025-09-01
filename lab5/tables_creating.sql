create table dim_time (  
  time_id int8 generated always as identity primary key,  
  day_date date not null,  
  hour_ts timestamptz not null,  
  year int4,  
  quarter int4,  
  month int4,  
  day int4,  
  hour int4,  
  minute int4,  
  day_of_week text,  
  is_weekend boolean  
);  
  
create table dim_user (  
  user_id uuid primary key,  
  username text,  
  email_hash text,  
  country text,  
  region text,  
  birth_year int4,  
  age_group text,  
  subscription_tier text,  
  signup_at timestamptz  
);  
  
create table dim_artist (  
  artist_id uuid primary key,  
  name text,  
  country text,  
  genre_primary text  
);  
  
create table dim_track (  
  track_id uuid primary key,  
  title text,  
  album_id uuid,  
  artist_id uuid references dim_artist(artist_id),  
  genre text,  
  duration_seconds int4,  
  release_date date  
);  
  
create table dim_device (  
  device_id uuid primary key,  
  device_type text,  
  os text,  
  app_version text  
);  
  
create table fact_stream_event (  
  fact_stream_event_id int8 generated always as identity primary key,  
  event_time timestamptz not null,  
  time_id int8 references dim_time(time_id),  
  user_id uuid references dim_user(user_id),  
  track_id uuid references dim_track(track_id),  
  artist_id uuid references dim_artist(artist_id),  
  device_id uuid references dim_device(device_id),  
  playlist_id uuid,  
  session_id uuid,  
  play_duration_seconds int4 not null,  
  track_duration_seconds int4 not null,  
  percent_played numeric(5,2) generated always as (play_duration_seconds::numeric / nullif(track_duration_seconds,0) * 100) stored,  
  is_complete boolean not null,  
  is_skip boolean not null,  
  revenue_amount numeric(12,4) default 0.0,  
  quality text,  
  country text,  
  created_at timestamptz default now()  
);  