# Exercise 7: Data visualisation using ggplot() 

# For further inspiration, a great resource is From Data to Viz, which explains different plot types, when to use them, and how to create them in ggplot.
# https://www.data-to-viz.com/ 

library(dplyr)
library(ggplot2)


# Part 1: Create a basic scatterplot
names(V_Dem)
str(V_Dem)
summary(V_Dem)

V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem)) +
  geom_point()

# Part 2: Add aesthetics
V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem, color = continent)) +
  geom_point()

V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem, color = government)) +
  geom_point()

# Part 3: Add multiple geometries
V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem, color = continent)) +
  geom_point() +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, color = "black") +
  geom_hline(
    yintercept = mean(V_Dem_plot$v2x_libdem, na.rm = TRUE),
    linetype = "dashed"
  )

# Part 4: Modify the appearance of the plot
V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem, color = continent)) +
  geom_point() +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, color = "black") +
  geom_hline(
    yintercept = mean(V_Dem_plot$v2x_libdem, na.rm = TRUE),
    linetype = "dashed"
  ) +
  scale_x_continuous(
    breaks = seq(0, 1, 0.1),
    name = "Military dimension of executive power"
  ) +
  scale_y_continuous(
    breaks = seq(0, 1, 0.1),
    name = "Liberal democracy"
  ) +
  labs(
    color = "Continent",
    title = "Military influence and liberal democracy"
  ) +
  theme_minimal()

# Part 5: Create a histogram
V_Dem %>%
  ggplot(aes(x = v2x_libdem)) +
  geom_histogram(bins = 10)

V_Dem %>%
  ggplot(aes(x = v2x_libdem, fill = continent)) +
  geom_histogram(bins = 10, position = "dodge")

# Part 6: Create a boxplot
V_Dem %>%
  ggplot(aes(x = continent, y = v2x_libdem)) +
  geom_boxplot()

V_Dem %>%
  ggplot(aes(x = v2x_libdem, y = continent)) +
  geom_boxplot()

# Part 7: Use faceting
V_Dem %>%
  ggplot(aes(x = v2x_ex_military, y = v2x_libdem)) +
  geom_point() +
  facet_wrap(~government) +
  labs(
    x = "Military dimension of executive power",
    y = "Liberal democracy",
    title = "Military influence and liberal democracy by government type"
  ) +
  theme_minimal()


# Part 8: Save a plot
ggsave(
  filename = "exercise7_plot.pdf",
  width = 10,
  height = 8,
  device = "pdf"
)
