create database fuel_prices;
SELECT *FROM  fuel_demand;
-- Average fuel prices by country
SELECT 
country, 
AVG(petrol_usd_liter) AS avg_petrol_price,
AVG(diesel_usd_liter)AS avg_diesel_price,
AVG(lpg_usd_liter)AS avg_lpg_prices
 FROM fuel_demand
 GROUP BY country
 ORDER BY avg_petrol_price DESC;
--  MONTHLY AVERAGE PETROL PRICES TREND
SELECT
year(date)AS year,
MONTH(date)AS month,
AVG(petrol_usd_liter)AS 
avg_petrol_price
FROM fuel_demand
GROUP BY YEAR(date), MONTH(date)
ORDER BY year,month;
-- TOP 5 COUNTRIES WITH HIGHEST PETROL PRICES
SELECT country,
MAX(petrol_usd_liter)AS max_Petrol_price
FROM fuel_demand
GROUP BY country
ORDER BY max_petrol_price DESC
LIMIT  5;
-- CORRELATION IDEA : TAX VS PETROL PRICE
SELECT 
country,
AVG(tax_percentage)AS avg_tax,
AVG(petrol_usd_liter)AS 
avg_petrol_price
FROM fuel_demand
GROUP BY country
ORDER BY avg_tax DESC;

-- REGION-WISE FUEL PRICE COMPARISON
SELECT 
region,
AVG(petrol_usd_liter)AS avg_petrol,
avg(diesel_usd_liter)AS avg_diesel
FROM fuel_demand
GROUP BY region
ORDER BY avg_petrol DESC;
