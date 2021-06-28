WITH active_tasks AS (
	SELECT
		*
	FROM
		TMTask t
	WHERE
		trashed = 0
		AND status <> 3
		-- Show all projects
		-- AND project is null 
)
SELECT
	*
FROM
	active_tasks;