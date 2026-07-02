# 🌍 World Layoffs Data Analysis using MySQL
## 📌 Project Overview

This project demonstrates an end-to-end SQL data analysis workflow using a real-world dataset of global layoffs from **2022–2024**. The project begins with extensive data cleaning to improve data quality, followed by exploratory data analysis (EDA) to uncover workforce reduction trends across companies, industries, countries, and time periods.

The primary objective was to transform raw data into a clean and reliable dataset before performing business-focused analysis to generate meaningful insights.

## 📊 Dataset Overview

This dataset focuses on global layoffs between **2022 and 2024** and provides information about workforce reductions across multiple industries and countries. It enables the analysis of layoff trends, company performance, funding stages, and geographic impacts.

### Purpose

The dataset was analyzed to help answer questions such as:

- Which companies experienced the largest layoffs?
- Which industries were most affected?
- Which countries experienced the highest workforce reductions?
- How did layoffs change over time?
- Which companies laid off the highest percentage of employees?
- What trends can be observed across funding stages?

### Source

The dataset was obtained from **Kaggle**, a popular platform for data science and machine learning datasets.

## Project Workflow

The project was completed in two major phases:

### Phase 1 – 🧹 Data Cleaning

The raw dataset contained duplicate records, inconsistent formatting, missing values, and unnecessary columns. Before analysis, the data was cleaned to improve accuracy and consistency.

#### Data Cleaning Tasks
- Standardized inconsistent values
- Removed duplicate records
- Identified and handled NULL and blank values
- Converted date columns into proper SQL date format
- Removed unnecessary rows and columns
- Created a cleaned dataset for analysis

#### Key SQL Techniques Used
> CREATE TABLE, INSERT INTO, ALTER TABLE, DROP COLUMN<br>
> UPDATE, MODIFY for correlating inconsistent values<br>
> STR_TO_DATE() for date formatting<br>
> ROW_NUMBER()<br>
> Common Table Expressions (CTEs)<br>
> WHERE ROW_NUM > 1 for filtering duplicates

### Phase 2 – 🔍 Exploratory Data Analysis (EDA)

After cleaning the dataset, SQL queries were used to explore trends and answer business-related questions.

#### Analysis Performed
- Companies with the largest layoffs
- Companies with 100% workforce reductions
- Total layoffs by company
- Total layoffs by industry
- Total layoffs by country
- Layoffs by funding stage
- Yearly layoff trends
- Monthly rolling total of layoffs
- Ranking companies by layoffs within each year

#### Key SQL Concepts Used

> MAX() ; MIN()<br>
> SUM() ; AVG() ; ROUND()<br>
> GROUP BY ; ORDER BY ; LIMIT ; WHERE<br>
> SUBSTRING()<br>
> DENSE_RANK() ; CTEs ; Window Functions<br>

## Key Business Questions Answered

This project explores several business questions, including:

- Which companies reported the highest number of layoffs?
- Which industries experienced the largest workforce reductions?
- Which countries were most affected?
- How have layoffs changed over time?
- Which funding stages experienced the greatest layoffs?
- Which companies had the highest layoffs within each year?
- What are the monthly cumulative layoff trends?

## Skills Demonstrated

#### SQL
- Data Cleaning
- Exploratory Data Analysis
- Window Functions
- Common Table Expressions (CTEs)
- Aggregate Functions
- Date Functions
- Ranking Functions

#### Data Analysis
- Data Preparation
- Trend Analysis
- Business Insight Generation
- Data Validation
- Data Transformation

#### Tools
- MySQL
- MySQL Workbench
- Git
- GitHub

## Key Takeaways

Through this project, I strengthened my ability to:

- Clean and prepare real-world datasets
- Write efficient SQL queries
- Perform exploratory data analysis
- Use window functions and CTEs
- Extract meaningful business insights from raw data
- Organize SQL projects using professional repository practices

## Author

**Mahwish Farhan**  
Data Analytics | SQL | Tableau | Power BI | Python
