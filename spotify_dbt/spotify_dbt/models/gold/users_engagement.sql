SELECT 
    user_id,
    device_type,
    country,
    COUNT(CASE WHEN event_type = 'play' THEN 1 END) AS plays,
    COUNT(CASE WHEN event_type = 'skip' THEN 1 END) AS skips,
    COUNT(CASE WHEN event_type = 'add_to_playlist' THEN 1 END) AS playlist_additions,
    DATE_TRUNC('day', event_time) AS date
FROM {{ ref('silver') }}
GROUP BY user_id, device_type, country, DATE_TRUNC('day', event_time)
ORDER BY plays DESC