--This was the query I used in Looker Studio for the Chicago Crime Dashboard

SELECT
  *,
  CASE WHEN arrest IS TRUE THEN 'arrested'
  ELSE 'not arrested'
  END as arrest_count,
	CASE WHEN domestic IS TRUE THEN 'domestic case'
	ELSE 'non-domestic case'
	END as domestic_case_count
FROM `bigquery-public-data.chicago_crime.crime`

;
