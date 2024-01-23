/*
    Chicago Crime
*/

DROP TABLE IF EXISTS "chicago_crime";

--CASE#,DATE  OF OCCURRENCE,BLOCK, IUCR, PRIMARY DESCRIPTION, SECONDARY DESCRIPTION, LOCATION DESCRIPTION,ARREST,
-- DOMESTIC,BEAT,WARD,FBI CD,X COORDINATE,Y COORDINATE,LATITUDE,LONGITUDE,LOCATION
CREATE TABLE "chicago_crime" (
    "id" SERIAL PRIMARY KEY,
    "case_number" TEXT,
    "date" TIMESTAMP,
    "block" TEXT,
    "iucr" TEXT,
    "primary_type" TEXT,
    "description" TEXT,
    "location_description" TEXT,
    "arrest" BOOLEAN,
    "domestic" BOOLEAN,
    "beat" TEXT,
    "ward" TEXT,
    "fbi_code" TEXT,
    "x_coordinate" TEXT,
    "y_coordinate" TEXT,
    "latitude" REAL,
    "longitude" REAL,
    "location" TEXT
);

-- Import csv from wheverever you have it stored.  Note the delimiter.
COPY "chicago_crime" 
FROM '/Users/victoriarossi/Desktop/~/UIC/1ro/Projects/chicago-crime/Chicago_Crimes_2023_updated.csv'
DELIMITER ',' CSV HEADER;
