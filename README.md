# Chicago Crime 
## Introduction
An SQL analysis of crime within the City of Chicago and under the jurisdiction of Chicago Police Department (CPD).
- [Data Analysis](./DATA_ANALYSIS.md)

## Datasets used
The dataset used was downloaded from [City of Chicago](https://www.chicago.gov/city/en/dataset/crime.html) and can be found under the name "Chicago_Crimes_2023.csv".   
<ins>*Note:*</ins> the file used in this analysis is "Chicago_Crimes_2023_updated.csv" which was created through a python file in order to add an ID as primary key. 

## Getting Started
### Prerequisites
Make sure you have the following installed:
- postgresql

### Installation
Clone the repository:
``` 
git clone https://github.com/victoriarossi/chicago_crime.git
```

### Usage
This project was created and executed on the Mac OS X operating system.
1. Start a postgre server
   ```
   pg_ctl -D /usr/local/var/postgres start
   ```
2. Access the server
   ```
   psql postgres
   ```
3. Create the schema
   ```
   \i sql_schema.sql
   ```
4. Run the script
   ```
   \i crime_analysis.sql
   ```
