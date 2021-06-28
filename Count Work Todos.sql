WITH work_todos AS (
	SELECT
		*
	FROM
		TMTask t
		JOIN TMArea a ON t.area = a.uuid
	WHERE
		trashed = 0
		AND status <> 3
		AND a.uuid in('Euumv3Pyzpv4QXbBZKmn7n',
			'3wdSmtRBdoeCMrLSF2WKvr')
),
active_tasks AS (
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
	w.title, 
	count(*) as count_tasks
FROM
	active_tasks a
	JOIN work_todos w ON a.project = w.uuid
GROUP BY a.project
order by count(*) desc;