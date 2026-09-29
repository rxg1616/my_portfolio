# My portfolio for EVR 628

## Author

Rileigh Gonzalez

## Description

This project analyzes personal Garmin dive activity data to explore diving patterns over time, including dive frequency, maximum dive depth, and the distribution of dive depths. The project uses R to clean, transform, summarize, and visualize the Garmin activity data in order to better understand personal diving activity and trends.


## Repository Contents

### Raw Data

* **`Activities (2).csv`** — Raw Garmin activity data exported from Garmin Connect.

  * **Location:** `scripts/01_processing/Activities (2).csv`
  * **Source:** Garmin Connect

### R Scripts

* **Data Wrangling Script**

  * **Location:** `scripts/01_processing/`
  * Used to import, clean, transform, and process the raw Garmin activity data.
  * Exports the cleaned dataset as an RDS file.

* **Visualization Script**

  * **Location:** `scripts/02_visualization/`
  * Used to create exploratory visualizations from the cleaned Garmin dive data.

### Clean Data

* **`cleaned_garmin_dives.rds`**

  * Cleaned and processed Garmin dive dataset.
  * **Location:** `scripts/01_processing/`

### Figures

* **`dive_depth_over_time.png`**

  * Maximum dive depth over time.
  * **Location:** `figures/`

* **`dive_depth_distribution.png`**

  * Distribution of maximum dive depths.
  * **Location:** `figures/`

* **`dives_by_month.png`**

  * Number of dives by month.
  * **Location:** `figures/`

* **`dives_by_depth_range.png`**

  * Number of dives within
