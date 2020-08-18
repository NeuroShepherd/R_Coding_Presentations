


library(tidyverse)

ello <- tibble(a=c(1,-2,0,NA),b=c(8,20,NA,-8))
ello

# For columns `a` and `b`, all values greater than or equal to 0 are preserved (and, by extension, any values less than zero are set to NA)
ello %>%
  mutate_at(vars(a,b), ~case_when(. >= 0 ~ .))

# For columns `a` and `b`, all values NOT(!) equal to 1 through 5 are preserved (and, by extension, any values of 1-5 are set to NA)
ello %>%
  mutate_at(vars(a,b), ~case_when(!. %in% c(1:5) ~ .))

