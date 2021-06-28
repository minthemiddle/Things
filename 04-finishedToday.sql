WITH tasks_with_completion AS (
	SELECT
		title,
		strftime ('%Y-%m-%d',
			datetime (stopDate,
				'unixepoch',
				'localtime')) AS stop_date
	FROM
		TMTask
)
SELECT
	count(*)
FROM
	tasks_with_completion
WHERE stop_date = date()
ORDER BY
	stop_date DESC;