-- SQL Data Cleaning Project


SELECT *
FROM layoffs2024
;

-- Now we do data cleaning and follow a few steps:
-- 1. standardize data 
-- 2. check for duplicates and remove any
-- 3. Look at null values or blank vaues
-- 4. remove any columns and rows that are not necessary

-- 1. Standardize data 

-- Create a staging table to clean the data

CREATE TABLE layoffs2024_1
LIKE layoffs2024
;

INSERT layoffs2024_1
SELECT *
FROM layoffs2024
;

SELECT *
FROM layoffs2024_1
;

-- Remove Date_Added column which is not necessary

ALTER TABLE layoffs2024_1
DROP COLUMN Date_Added;

SELECT *
FROM layoffs2024_1
;

-- set data type of Date column as it is 'text' we have to change it to 'date'

SELECT `Date`,
STR_TO_DATE(`Date`, '%m/%d/%Y')
FROM layoffs2024_1
;

UPDATE layoffs2024_1
SET `Date` = STR_TO_DATE(`Date`, '%m/%d/%Y')
;


ALTER TABLE layoffs2024_1
MODIFY COLUMN `Date` DATE;

SELECT *
FROM layoffs2024_1
;


-- 2. Remove Duplicates
# First check for duplicates

SELECT *
FROM layoffs2024_1;

SELECT *,
ROW_NUMBER() OVER(Partition by Company, Location_HQ, Industry, Laid_Off_Count, `Date`, Funds_Raised, Stage, 
Country, Percentage) AS Row_num
FROM layoffs2024_1
;


WITH Duplicates_CTE AS
(
	SELECT *,
	ROW_NUMBER() OVER(Partition by Company, Location_HQ, Industry, Laid_Off_Count, `Date`, Funds_Raised, Stage, 
    Country, Percentage) AS Row_num
	FROM layoffs2024_1
) 
SELECT *
FROM Duplicates_CTE 
WHERE Row_num > 1
;

-- these are the ones we want to delete where the row number is > 1 

SELECT *
FROM layoffs2024_1
WHERE Company = 'Beyond Meat';

SELECT *
FROM layoffs2024_1
WHERE Company = 'Cazoo';

-- now rewrite it like this

WITH Duplicates_CTE AS
(
	SELECT *,
	ROW_NUMBER() OVER(Partition by Company, Location_HQ, Industry, Laid_Off_Count, `Date`, Funds_Raised, Stage, 
    Country, Percentage) AS Row_num
	FROM layoffs2024_1
) 
DELETE
FROM Duplicates_CTE 
WHERE Row_num > 1
;

-- we are not able to delete it like this so we have to add a new column Row_num in order to delete row numbers greater than 1
-- so we have to create another table and add row_num

CREATE TABLE `layoffs2024_2` (
  `Company` text,
  `Location_HQ` text,
  `Industry` text,
  `Laid_Off_Count` text,
  `Date` date DEFAULT NULL,
  `Funds_Raised` int DEFAULT NULL,
  `Stage` text,
  `Country` text,
  `Percentage` text,
  `Row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs2024_2;

INSERT INTO layoffs2024_2
SELECT *,
	ROW_NUMBER() OVER(Partition by Company, Location_HQ, Industry, Laid_Off_Count, `Date`, Funds_Raised, Stage, 
    Country, Percentage) AS Row_num
FROM layoffs2024_1;

SELECT *
FROM layoffs2024_2
WHERE Row_num > 1;

-- we can now delete rows where row_num > 1

DELETE
FROM layoffs2024_2
WHERE Row_num > 1;

-- we can check Cazoo and Beyond Meat to verify if they are deleted

SELECT *
FROM layoffs2024_2
WHERE Company = 'Beyond Meat';

SELECT *
FROM layoffs2024_2
WHERE Company = 'Cazoo';

-- they are now deleted
SELECT *
FROM layoffs2024_2;


-- 3. Look at null or blank vaues
-- 4. Remove any columns and rows that are not necessary

-- Lets look at the data with no values in Laid_Off_Count & Percentage column

SELECT *
FROM layoffs2024_2
WHERE Laid_Off_Count = ''
and Percentage = '';

-- Since we don't have any laid off information for these companies we can delete them from table

DELETE
FROM layoffs2024_2
WHERE Laid_Off_Count = ''
and Percentage = '';

SELECT *
FROM layoffs2024_2;

-- We have to get rid off Row_num column, we don't need it anymore

ALTER TABLE layoffs2024_2
DROP COLUMN Row_num;

-- We have a clean and standarize table 

SELECT *
FROM layoffs2024_2
;

