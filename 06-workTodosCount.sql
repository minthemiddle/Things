-- Show all work projects
-- Work: Euumv3Pyzpv4QXbBZKmn7n AND
-- Work Projects: 3wdSmtRBdoeCMrLSF2WKvr

WITH work_todos as (
SELECT
	*
FROM
	TMTask t
JOIN TMArea a on t.area = a.uuid 
WHERE
	trashed = 0
	AND status <> 3
	AND a.uuid in ('Euumv3Pyzpv4QXbBZKmn7n', '3wdSmtRBdoeCMrLSF2WKvr')
)

SELECT uuid from work_todos;