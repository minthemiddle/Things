WITH tasks_with_creation AS (
	SELECT
		title,
		strftime ('%Y-%m-%d',
			datetime (creationDate,
				'unixepoch',
				'localtime')) AS creation_date
	FROM
		TMTask
)
SELECT
	count(*)
FROM
	tasks_with_creation
WHERE creation_date = date()
ORDER BY
	creation_date DESC;