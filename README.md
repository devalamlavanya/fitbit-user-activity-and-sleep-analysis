# Fitbit User Activity and Sleep Analysis

This project analyzes Fitbit Fitness Tracker data to uncover user activity patterns, sedentary behaviour, and sleep habits. Using Excel for data cleaning, SQL (Google BigQuery) for analysis, and Tableau for visualization, the project transforms raw fitness tracking data into meaningful insights through an end-to-end data analytics workflow.

## Project Overview

* **Data Source:** Fitbit Fitness Tracker Data (available on Kaggle)
  https://www.kaggle.com/datasets/arashnic/fitbit

* **Objective:** Clean, transform, and analyze daily activity and sleep tracking data to understand user behaviour, classify activity levels, and evaluate sleep efficiency.

---

## Key Steps

### 1. Data Exploration

* Analyzed `dailyactivity_merged.csv`, containing daily activity metrics such as steps, distance, active minutes, sedentary minutes, and calories for **35 unique users**.
* Analyzed `sleepday_merged.csv`, containing sleep records, minutes asleep, and time in bed for **24 unique users**.

### 2. Data Cleaning (Excel)

* Removed three duplicate records from the sleep dataset.
* Checked both datasets for missing values using Excel filters and `COUNTBLANK()`.
* Verified that no missing values were present.

### 3. Data Formatting

* Converted the `Id` column to Whole Number format.
* Standardised `ActivityDate` and `SleepDay` into matching Short Date format to support accurate joins.

### 4. SQL Analysis (Google BigQuery)

* Joined activity and sleep datasets using `Id` and Date.
* Calculated average activity metrics and sleep statistics.
* Identified the most active users and highest activity days.
* Measured sleep efficiency using the ratio of time asleep to time spent in bed.
* Classified users into Low, Moderate, and High activity groups using `CASE WHEN`.

---

## Key Features

* Data cleaning and validation using Excel
* SQL analysis using joins, aggregations, subqueries, and `CASE WHEN`
* User activity classification based on average daily steps
* Sleep efficiency analysis
* Interactive Tableau dashboard with KPIs and visualisations

---

## Tools Used

* Microsoft Excel
* Google BigQuery (SQL)
* Tableau

---

## Dashboard Highlights

* Daily activity trend
* Activity level distribution
* Activity vs. sleep relationship
* Sedentary behaviour analysis
* Sleep efficiency comparison

---

## Future Enhancements

* Include additional Fitbit datasets such as heart rate and weight logs for deeper analysis.
* Automate data refresh using scheduled cloud queries.
* Expand the dashboard with additional user-level filters and KPIs.
