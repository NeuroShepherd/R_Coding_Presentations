
readr::read_csv("Intro to R/iris.csv") %>%
  dplyr::select(-c(Petal.Length,Petal.Width)) %>%
  dplyr::filter(Sepal.Width > 3) %>%
  dplyr::mutate(Sepal_Mult = Sepal.Length*Sepal.Width) %>%
  dplyr::mutate_at(vars(Sepal_Mult), ~round(.)) %>%
  dplyr::arrange(desc(Sepal_Mult)) %>%
  dplyr::group_by(Species) %>%
  dplyr::summarise(mean = mean(Sepal_Mult), sd = sd(Sepal_Mult))


