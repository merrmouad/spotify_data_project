SELECT 
    song_id,
    artist_name,
    song_name,
    COUNT(CASE WHEN event_type = 'play' THEN 1 END) AS total_plays,
    COUNT(CASE WHEN event_type = 'skip' THEN 1 END) AS total_skips

FROM {{ ref('silver') }}
GROUP BY song_id, artist_name, song_name
ORDER BY total_plays DESC
