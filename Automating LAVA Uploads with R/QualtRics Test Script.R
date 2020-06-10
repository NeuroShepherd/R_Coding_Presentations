




qualtRics::qualtrics_api_credentials(api_key = keyringr::decrypt_kc_pw("Qualtrics_API_Key"), 
                                     base_url = "ucsf.co1.qualtrics.com")

qualtRics::all_surveys() %>% View()


qualtRics::fetch_survey("SV_esmOleT034cn2rb", force_request = T)


