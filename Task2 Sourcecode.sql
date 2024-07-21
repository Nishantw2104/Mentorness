USE nish;

-- Q1
SELECT 
count(*) as total_null_values
FROM corona_virus_dataset
WHERE confirmed IS NULL
   OR deaths IS NULL
   OR recovered IS NULL;
 
-- Q2
alter table corona_virus_dataset
add column ID INT Auto_increment PRIMARY KEY FIRST;
UPDATE corona_virus_dataset
SET province = COALESCE(province, 0),
	longitude = COALESCE(longitude, 0),
    confirmed = COALESCE(confirmed, 0),
    confirmed = COALESCE(confirmed, 0),
    confirmed = COALESCE(confirmed, 0),
    deaths = COALESCE(deaths, 0),
    recovered = COALESCE(recovered, 0)
where id > Null;

-- Q3
SELECT COUNT(*) AS total_rows
FROM corona_virus_dataset;

-- Q4
SELECT MIN(date) AS start_date, MAX(date) AS end_date
FROM corona_virus_dataset;

-- Q5
SELECT COUNT(DISTINCT DATE_FORMAT(date, '%Y-%m')) AS total_months
FROM corona_virus_dataset;

-- Q6
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       AVG(confirmed) AS avg_confirmed,
       AVG(deaths) AS avg_deaths,
       AVG(recovered) AS avg_recovered
FROM corona_virus_dataset
GROUP BY month
Order BY month;

-- Q7
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS Month, Confirmed,
    COUNT(Confirmed) AS Frequency
FROM corona_virus_dataset
GROUP BY Month, Confirmed
ORDER BY Month, Frequency DESC;

SELECT
    DATE_FORMAT(Date, '%Y-%m') AS Month, Deaths,
    COUNT(Deaths) AS Frequency
FROM corona_virus_dataset
GROUP BY Month, Deaths
ORDER BY Month, Frequency DESC;

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, Recovered,
    COUNT(Recovered) AS Frequency
FROM corona_virus_dataset
GROUP BY Month, Recovered
ORDER BY Month, Frequency DESC;

-- Q8
SELECT YEAR(date) AS year,
       MIN(confirmed) AS min_confirmed,
       MIN(deaths) AS min_deaths,
       MIN(recovered) AS min_recovered
FROM corona_virus_dataset
GROUP BY year;

-- Q9
SELECT YEAR(date) AS year,
       MAX(confirmed) AS max_confirmed,
       MAX(deaths) AS max_deaths,
       MAX(recovered) AS max_recovered
FROM corona_virus_dataset
GROUP BY year;

-- Q10
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(confirmed) AS total_confirmed,
       SUM(deaths) AS total_deaths,
       SUM(recovered) AS total_recovered
FROM corona_virus_dataset
GROUP BY month
Order By month;

-- Q11
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(confirmed) AS total_confirmed,
       AVG(confirmed) AS avg_confirmed,
       VARIANCE(confirmed) AS var_confirmed,
       STDDEV(confirmed) AS stdev_confirmed
FROM corona_virus_dataset
GROUP BY month
Order By month;

-- Q12
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(deaths) AS total_deaths,
       AVG(deaths) AS avg_deaths,
       VARIANCE(deaths) AS var_deaths,
       STDDEV(deaths) AS stdev_deaths
FROM  corona_virus_dataset
GROUP BY month
Order By Month;

-- Q13
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(recovered) AS total_recovered,
       AVG(recovered) AS avg_recovered,
       VARIANCE(recovered) AS var_recovered,
       STDDEV(recovered) AS stdev_recovered
FROM corona_virus_dataset
GROUP BY month
Order By month;

-- Q14
SELECT Province, SUM(confirmed) AS total_confirmed
FROM corona_virus_dataset
GROUP BY Province
ORDER BY total_confirmed DESC
LIMIT 1;

-- Q15
SELECT Province, SUM(deaths) AS total_deaths
FROM  corona_virus_dataset
GROUP BY Province
ORDER BY total_deaths ASC
LIMIT 1;


-- Q16
SELECT Province, SUM(Recovered) AS total_recovered
FROM corona_virus_dataset
GROUP BY Province
ORDER BY total_recovered DESC
LIMIT 5;

