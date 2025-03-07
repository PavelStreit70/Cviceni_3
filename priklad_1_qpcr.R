# Zde si dopisujte potrebne knihovny. 


#############################
## data qPCR ----

# Nactete data ze souboru data_examples.xlsx, list "qPCR". 

library(readxl)
data_examples <- read_excel("data_examples.xlsx", sheet = "qPCR")
View(data_examples)

# Spocitejte sumarizace pro vsechny sloupce.

data_examples %>% 
  summary()
  #summarise(total = sum(Expression))

# Prevedte sloupce na faktory, kde to dava smysl.

data_examples %>% 
  mutate(Gene = as.factor(Gene)) %>% 
  mutate(Replicate = as.factor(Replicate)) %>% 
  mutate(Condition = factor(Condition, levels = c("wt", "#1", "#2", "#3")))

# Vypiste pouze radky s kondici wt 

data_examples %>% 
  filter(Condition == "wt")

# Vypiste pouze radky s kondici wt pro geny Fzd2 a Wnt9a

data_examples %>% 
  filter (Condition == "wt", Gene %in% c("Fzd2", "Wnt9a"))
  #filter(Condition =="wt", Condition == c("Fzd2","Wnt9a"))

# Spocitejte prumery pro jednotlive kondice u jednotlivych genu. 

data_examples %>% 
  group_by(Condition,Gene) %>% 
  summarise(mean(Expression))

# Prumery vypiste v poradi genu Prickle1, Fzd2, Wnt9a a kondice wt, #1, #2, #3. 

data_examples %>% 
  mutate(Gene = factor(Gene, levels = c("Prickle1", "Fzd2", "Wnt9a"))) %>%  
  group_by(Gene,Condition) %>% 
  summarise(mean(Expression))


# ÚKOL NAVÍC: Muzete se pokusit vykreslit jednoduchy graf s prumery. 


data_examples %>%
  group_by(Gene,Condition) %>% 
  summarise(mean(Expression)) %>% 
  boxplot(mean(Expression) ~ Condition + Gene, data = .)
  

# Vyjadrete expresi relativne vuci hodnote wt v kazdem replikatu. 

# Pro tyto hodnoty vyjadrete prumer. 







