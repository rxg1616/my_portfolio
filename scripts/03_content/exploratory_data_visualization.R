# ============================================================
# Garmin Dive Data - Exploratory Visualization
# ============================================================

# 1. Load packages
library(tidyverse)
library(lubridate)

# 2. Read cleaned data
dive_data <- read_rds("cleaned_garmin_dives.rds")

# 3. Inspect data
glimpse(dive_data)

# Create figures folder
dir.create("figures", showWarnings = FALSE)


# ============================================================
# Visualization 1: Maximum Dive Depth Over Time
# ============================================================

depth_plot <- ggplot(
  dive_data,
  aes(
    x = date,
    y = max_depth_num
  )
) +
  geom_col(
    width = 2
  ) +
  scale_y_reverse() +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %Y"
  ) +
  labs(
    title = "Maximum Dive Depth Over Time",
    x = "Date",
    y = "Maximum Depth (m)",
    caption = "Source: Garmin dive activity data"
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      size = 16,
      face = "bold"
    ),
    axis.title = element_text(
      face = "bold"
    ),
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    ),
    plot.caption = element_text(
      hjust = 0,
      size = 9
    )
  )

# Display plot
depth_plot

# Save plot
ggsave(
  "figures/dive_depth_over_time.png",
  depth_plot,
  width = 10,
  height = 6,
  dpi = 300
)


# ============================================================
# Visualization 2: Distribution of Maximum Dive Depth
# ============================================================

depth_distribution <- ggplot(
  dive_data,
  aes(
    x = max_depth_num
  )
) +
  geom_histogram(
    bins = 12,
    boundary = 0
  ) +
  labs(
    title = "Distribution of Maximum Dive Depth",
    x = "Maximum Depth (m)",
    y = "Number of Dives",
    caption = "Source: Garmin dive activity data"
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      size = 16,
      face = "bold"
    ),
    axis.title = element_text(
      face = "bold"
    ),
    plot.caption = element_text(
      hjust = 0,
      size = 9
    )
  )

# Display plot
depth_distribution

# Save plot
ggsave(
  "figures/dive_depth_distribution.png",
  depth_distribution,
  width = 8,
  height = 6,
  dpi = 300
)


# ============================================================
# Visualization 3: Number of Dives by Month
# ============================================================

monthly_dives <- dive_data %>%
  mutate(
    month = floor_date(date, unit = "month")
  ) %>%
  count(month)

monthly_plot <- ggplot(
  monthly_dives,
  aes(
    x = month,
    y = n
  )
) +
  geom_col(
    width = 25
  ) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%b %Y"
  ) +
  labs(
    title = "Number of Dives by Month",
    x = "Month",
    y = "Number of Dives",
    caption = "Source: Garmin dive activity data"
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      size = 16,
      face = "bold"
    ),
    axis.title = element_text(
      face = "bold"
    ),
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    ),
    plot.caption = element_text(
      hjust = 0,
      size = 9
    )
  )

# Display plot
monthly_plot

# Save plot
ggsave(
  "figures/dives_by_month.png",
  monthly_plot,
  width = 10,
  height = 6,
  dpi = 300
)


# ============================================================
# Visualization 4: Average Dive Depth by Activity Type
# ============================================================

activity_summary <- dive_data %>%
  group_by(activity_type) %>%
  summarise(
    average_depth = mean(
      max_depth_num,
      na.rm = TRUE
    )
  )

depth_activity <- ggplot(
  activity_summary,
  aes(
    x = activity_type,
    y = average_depth
  )
) +
  geom_col() +
  labs(
    title = "Average Dive Depth by Activity Type",
    x = "Activity Type",
    y = "Average Maximum Depth (m)",
    caption = "Source: Garmin dive activity data"
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(
      size = 16,
      face = "bold"
    ),
    axis.title = element_text(
      face = "bold"
    ),
    axis.text.x = element_text(
      angle = 30,
      hjust = 1
    ),
    plot.caption = element_text(
      hjust = 0,
      size = 9
    )
  )

# Display plot
depth_activity

# Save plot
ggsave(
  "figures/average_depth_by_activity.png",
  depth_activity,
  width = 9,
  height = 6,
  dpi = 300
)