# ============================================================
# Garmin Dive Data - Data Wrangling
# ============================================================

# 1. Load Required Libraries
library(tidyverse)
library(janitor)

# 2. Import the Garmin CSV
raw_dive_data <- read_csv(
  "/Users/rilei/Documents/EVR628 Class Fall 2026/my_portfolio/scripts/01_processing/Activities.csv"
)
# 3. Clean column names
raw_dive_data <- raw_dive_data %>%
  clean_names()

# Check column names
names(raw_dive_data)

# 4. Clean and standardize data
cleaned_dive_data <- raw_dive_data %>%
  
  # Filter out non-dive activities
  filter(
    str_detect(
      activity_type,
      regex("dive", ignore_case = TRUE)
    )
  ) %>%
  
  mutate(
    # Parse date
    date = as.Date(date),
    
    # Convert maximum depth to numeric
    max_depth_num = as.numeric(
      str_remove_all(max_depth, "[^0-9.]")
    )
  ) %>%
  
  # Remove duplicate rows
  distinct() %>%
  
  # Remove empty rows and columns
  remove_empty(c("rows", "cols"))

# 5. View clean dataset
glimpse(cleaned_dive_data)

# 6. Export processed data as RDS
write_rds(
  cleaned_dive_data,
  "cleaned_garmin_dives.rds"
)