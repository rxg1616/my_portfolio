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

# Check the full date range
range(dive_data$date, na.rm = TRUE)

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
    width = 5
  ) +
  scale_y_reverse() +
  scale_x_date(
    limits = range(dive_data$date, na.rm = TRUE),
    date_breaks = "3 months",
    date_labels = "%b %Y",
    expand = expansion(mult = c(0.01, 0.01))
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

depth_plot

ggsave(
  "figures/dive_depth_over_time.png",
  depth_plot,
  width = 12,
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

depth_distribution

ggsave(
  "figures/dive_depth_distribution.png",
  depth_distribution,
  width = 9,
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
    width = 20
  ) +
  scale_x_date(
    limits = range(dive_data$date, na.rm = TRUE),
    date_breaks = "3 months",
    date_labels = "%b %Y",
    expand = expansion(mult = c(0.01, 0.01))
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

monthly_plot

ggsave(
  "figures/dives_by_month.png",
  monthly_plot,
  width = 12,
  height = 6,
  dpi = 300
)


# ============================================================
# Visualization 4: Number of Dives by Depth Range
# ============================================================

depth_ranges <- dive_data %>%
  mutate(
    depth_range = cut(
      max_depth_num,
      breaks = c(0, 10, 20, 30, 40, 50, Inf),
      labels = c(
        "0–10 m",
        "10–20 m",
        "20–30 m",
        "30–40 m",
        "40–50 m",
        "50+ m"
      ),
      include.lowest = TRUE
    )
  ) %>%
  count(depth_range)

depth_range_plot <- ggplot(
  depth_ranges,
  aes(
    x = depth_range,
    y = n
  )
) +
  geom_col() +
  labs(
    title = "Number of Dives by Depth Range",
    x = "Maximum Depth Range",
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

depth_range_plot

ggsave(
  "figures/dives_by_depth_range.png",
  depth_range_plot,
  width = 9,
  height = 6,
  dpi = 300
)