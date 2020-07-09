




qualtRics::qualtrics_api_credentials(api_key = keyringr::decrypt_kc_pw("Qualtrics_API_Key"), 
                                     base_url = "ucsf.co1.qualtrics.com")

qualtRics::all_surveys() %>% head() %>% View()

qualtRics::fetch_survey("SV_esmOleT034cn2rb", force_request = T) %>% View()




# create list of all tests in my account, and filter for only the active ones
tests <- qualtRics::all_surveys() %>% 
  dplyr::filter(isActive == "TRUE") %>% # can't query inactive surveys it seems
  head()


# List approach
data <- tests %>%
  pull(id) %>%
  map(~ qualtRics::fetch_survey(., force_request = T, label = F, convert = F)) %>% # this set up is equivalent to exporting from Qualtrics as numeric. Remove `label` and `convert` arguments to be equivalent to Choice Text output
  setNames(pull(tests,name))
data %>%
  pluck("PPG UDS Telephone Follow Up") %>%
  View()


# Nested tibbles approach
oink <- tests %>%
  mutate(data = pull(.,id) %>% map(~ qualtRics::fetch_survey(., force_request = T, label = F, convert = F)))  # this set up is equivalent to exporting from Qualtrics as numeric. Remove `label` and `convert` arguments to be equivalent to Choice Text output
oink %>%
  dplyr::filter(name == "PPG UDS Telephone Follow Up") %>%
  pull(data)

