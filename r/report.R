suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(scales))

theme_set(
  theme_bw() +
    theme(
      panel.grid.minor = element_blank()
    )
)

# -------------------------------------------------

d <- read_tsv("data/filename.tsv")

d |>
  # filter(...) |>
  ggplot(aes(...)) +
  geom_point(alpha = 0.3, color = "darkgreen", stroke = 0, size = 2.5) +
  scale_x_datetime(
    breaks = date_breaks("week"),
    labels = date_format("%m/%d")
  ) +
  scale_y_continuous(labels = comma) +
  expand_limits(y = 0) +
  NULL

# -------------------------------------------------
