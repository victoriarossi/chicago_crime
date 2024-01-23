-- Amount of entries in the chicago_crime table
SELECT  count(*) as total_records FROM "chicago_crime";

-- Earliest and latest date of recorded crimes in 2023?
SELECT MIN(date) as earliest, MAX(date) as latest
FROM "chicago_crime"
WHERE EXTRACT(YEAR from date)::numeric = '2023';

-- Amount of crime per month in 2023
SELECT to_char(date, 'MM') as month, count(*) AS crime_amount
FROM "chicago_crime"
WHERE EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY month
ORDER BY month;
