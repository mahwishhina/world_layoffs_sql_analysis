-- Exploratory Data Analysis


-- Query to see maximum laid off companies

SELECT *
FROM layoffs2024_2;

SELECT Max(Laid_Off_Count)
FROM layoffs2024_2
;

SELECT *
FROM layoffs2024_2
WHERE Laid_Off_Count = (SELECT MAX(Laid_Off_Count)
						FROM layoffs2024_2)
;

SELECT MAX(Laid_Off_Count), MIN(Percentage)
FROM layoffs2024_2
WHERE Percentage > 0;

SELECT *
FROM layoffs2024_2
WHERE Percentage = 1;


SELECT *
FROM layoffs2024_2
WHERE Percentage = 1
ORDER BY Funds_Raised DESC;

SELECT *
FROM layoffs2024_2
WHERE Percentage = 1
ORDER BY Laid_Off_Count DESC;


SELECT Company, Laid_Off_Count
FROM layoffs2024_2
ORDER BY Laid_Off_Count DESC
LIMIT 10;

SELECT Company, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY Company
ORDER BY 2 DESC
LIMIT 10;

SELECT Location_HQ, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY Location_HQ
ORDER BY 2 DESC
LIMIT 10;

SELECT Country, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY Country
ORDER BY 2 DESC
LIMIT 10;


SELECT `Date`, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY `Date`
ORDER BY 1 DESC;


SELECT YEAR(Date), SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY YEAR(Date)
ORDER BY 1 ASC
;


SELECT Industry, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY Industry
ORDER BY 2 DESC;


SELECT Company, AVG(Percentage)
FROM layoffs2024_2
GROUP BY Company
ORDER BY 2 DESC;

SELECT Location_HQ, ROUND(AVG(Percentage),2)
FROM layoffs2024_2
GROUP BY Location_HQ
ORDER BY 2 DESC;


SELECT Industry, ROUND(AVG(Percentage),2)
FROM layoffs2024_2
GROUP BY Industry
ORDER BY 2 DESC;


SELECT SUBSTRING(`Date`,6,2) AS `MONTH`, SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY `MONTH`;

SELECT SUBSTRING(`Date`,1,7) AS `MONTH`, SUM(Laid_Off_Count) AS TotalLaid_Off
FROM layoffs2024_2
WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

WITH Rolling_Total AS
(
	SELECT SUBSTRING(`Date`,1,7) AS `MONTH`, SUM(Laid_Off_Count) AS TotalLaid_Off
	FROM layoffs2024_2
	WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
	GROUP BY `MONTH`
	ORDER BY 1 ASC
)
SELECT `MONTH`, TotalLaid_Off, SUM(TotalLaid_Off) OVER(ORDER BY `MONTH`) AS Rolling_Total
FROM Rolling_Total;


SELECT Company, YEAR(Date), SUM(Laid_Off_Count)
FROM layoffs2024_2
GROUP BY Company, YEAR(Date)
ORDER BY 3 DESC;

WITH Company_Year AS
(
	SELECT Company, YEAR(Date) Years, SUM(Laid_Off_Count) Laid_Off
	FROM layoffs2024_2
	GROUP BY Company, YEAR(Date)
),
Company_Year_Rank AS
(
	SELECT *, DENSE_RANK() OVER(Partition By Years ORDER BY Laid_Off DESC) AS Ranking
	FROM Company_Year
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 10
ORDER BY Years;