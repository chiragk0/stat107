library(tidyverse)
library(openxlsx)
library(magrittr)
  #Generic Functions
print(1:10)

cemetaries <-  read_csv("cemeteries.csv",col_types = cols())
cemetaries
print(cemetaries, n = 5)
print(1:10, n = 5)

  #Method dispatch
methods(class = "matrix")
methods(class = "lm")

methods(generic.function = head)

?print
?print.default
?print.tbl  

methods(print) 
methods(mean) 

  #The select() function
# Get the column names for the data frame for reference
names(cemetaries)
# SELECT 3 COLUMNS, THEN EVERTHING ELSE FROM THE CEMETARIES DATA FRAME
select(cemetaries,PROJECT, LEGAL, OWNER, ADDRESS, SHAPESTLength, SHAPESTArea, 
       OBJECTID, MAP_PARCEL)

  #The pipe() operator
# START WITH CEMETARIES, AND THEN %>%
cemetaries %>%
# SELECT 3 COLUMNS, THEN EVERTHING ELSE
select(PROJECT, LEGAL, OWNER, everything())
# Look at the first few rows of `cemetaries` to see that the above rearranging
# may have printed out, but did not actually modify the `cemetaries` data frame
cemetaries %>% head()
# Get the column names for the data frame for reference
names(cemetaries)
# The new value of `cemetaries` will be the result of...
cemetaries <- cemetaries %>% select(PROJECT, LEGAL, OWNER, everything()) %>%
  select(- MAP_PARCEL)
# Get the column names for the data frame to confirm the 
# rearranged columns and the removal of `MAP_PARCEL`
names(cemetaries)

  #The mutate() function
# let's make a copy of cemetaries for the corrected spelling, cemeteries (with no "a")
cemeteries <- cemetaries
# To help confirm if the corrections are made, let's check which rows have 
# a misspelling in the `LEGAL` column
str_which(string = cemeteries$LEGAL,
          pattern = "CEMETAR")

  #The str_replace_all() function
cemetaries <- cemeteries %>% mutate(LEGAL = str_replace_all(string = LEGAL,
                                                            pattern = "CEMETAR",
                                                            replacement = "CEMETER"))
# let's once again check which rows have a misspelling in the `LEGAL` column
str_which(string = cemeteries$LEGAL,
          pattern = "CEMETAR")
#check which rows have a misspelling in the `OWNER` column
str_which(string = cemeteries$OWNER,
          pattern = "CEMETAR")

cemeteries <-
  cemeteries %>%
  mutate(OWNER = str_replace_all(string = OWNER,
                                 pattern = "CEMETAR",
                                 replacement = "CEMETER"))

str_which(string = cemeteries$OWNER,
          pattern = "CEMETAR")

  #The str_detect() function
cemeteries <-
  cemeteries %>%
  mutate(is_family = str_detect(string = OWNER, pattern = "FAMILY") |   
           str_detect(string = LEGAL, pattern = "FAMILY")) %>%
  select(is_family, everything())
cemetaries

cemeteries <-
  cemeteries %>%
  mutate(is_religious = str_detect(string = OWNER, pattern = "CHURCH|CHRISTIAN|JEWISH") | 
           str_detect(string = LEGAL, pattern = "CHURCH|CHRISTIAN|JEWISH")) %>%
  select(is_religious, LEGAL, OWNER,  everything())
cemeteries

cemeteries <-
  cemeteries %>%
  mutate(is_cem = str_detect(string = OWNER, pattern = "CEMETERY") | 
           str_detect(string = LEGAL, pattern = "CEMETERY")) %>%
  select(is_cem, LEGAL, OWNER,  everything())
cemeteries

  #Mutate the PROJECT column
project_rewrite <-
  cemeteries %>%
  select(starts_with("is_"), PROJECT)
project_rewrite

project_rewrite <- 
  project_rewrite %>%
  mutate( PROJECT = if_else(!is.na(PROJECT), "CEMETERY", PROJECT))
project_rewrite

project_rewrite %>%
  .$PROJECT %>%
  is.na() %>% 
  sum()

project_rewrite <- 
  project_rewrite %>%
  mutate( PROJECT = if_else(is_cem, "CEMETERY", PROJECT))

project_rewrite %>%
  .$PROJECT %>%
  is.na() %>% 
  sum()

project_rewrite <- 
  project_rewrite %>%
  mutate( PROJECT = if_else(is_religious, "RELIGIOUS", PROJECT))
project_rewrite

project_rewrite <- 
  project_rewrite %>%
  mutate( PROJECT = if_else(is_family, "FAMILY", PROJECT))
project_rewrite

project_rewrite <- 
  project_rewrite %>%
  mutate( PROJECT = if_else(is_memorial, "MEMORIAL", PROJECT))
project_rewrite

cemeteries <- 
  cemeteries %>%
  mutate(PROJECT = project_rewrite$PROJECT) 
cemeteries$PROJECT <- project_rewrite$PROJECT
cemeteries

cemeteries <-
  cemeteries %>%
  select( - starts_with("is_"))
cemeteries

cemeteries <-
  cemeteries %>%
  filter(PROJECT != NA)
cemeteries

  #The group_by() function
cemeteries <-
  cemeteries %>%
  group_by(PROJECT) 

cemeteries

groups(cemeteries)
  #The summarise() function
cemeteries %>%
  group_by(PROJECT) %>%
  summarise(counts = n())

cemeteries %>%
  group_by(PROJECT) %>%
  summarise(counts = n(), 
            avg_area = mean(SHAPESTArea)
  )
  #The arrange function to sort
cemeteries %>%
  group_by(OWNER) %>%
  summarise(counts = n()
  ) %>%
  arrange(desc(counts), desc(OWNER))

cemeteries %>%
  group_by(OWNER) %>%
  mutate(counts = n()) %>%
  select(OWNER, counts, PROJECT, everything()) %>%
  arrange(desc(counts), OWNER, PROJECT)
  #Basic plotting
help(plot, package = "base")
methods(plot)
plot(x = cemeteries$SHAPESTLength, 
     y = cemeteries$SHAPESTArea)
methods(plot)

class(cemeteries[c("SHAPESTLength", "SHAPESTArea")])

plot(cemeteries[c("SHAPESTLength", "SHAPESTArea")])

?plot.function()

cemeteries %>%
  filter(SHAPESTLength < 2000 ) %$%  # BOOM!
  plot(SHAPESTLength, SHAPESTArea)

help(package = "magrittr")

?plot()