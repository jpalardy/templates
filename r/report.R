library(tidyverse)

theme_set(
  theme_bw() +
    theme(
      panel.grid.minor = element_blank()
    )
)

# -------------------------------------------------

d <- read_tsv("data/data.tsv")

d |>
  # filter(...) |>
  ggplot(aes(x, y)) +
  geom_point(alpha = 0.3, color = "darkgreen", stroke = 0, size = 2.5) +
  # scale_x_datetime(breaks = scales::date_breaks("week"), labels = scales::date_format("%m/%d")) +
  scale_y_continuous(labels = scales::comma) +
  expand_limits(y = 0) +
  NULL

# -------------------------------------------------
