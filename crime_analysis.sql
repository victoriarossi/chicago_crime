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

-- Amount of crime per type in 2023
SELECT primary_type, count(*) AS crime_amount
FROM "chicago_crime"
WHERE EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY primary_type;

-- Most common crime type in 2023 w/ avg
SELECT primary_type, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "chicago_crime" WHERE EXTRACT(YEAR from date)::numeric = '2023')) AS percentage
FROM "chicago_crime"
WHERE EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY primary_type;

-- Month with more crime in 2023
SELECT to_char(date, 'Month') as month, count(*) AS crime_amount
FROM "chicago_crime"
WHERE EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY month
ORDER BY crime_amount DESC
LIMIT 1;

-- Percentage of arrests among all recorded incidents.
SELECT 
    CASE WHEN arrest = 't' THEN 'Arrest' ELSE 'No arrest' END AS arrest_status,
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "chicago_crime" WHERE EXTRACT(YEAR from date)::numeric = '2023')) AS percentage
FROM "chicago_crime"    
WHERE EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY arrest_status;

-- Most Common Location for Theft:
-- Identify the most common location description for theft incidents.

-- Crime Distribution Across Wards:
-- Determine the distribution of crimes across different wards.

-- Time Analysis:
-- Analyze the distribution of crimes over time, considering the date of occurrence.

-- Domestic Violence Incidents:
-- Find the number of domestic incidents and the percentage of total incidents they represent.

-- High-Risk Blocks:
-- Identify the block with the highest number of reported crimes.

-- Geospatial Analysis:
-- Explore the distribution of crimes based on latitude and longitude.
