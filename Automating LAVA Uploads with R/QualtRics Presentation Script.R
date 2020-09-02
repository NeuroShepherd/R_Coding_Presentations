

library(tidyverse)
library(qualtRics)
library(keyringr)

qualtrics_api_credentials(api_key = decrypt_kc_pw("Qualtrics_API_Token_Test"),
                          base_url = "ucsf.co1.qualtrics.com")

all_surveys() %>% View()

fetch_survey(surveyID = "SV_2sNRUJdUQJ13Tvv", force_request = T) %>%
  rename_at(vars(EndDate,IPAddress), ~paste0("SKIP:",.)) %>%
  select(-c(Status)) %>%
  dplyr::filter(Finished == TRUE) %>%
  write_csv("~/Desktop/my_qualtrics_file.csv", na="")
