# My Portfolio for EVR 628

## Author

Rileigh Gonzalez

## Description

This project analyzes personal Garmin dive activity data to explore diving patterns over time, including dive frequency, maximum dive depth, and the distribution of dive depths. Using R and the tidyverse ecosystem, the project imports, cleans, transforms, summarizes, and visualizes Garmin activity data to identify trends in personal diving activity. The workflow is organized to support reproducible data processing and exploratory data visualization.

## Repository Contents

### Raw Data

- **`Activities (2).csv`**
  - Raw Garmin activity data exported from Garmin Connect.
  - **Location:** `scripts/01_processing/Activities (2).csv`
  - **Source:** Garmin Connect

### R Scripts

- **`data_processing.R`**
  - **Location:** `scripts/01_processing/data_processing.R`
  - Imports the raw Garmin activity data.
  - Standardizes column names using `janitor`.
  - Filters for dive-related activities.
  - Converts dates and maximum depth values into appropriate data types.
  - Removes duplicate records and empty rows or columns.
  - Exports the cleaned dataset as CSV and RDS files to the `clean/` directory.

- **`exploratory_data_visualization.R`**
  - **Location:** `scripts/03_content/exploratory_data_visualization.R`
  - Loads the cleaned Garmin dive dataset.
  - Creates exploratory visualizations of maximum dive depth, dive depth distribution, monthly dive frequency, and dive counts by depth range.
  - Saves the resulting figures to the `figures/` directory.

### Clean Data

- **`cleaned_garmin_dives.rds`**
  - Cleaned and processed Garmin dive activity dataset saved as an R object.
  - **Location:** `clean/cleaned_garmin_dives.rds`
  - **Purpose:** Preserves R data types for subsequent analysis.

- **`cleaned_garmin_dives.csv`**
  - Cleaned Garmin dive activity dataset saved as a CSV file.
  - **Location:** `clean/cleaned_garmin_dives.csv`
  - **Purpose:** Provides a portable version of the cleaned dataset for use in other software.

### Figures

All figures are saved in the `figures/` directory as high-resolution PNG files.

- **`dive_depth_over_time.png`**
  - Displays maximum dive depth over time.

- **`dive_depth_distribution.png`**
  - Shows the distribution of maximum dive depths across recorded dives.

- **`dives_by_month.png`**
  - Shows the number of recorded dives by month.

- **`dives_by_depth_range.png`**
  - Summarizes the number of dives within predefined maximum depth ranges.

### Project File

- **`my_portfolio_redo.Rproj`**
  - RStudio project file used to open the project from its root directory and maintain consistent relative file paths.

## Reproducibility

To reproduce the analysis:

1. Open `my_portfolio_redo.Rproj` in RStudio.
2. Ensure the required R packages are installed: `tidyverse`, `janitor`, and `lubridate`.
3. Run `scripts/01_processing/data_processing.R` to import and clean the raw Garmin activity data.
4. Run `scripts/03_content/exploratory_data_visualization.R` to generate the visualizations.
5. Review the resulting cleaned datasets in
