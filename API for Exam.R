##Exam_2025_GIT

library(httr2)


req <- request("https://mdblist.p.rapidapi.com/") %>%
  req_url_query(
    s = "Christmas"
  ) %>%
  req_headers(
    `X-RapidAPI-Key`  = "d90e49cb20msh63c969b6d6473cdp1741f3jsn648bacf73384",
    `X-RapidAPI-Host` = "mdblist.p.rapidapi.com"
  )

resp <- req %>% req_perform()
output <- resp %>% resp_body_json()
print(output)