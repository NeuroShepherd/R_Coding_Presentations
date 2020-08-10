
# Turn mtcars into a .csv to later demonstrate read-in of it
# mtcars %>% 
#  tibble::rownames_to_column(var = "car_name") %>%
#  write_csv("./Intro to the Tidyverse/mtcars.csv", na="")

install.packages("tidyverse") # Run 1 time
library(tidyverse)

# Pipe
read_csv("./Intro to the Tidyverse/mtcars.csv", na="") %>%
  select(-c(qsec,drat)) %>%
  dplyr::filter(mpg > 15 | am == 0) %>%
  mutate(hp_lvl = cut(hp, 3, labels=c("low","medium","high"))) %>%
  mutate_at(vars(mpg), ~round(.)) %>%
  arrange(desc(wt)) %>%
  group_by(hp_lvl) %>%
  summarize(mean_mpg = mean(mpg), sd_mpg = sd(mpg))


# No pipe
summarize(group_by(arrange(mutate_at(mutate(dplyr::filter(select(
  read_csv("./Intro to the Tidyverse/mtcars.csv", na=""), -c(qsec,drat)), mpg > 15 | am == 0), 
  hp_lvl = cut(hp, 3, labels=c("low","medium","high"))), vars(mpg), ~round(.)), desc(wt)), hp_lvl), 
  mean_mpg = mean(mpg), sd_mpg = sd(mpg))


# Pipe to plot

read_csv("./Intro to the Tidyverse/mtcars.csv", na="") %>%
  select(-c(qsec,drat)) %>%
  dplyr::filter(mpg > 5 | am == 0) %>%
  mutate(hp_lvl = cut(hp, 3, labels=c("low","medium","high"))) %>%
  mutate_at(vars(mpg), ~round(.)) %>%
  ggplot(aes(wt, mpg)) +
    geom_point(aes(color= factor(cyl))) +
    geom_smooth(method="lm", se=F, color="black") +
    facet_wrap(~hp_lvl) +
    theme_dark()








