library(needs)
needs(XML, tidyverse)

#read data on members of parliament over time
x = xmlParse("MDB_STAMMDATEN.XML") %>% xmlToList()
#download file from: https://www.bundestag.de/services/opendata

#make list of election periods in germany
wps = data.frame(wp = 1:20, year = c(seq(1949, 1969, 4),1972,1976,1980,1983,1987,seq(1990, 2002, 4), seq(2005, 2021, 4)))

#get MP id, election period and sex data
d = tibble(id = sapply(x[2:length(x)], `[[`, 1) %>% unname,
          geschlecht = sapply(x[2:length(x)], function(xi) xi[[3]]$GESCHLECHT) %>% unname,
          wp = sapply(x[2:length(x)], function(xi) sapply(xi[[4]], `[[`, 1) %>% unname %>% as.numeric()) %>% unname()
          ) %>%
  unnest(wp) %>%
  left_join(wps, by = join_by(wp))

#sum by year and sex
a.sex = d %>%
  group_by(year, geschlecht) %>%
  summarise(n = n()) %>%
  mutate(share = n/sum(n)) %>% 
  pivot_wider(values_from = c(share, n), names_from = geschlecht, values_fill = 0)

write_excel_csv2(a.sex, "../data/processed/bundestag_women_over_time.csv")
