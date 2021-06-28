WITH completed_tasks_today AS (
	SELECT
		t.title,
		t.project,
		strftime ('%Y-%m-%d',
			datetime (t.stopDate,
				'unixepoch',
				'localtime')) AS stop_date
	FROM
		TMTask t
		JOIN TMTask p ON t.project = p.uuid
),
active_projects AS (
	SELECT
		uuid,
		title,
		CASE WHEN area in('Euumv3Pyzpv4QXbBZKmn7n',
			'3wdSmtRBdoeCMrLSF2WKvr') THEN
			'work'
		ELSE
			'private'
		END AS TYPE
	FROM
		TMTask t
	WHERE
		trashed = 0
		AND status <> 3
		AND area NOT NULL
)
SELECT
	type,
	count(*) as tasks_done
FROM
	completed_tasks_today ctt
	JOIN active_projects ap ON ctt.project = ap.uuid
WHERE
	stop_date = date()
GROUP BY type;