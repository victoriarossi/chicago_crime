# Chicago Crime 2023
## Information
**Author:** Rossi Victoria. 
**Email:** victoria_rossi2@outlook.com
**LinkedIn:** [Victoria Rossi](https://www.linkedin.com/in/victoria-rossi-44690215a/)

## Crime analysis
### Total count of registered crimes:
````sql
SELECT 
    count(*) as total_records
FROM 
    "chicago_crime";
````

**Results:**
total_records|
-------------|
258030|

### Earliest and latest date of recorded crimes in 2023:
````sql
SELECT 
    MIN(date) as earliest, MAX(date) as latest
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023';
````

**Results:**
earliest|latest
---------------------|---------------------
2023-01-15 05:05:00|2023-12-31 23:59:00

### Amount of crime per month:
````sql
SELECT 
    to_char(date, 'MM') as month, count(*) AS crime_amount
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY 
    month
ORDER BY 
    month;
````

**Results:**
month|crime_amount
-------|--------------
01|10917
02|18378
03|20665
04|20670
05|22127
06|22566
07|23879
08|24017
09|22421
10|22793
11|21008
12|20685

### Percentage of crime per type of crime
````sql
SELECT 
    primary_type, count(*) AS crime_amount
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY 
    primary_type
````

**Result:**
primary_type|crime_percentage 
-----------------------------------|--------------
ARSON| 0.196%
ASSAULT|     8.698%
BATTERY|    17.033%
BURGLARY|     2.844%
CONCEALED CARRY LICENSE VIOLATION| 0.08%
CRIMINAL DAMAGE|    11.503%
CRIMINAL SEXUAL ASSAULT| 0.606%
CRIMINAL TRESPASS|     1.816%
DECEPTIVE PRACTICE|     6.174%
GAMBLING| 0.006%
HOMICIDE| 0.242%
HUMAN TRAFFICKING| 0.003%
INTERFERENCE WITH PUBLIC OFFICER| 0.228%
INTIMIDATION| 0.088%
KIDNAPPING| 0.054%
LIQUOR LAW VIOLATION| 0.071%
MOTOR VEHICLE THEFT|    11.118%
NARCOTICS|     1.96%
NON-CRIMINAL| 0.001%
OBSCENITY| 0.013%
OFFENSE INVOLVING CHILDREN| 0.658%
OTHER NARCOTIC VIOLATION| 0.001%
OTHER OFFENSE|     5.955%
PROSTITUTION| 0.068%
PUBLIC INDECENCY| 0.002%
PUBLIC PEACE VIOLATION| 0.333%
ROBBERY|     4.232%
SEX OFFENSE| 0.514%
STALKING| 0.19%
THEFT|    22.027%
WEAPONS VIOLATION|     3.287%


 ### Most common crime type in 2023
 ````sql
SELECT 
    primary_type as type, count(*) AS crimes
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY 
    primary_type
ORDER BY 
    crime_amount DESC
LIMIT 1;
````

**Result:**
type|crimes 
--------------|--------------
THEFT|55095

### Month with more crime
````sql
SELECT 
    to_char(date, 'Month') as month, count(*) AS crime_amount
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY 
    month
ORDER BY 
    crime_amount DESC
LIMIT 1;
````

**Result:**
month|crime_amount 
-------|--------------
August|24017

### Crimes per day on the month with most crimes (i.e August)
````sql
SELECT 
    to_char(date, 'day') as day, count(*) AS crime_amount
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023' 
        and to_char(date, 'MM') = '08'
GROUP BY 
    day
ORDER BY 
    crime_amount DESC
````
**Results:**
day|crime_amount
-----------|--------------
thursday|3859
tuesday|3852
wednesday|3769
saturday|3280
friday|3191
sunday|3152
monday|2914


### Percentage of arrests among all recorded incidents
````sql
SELECT 
    CASE WHEN arrest = 't' THEN 'Arrest' ELSE 'No arrest' END AS arrest_status,
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM "chicago_crime" WHERE EXTRACT(YEAR from date)::numeric = '2023')) AS percentage
FROM 
    "chicago_crime"    
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023'
GROUP BY a
    rrest_status;
````

**Result:**
arrest_status|percentage      
---------------|---------------------
Arrest| 11.7592733262435732
No arrest| 88.2407266737564268