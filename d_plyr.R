#install dplyr

install.packages("dplyr")

library ("babynames")
library ("dplyr")

data("babynames")

babynames

#Všechny řádky kde je prop větší než 0.08

filter(babynames, prop >= 0.08)

#Všechhny děcka se jménem "Sea"

filter(babynames, name == "Sea")

#Přesné údaje

filter(babynames, name == "Garrett", year == 1880)

#Chlapci se jménem "Sea"

filter(babynames, sex == "M", name == "Sea")

#Jména chlapců Garrett a Robert

filter(babynames, name == "Hugo" | name == "Marek" | name == "Hugo") #krapet shit tohle

test <- filter(babynames, name == c ("Garrett","Robert")) # Jsou tu Garretti i Garreti

#správně

filter(babynames, name %in% c("Marek","Robert","Hugo"))

#Jména která byla užita přesně 5x nebo 6x

filter(babynames, (n == 5 | n == 6), year == 2000)

# Pomocí %>% napište sekvenci funkcí, která:
  # vyfiltruje z babynames dívky narozené v roce 2001, potom...
  #vybere sloupce name a n, potom...
  #seřadí výsledky dle počtu od nejvíce populárního, potom...
  #vybere prvních 10 nejčastějších 


babynames %>% 
  filter(year == 2001, sex == "F") %>% 
  select(name,n) %>% 
  arrange(desc(n))%>% 
  slice_head(n=10)

#Vyberte řádky s vaším jménem (pokud neexistuje, vymyslete si nebo použijte např. Khaleesi) 
#použijte summarise(), sum() a min() k nalezení:
#celkového počtu dětí s tímto jménem
#prvního roku s výskytem tohoto jména

babynames %>% 
  filter(name == "Pavel") %>% 
  summarise(total = sum(n), max = max(n), min = min(year))

babynames %>% 
  summarise(n = n(), nname = n_distinct(name))

#babynames %>% 
  #group_by(name, sex) %>%
  #ungroup() %>% 
  #summarise(total = sum(n)) %>% 
  #arrange(name, sex) %>% 
  #slice (1:10)

#Pomocí group_by(), summarise(), arrange() vypište 10
#nejpopulárnějších kombinací jmen a pohlaví. 

babynames %>% 
  group_by(name, sex) %>% 
  summarise(total = sum(n)) %>% 
  ungroup() %>% 
  arrange(desc(total)) %>% 
  slice(1:10)

babynames %>% 
  group_by(year, sex) %>%
  mutate(rank = min_rank(desc(n))) %>% 
  filter(sex == "F")

babynames %>% 
  #arrange(sex,year,desc(n)) %>% 
  group_by(sex, year) %>% 
  mutate(rank = min_rank(n))

#konec cvičení

  



  






