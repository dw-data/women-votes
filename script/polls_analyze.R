library(needs)
needs(jsonlite, tidyverse)

#make list of polls to analyze
l = c("https://www.abgeordnetenwatch.de/api/v2/votes?poll=1232&range_end=1000",#marriage equality
      "https://www.abgeordnetenwatch.de/api/v2/votes?poll=4539&range_end=1000",#vaccine mandate for over 60s
      "https://www.abgeordnetenwatch.de/api/v2/votes?poll=5098&range_end=1000",#assisted suicide - decriminalize
      "https://www.abgeordnetenwatch.de/api/v2/votes?poll=5091&range_end=1000")#assisted suicide - criminalize)

#get list of votes from API
polls = vector("list", length = 4)
for(i in 1:length(l)){
  polls[[i]] = fromJSON(l[i])$data %>% 
    jsonlite::flatten(recursive = FALSE) %>% 
    select(label, mandate.api_url, poll.label, vote)
}
polls = bind_rows(polls)

save.image("data.RData")

#get sex of MPs who voted
tmp = polls %>% group_by(mandate.api_url) %>% summarise() %>% mutate(sex = NA)
for(i in 1:nrow(tmp)){
  tmp$sex[i] = (fromJSON(tmp$mandate.api_url[i])$data$politician$api_url %>% fromJSON())$data$sex
}  
tmp$sex[which(is.na(tmp$sex))] = c("m","m") #Peter Stein, doesn't have gender marker, set manually

#join sex to polls data
polls = polls %>%  left_join(tmp, by = join_by(mandate.api_url))

save.image("data.RData")

#analysis: share and number of votes by poll and gender
polls %>% group_by(poll.label, sex, vote) %>% summarise(n = n()) %>% 
  pivot_wider(names_from = "sex", values_from = "n") %>% 
  filter(vote != "no_show", vote != "abstain") %>% 
  mutate(total = f + m) %>% group_by(poll.label) %>% 
  mutate(share_f = f/sum(f), share_m = m/sum(m), share_total = total / sum(total)) %>% 
  View()
