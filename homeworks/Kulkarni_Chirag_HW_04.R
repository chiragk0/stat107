library(tidyverse)
library(dplyr)
library(magrittr)
#loads the file "murder_weapons.RData"
load("murder_weapons.RData")
#checks the working directory
getwd()

##############################################################################
###  Question 1
##############################################################################
#######################################
###  Q1.1
#######################################
  #(a)
#prints "candle" to visualize the data
candle
#creates a new column called "Value_Class" and sets "Gold" and "Silver" materials to
#precious while the other materials stay "regular"
candle <-
 mutate(candle, 
        Value_Class = case_when(
    endsWith(Material, "Gold") ~ "precious",
    endsWith(Material, "Silver") ~ "precious",
    endsWith(Material, "Pewter") ~ "regular",
    endsWith(Material, "Brass") ~ "regular",
    endsWith(Material, "Iron") ~ "regular")
  )
#prints "candle" to check that the column has been added
candle
  #(b)
#creates a new table called "Price_Per_Lbs" and assigns the monetary values from
#the given table and assigns it to "candle"
candle <-
mutate(candle, 
       Price_Per_Lbs = case_when(
         endsWith(Material, "Gold") ~ 30735.00,
         endsWith(Material, "Silver") ~ 206.00, 
         endsWith(Material, "Pewter") ~ 4.00,
         endsWith(Material, "Brass") ~ 1.30,
         endsWith(Material, "Iron") ~ 0.07)
)
#prints "candle" to check if the column has been added
candle
  #(c)
#groups "candle" by the "Value_Class" column and assigns it back to "column"
candle <-
  candle %>% group_by(Value_Class)
#prints "candle"
candle
#checks the groups in "candle"
groups(candle)
  #(d)
#calculates a group summary for the average price of each group and stores it in
#a column named Average_Price
candle$Average_Price<-
  candle %>% group_by(Material) %>% summarise(Average_Price = mean(Weight/Price_Per_Lbs))
  #(e)
#ungroups the "candle" data frame
ungroup(candle)

#######################################
###  Q1.2
#######################################
#filters the "candle" data frame to contain only the precious metals and assigns them to
  #a variable named "bling"
bling <-
  candle %>% filter(Value_Class == "precious")
#prints "bling" to check
bling
  #(a)
#finds the total weight of the precious metals is 9lbs and assigns it to "Total_Weight"
Total_Weight <- summary(bling)
#prints Total_Weight to check
Total_Weight

##############################################################################
###  Question 2
##############################################################################
#opens the "knife" data set to visualize the data
knife
#######################################
###  Q2.1
#######################################
#removes the columns that begin with "Z-score"
knife <- knife[, -c(14:16)]
#checks the column names of "knife"
colnames(knife)

#######################################
###  Q2.2
#######################################
#identifies the column names excluding "Financial Year"
knife %>%
  select_if(is.character) %>%
  select(-'Financial Year')
#finds the unique values in all the other columns
knife %$%
  unique(`Force Name`) 
knife %$%
  unique(Region) 
knife %$%
  unique(`Financial Quarter`) 

#######################################
###  Q2.3
#######################################
#changes 'Financial Quarter' to a factor
knife$`Financial Quarter` <- as_factor(knife$`Financial Quarter`)
#checks the class
class(knife$`Financial Quarter`)
  #(a) 
arrange(knife, (knife$`Financial Quarter`))
knife$`Financial Quarter`
#######################################
###  Q2.4
#######################################
#this prints the number of times each region occured in the data set
table(knife$Region)
#another way
knife %>% count(Region)
#######################################
###  Q2.5
#######################################
#Each force reported 44 incidents
table(knife$`Force Name`)
#another way
knife %>% count(`Force Name`)
#######################################
###  Q2.6
#######################################
#There are 264 forces in the "East" region
knife %>% count(Region)

##############################################################################
###  Question 3
##############################################################################
#prints "chop_chop" to visualize the data
chop_chop
#helps see the different types of pipe operators for reference
help(package = "magrittr")
#######################################
###  Q3.1
#######################################
#changes the entire "type" column to a Title Cased format
chop_chop$type %>%
  str_to_title(chop_chop$type)

#######################################
###  Q3.2
#######################################
#changes the entire "upper" column to an UPPER CASED format
chop_chop$origin %>%
  str_to_upper(chop_chop$origin)

#######################################
###  Q3.3
#######################################
#creates a new column called "murica" that detects if the "origin" column references
#the Americas
chop_chop$murica <-
  "Americas" %>% 
  str_detect(chop_chop$origin, .)
#prints the "murica" column to check
chop_chop$murica

#######################################
###  Q3.4
#######################################
#Reorganizes the columns such that murica comes first, origin comes second and 
#type comes last
chop_chop <-
  chop_chop %>% 
    select(murica,origin,type)
#prints chop_chop to check
chop_chop

#######################################
###  Q3.5
#######################################
  #(a)
#arranges "murica" such that "TRUE" is at the top and "FALSE" is at the bottom
chop_chop <-
  chop_chop %>% 
    arrange(desc(murica))
  #(b)
#arranges "type" in descending order
chop_chop <-
  chop_chop %>% 
    arrange(desc(murica),desc(type))
#prints chop_chop to check
chop_chop

#######################################
###  Q3.6
#######################################
#Group the data frame by the "murica" column
chop_chop <-
  chop_chop %>%
    group_by(murica)
#prints chop_chop to check
chop_chop

#######################################
###  Q3.7
#######################################
#Create a new column named counts which contains the number of rows/observations 
#within each group
chop_chop$counts <-
  chop_chop %>% 
    count(murica,origin,type)
#prints to check
chop_chop$counts

##############################################################################
###  Question 4
##############################################################################
#prints bang_bang to visualize the data
bang_bang
#######################################
###  Q4.1
#######################################
  #(a)
#keeps the state column and all columns that start with “private”, “redemption”, or “return”.
bang_bang <-
  bang_bang %>% 
    select(state, starts_with("private"), starts_with("redemption"), starts_with("return"))
  #(b)
#drops all any remaining columns if they end with “other”.
bang_bang <-
  bang_bang %>%
    select(-ends_with("other"))

#######################################
### Q4.2
#######################################
#prints the documentation for complete cases
?complete.cases()
  #(a)
#this package originates from the "stats" function
  #(b)
#removes all rows that contain any missing (NA) values
bang_bang <-
  bang_bang[complete.cases(bang_bang), ]
  #(c)
#counts the number of observations remaining (2475 observations remaining)
bang_bang %>%
  summarise(counts = n())

#######################################
### Q4.3
#######################################
#counts the number of observations in each state (45 observations per state)
bang_bang %>%
  group_by(state) %>%
  summarise(counts = n())

#######################################
### Q4.4
#######################################
#uses the exposition pipe operator to plot "private_sale_handgun" vs "private_sale_long_gun"
bang_bang %>%
  filter(private_sale_handgun < 4000 ) %$%
  plot(private_sale_handgun, private_sale_long_gun)

#######################################
### Q4.5
#######################################
#Uses the lm() function to fit a linear regression, using private_sale_handgun as 
#the independent (x) variable, and private_sale_long_gun as the dependent (y) variable
lm(formula = private_sale_handgun ~ private_sale_long_gun, 
    data = bang_bang)
  #(a)
#stores the linear model to a variable named gun_lm
gun_lm <-
  lm(formula = private_sale_handgun ~ private_sale_long_gun, 
     data = bang_bang)
#prints gun_lm to check
gun_lm
  #(b)
#obtains the model estimates and the multiple r-squared value
summary(gun_lm)
  #(c)
#replots private_sale_handgun (x) vs private_sale_long_gun (y) and draw a red, 
#dashed line over it using the gun_lm variable.
bang_bang %$% 
  plot(private_sale_handgun, private_sale_long_gun)
abline(gun_lm)

##############################################################################
###  Question 5
##############################################################################
#prints the "ntrl_rope" and "synth_rope" data sets to visualize
ntrl_rope
synth_rope
#######################################
### Q5.1
#######################################
#modifies the "Material" column to title case
ntrl_rope$Material <-
  ntrl_rope$Material %>%
    str_to_title(ntrl_rope$Material)
#prints ntrl_rope to check
ntrl_rope

#######################################
### Q5.2
#######################################
#modifies the "Material" column to lower case
synth_rope$Material <-
  synth_rope$Material %>%
    str_to_lower(synth_rope$Material)
#prints synth_rope to check
synth_rope

#######################################
### Q5.3
#######################################
#combines "ntrl_rope" and "synth_rope" into a new data frame called "all_rope"
all_rope <-
  rbind.data.frame(ntrl_rope, synth_rope)
#prints "all_rope" to check
all_rope

#######################################
### Q5.4
#######################################
all_rope$Material %>%
  str_detect(string = all_rope$Material, pattern = "y")

#######################################
### Q5.5
#######################################
#finds the number of letters in the "Material" column and assigns it to name_len
all_rope$name_len <-
  str_length(all_rope$Material)
#prints name_len to check
all_rope$name_len
#finds the average name length for each Type 
mean(name_len)

##############################################################################
###  Question 6
##############################################################################
#loads the hammer_time data set to visualize
hammer_time
class(hammer_time)
class(hammer_time$chart_position)
#######################################
### Q6.1
#######################################
#converts the chart_position column of the hammer_time data frame to be numeric, then filter out the missing value
hammer_time<-
  hammer_time %>%
  filter(!is.na(as.numeric(hammer_time$chart_position)))
hammer_time

#######################################
### Q6.2
#######################################
#converts hammer_time to a numeric so we can find the mean
hammer_time$chart_position <- as.numeric(hammer_time$chart_position)
#calculates the mean chart position of the 5 remaining songs (32.8)
mean(hammer_time$chart_position)

#######################################
### Q6.3 
#######################################
#filters the data frame to only contain the songs that made it into the top 10 chart positions
#hammer_time <- 
filter(hammer_time, hammer_time$chart_position < 10)

##############################################################################
###  Question 7
##############################################################################
#prints the "bottles" data set to visualize
bottles
#checks the class of "bottles"
class(bottles)
#######################################
### Q7.1
#######################################
#completes the assigned instructions
?str_detect
bottles$price <- as.numeric(bottles$price)
#bottles <-
bottles$price %>%
  filter(!str_detect(price, pattern = "/")) %>%
  mutate(price=str_remove(price, pattern = ",")) %>%
  mutate(price=str_remove(price, as.numeric(price))) %>%
  bottles[,c(5,4,1,2,3)]

#######################################
### Q7.2
#######################################
#uses the exposition pipe operator to plot price vs review_point
bottles %>%
  filter(price < 2000) %$%
  plot(price, review_point)

#######################################
### Q7.3
#######################################
#plots price and review_point on a log scale without the log() function
bottles %>%
  filter(price < 2000) %$%
  plot(log(price), log(review_point))

##############################################################################
###  Question 8
##############################################################################
#prints the pipes data set
pipes

#the following shows how many addresses show up 3 or more times
counts <- table(pipes$Full_Address)
table_of_counts <-data.frame(counts)t
table_of_counts %>%
  filter(counts>=3)

#lists the addresses in order of descending counts
table_of_counts %>%
  arrange(Var1,Freq)

#lists the addresses alphabetically within each count group
table_of_counts %>%
  arrange()

##############################################################################
###  Question 9
##############################################################################
wrenches
#######################################
### Q9.1
#######################################
#filters out the rows for which there are missing values in the British/Commonwealth column
wrenches %>%
  filter(!is.na(wrenches$`British/Commonwealth name`))

#######################################
### Q9.2
#######################################
#detects how many wrenches fall into each group category
wrenches %>%
  group_by(Group) %>%
  summarise(counts = n())

#######################################
### Q9.3
#######################################
#subsets the data frame to values that have the same American name and British/Commonwealth name
wrenches %>%
  filter(wrenches$`American name` == wrenches$`British/Commonwealth name`)

#######################################
### Q9.4
#######################################
#10 wrenches/spanners do not have an identified name in the British/Commonwealth column
str_detect(wrenches$`British/Commonwealth name`, "\\?")

#######################################
### Q9.5
#######################################
  #(a)
#detects how many american wrench names contain an animal name
wrenches %>%
  str_detect(string = wrenches$`American name`, pattern = "monkey") &
  str_detect(string = wrenches$`American name`, pattern = "crow") &
  str_detect(string = wrenches$`American name`, pattern = "spider") &
  str_detect(string = wrenches$`American name`, pattern = "dog") &
  str_detect(string = wrenches$`American name`, pattern = "alligator")
  #(b)
#detects how many british/commonwealth wrench names contain an animal name
wrenches %>%
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "monkey") &
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "crow") &
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "spider") &
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "dog") &
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "alligator")

#######################################
### Q9.6
#######################################
  #(a)
#detects how many british wrench names contain the word "spanner"
wrenches %>%
  str_detect(string = wrenches$`British/Commonwealth name`, pattern = "spanner")
#detects how many american wrench names contain the word "spanner"
wrenches %>%
  str_detect(string = wrenches$`American name`, pattern = "spanner")