
WITH daily_reservations AS (
    SELECT
        queue_id,
		CURRENT_DATE  as date,
        COUNT(id) AS reservation_count
    FROM reservation
	WHERE DATE(join_at) = CURRENT_DATE
    GROUP BY queue_id, DATE(join_at)
)

SELECT
    queue_id,
	date,
    SUM(reservation_count) AS total_reservations
FROM daily_reservations
GROUP BY queue_id, date