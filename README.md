# 💰 Salary Insights & Compensation Pipeline

## 🚀 Executive Summary
This project is an end-to-end data analysis pipeline designed to uncover hidden trends in global compensation. By transforming messy survey data into a clean, relational database and an interactive dashboard, I addressed key questions regarding education value, the "seniority premium," and geographic pay variances.

## 🏗️ Technical Architecture
1.  **Extraction & Cleaning (Python/Pandas):** Handled currency conversion, standardized categorical fields (Industry, Education), and calculated numeric experience columns.
2.  **Database Management (PostgreSQL):** Loaded data into a structured SQL database for robust querying and outlier detection.
3.  **Advanced Analysis (SQL):** Used `PERCENTILE_CONT` for median-based analysis, `CASE` statements for career bucketing, and arithmetic expressions for bonus-to-salary ratios.
4.  **Data Visualization (Tableau):** Created a Dashboard featuring KPI ribbons, lollipop charts, and distribution box plots.

## 📈 Top 3 Insights
* **The Master's Paradox:** Mid-career Tech professionals with a Master's degree earned only a ~5% median premium ($6,250) over Bachelor's degree holders, indicating a high-cost, low-speed ROI for advanced education in software engineering.
* **The Bonus Ceiling:** Additional compensation peaks at the "Senior" level (11-20 years experience) rather than the Executive level, showing that performance incentives are most aggressive for high-level individual contributors.
* **Data Integrity:** Inital analysis showed Alaska as the highest paying state ($232k avg), but SQL investigation revealed a $10M outlier. Shifting to Median analysis revealed the true market reality of ~$72k.

## 📁 Repository Structure
* `notebooks/`: Python scripts for data cleaning and ETL.
* `sql/`: Core analysis queries including median pay and education ROI.
* `data/`: Sample CSV of the cleaned data.
* `dashboard/`: Screenshots and links to the Tableau Public dashboard.
* <img width="1437" height="862" alt="Screenshot 2026-04-20 at 09 38 56" src="https://github.com/user-attachments/assets/0db60178-06f9-42eb-9df7-3fd24a18cd7c" />


## 🛠️ How to Replicate
1.  Run the Jupyter Notebook to clean the raw CSV.
2.  Import the resulting CSV into PostgreSQL.
3.  Execute `analysis_queries.sql` to verify statistics.
4.  Connect Tableau Public to the Postgres DB or the cleaned CSV to view visuals.
