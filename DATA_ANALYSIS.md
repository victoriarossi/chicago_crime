# Chicago Crime 2023
## Information
**Author:** Rossi Victoria. 
**Email:** victoria_rossi2@outlook.com
**LinkedIn:** [Victoria Rossi](https://www.linkedin.com/in/victoria-rossi-44690215a/)

## Crime analysis
### Total count of registered crimes:
```
SELECT 
    count(*) as total_records
FROM 
    "chicago_crime";
```

**Results:**
total_records|
-------------|
258030|

### Earliest and latest date of recorded crimes in 2023:
```
SELECT 
    MIN(date) as earliest, MAX(date) as latest
FROM 
    "chicago_crime"
WHERE 
    EXTRACT(YEAR from date)::numeric = '2023';
```

**Results:**
      earliest       |       latest        
---------------------+---------------------
 2023-01-15 05:05:00 | 2023-12-31 23:59:00