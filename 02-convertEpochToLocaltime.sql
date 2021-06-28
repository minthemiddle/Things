-- v1
SELECT
	title,
	datetime (creationDate,
		'unixepoch',
		'localtime')
FROM
	TMTask;


-- v2

with tasks_with_creation as (
SELECT
	title,
	strftime('%Y-%m-%d', datetime (creationDate,
		'unixepoch',
		'localtime')) as creation_date
FROM
	TMTask
)

select * from tasks_with_creation order by creation_date desc;

