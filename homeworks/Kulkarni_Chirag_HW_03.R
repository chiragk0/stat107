install.packages("na.tools")
library("na.tools")
library("tidyverse")
library("openxlsx")
##############################################################################
###  Question 1
##############################################################################
#######################################
###  Q1.1
#######################################
#sets the working directory to ballroom
setwd("~Downloads/Lab-03/School/Classes/2020/any_year_but_2020/Fall/
      Statistical Computing/Lessons/datafiles/mansion/ballroom")
#prints out the current working directory
getwd()

#######################################
###  Q1.2
#######################################
#lists the files in the set directory
#you find the "candlestick.fwf" data file under "ballroom"
list.files()

#######################################
###  Q1.3
#######################################
#prints out the documentation for read_fwf() with the tidyverse library imported
#at the top of script
?read_fwf()
#reads in and the names the column of the data frame and assigns it to "candle"
candle <- read_fwf("candlestick.fwf",fwf_positions(start = c(1,7),end = c(9,13),col_names = c("Material","Weight")))
#prints candle
candle

#######################################
###  Q1.4
#######################################
#Using the attach() function creates a new, special environment for the "candle"
#data frame. It allows us to print individual columns from "candle".
#The new,special environment is accessible from the "Global Environment" option 
#in the top right panel of Rstudio under the "Environment" tab. Upon clicking the
#"candle" option, you are able to see the columns "Material" and "Weight" available
#under the workspace. 
attach(candle)

#######################################
###  Q1.5
#######################################
#assigns a copy of the "Weight" vector to "candle_stick_wt"
candle_stick_wt <- Weight
#prints candle_stick_wt
candle_stick_wt
  #(a)
#modifies the names of "candle_stick_wt" to be the values in "Material" 
candle_stick_wt <- c("c", "f", "c", "c", "P", "B", "G", "S", "I")
#prints "candle_stick_wt"
candle_stick_wt
  #(b)
#subsetting using numerical coordinates
candle_stick_wt[c(6,9)]
#subsetting using names
candle_stick_wt[c("B","I")]

##############################################################################
###  Question 2
##############################################################################
#The class of weapon available in the billard room is: (b) - Sharp
getwd()

#######################################
###  Q2.1
#######################################
#reads the "knives.csv" file and sets it to a variable named "uk_violence"
uk_violence <- read.csv("knives.csv",header = TRUE)
#prints uk_violence
uk_violence
#changes uk_violence to a tibble
uk_violence<-as_tibble(uk_violence)
uk_violence
  #(a)
#using the print statement to control the amount of rows that I print
print(uk_violence, n = 30)

#######################################
###  Q2.2
#######################################
#uses the "$" sign to access the first 46 observations from theRegion column 
#in "uk_violence"
uk_violence$Region[1:46]

#######################################
###  Q2.3
#######################################
#uses str_detect to tell me which values in "Region" are equivalent to "London"
#and stores it in a variable named "is_london"
is_london <- str_detect(string = uk_violence$Region[1:46], pattern = "London" )
#prints "is_london" to check
is_london
  #(a)
#according the table printed out, "London" shows up 32 times in the first
#46 values of Region. 
table(uk_violence$Region[1:46])

#######################################
###  Q2.4
#######################################
summary(uk_violence$Region[1:46])
mean(uk_violence$Region[1:46])

##############################################################################
###  Question 3
##############################################################################
#prints the working directory to check 
getwd()
#I used the "read_table" function to read in the file
read_table("axe2.txt",col_names = TRUE, col_types = cols())

##############################################################################
###  Question 4
##############################################################################

#######################################
###  Q4.1
#######################################
#prints the working directory to check 
getwd()
#There are a total of 13331 observations within the "gun.csv" file
read.csv("gun.csv",header = FALSE)

#######################################
###  Q4.2
#######################################
#saves the first three columns as a data frame into a variable named "us_gun_permits"
us_gun_permits <- as.data.frame(read.csv("gun.csv",header = FALSE)[1:3])
#prints the variable "gun permits"
us_gun_permits

#######################################
###  Q4.3
#######################################
  #(a)
#prints a logical comparison vector to check if a value within "state" (V2) is 
#equal to "California and assigns it to is_cali
is_cali <- str_detect(string = us_gun_permits$V2, pattern = "California")
#prints is_cali
is_cali
  #(b)
#subsets the us_gun_permits data frame to only contain observations for "California"
#and stores it in a variable called "cali_gun_permits"
cali_gun_permits <- us_gun_permits[is_cali, ]
#prints "cali_gun_permits"
cali_gun_permits

#######################################
###  Q4.4
#######################################
  #(a)
#the "which.max()" function determines the location, or index of the first maximum
# of a numeric, or logical vector.
?which.max()
  #(b)
#finds the index of the maximum of the "permit" vector
which.max(us_gun_permits$V3)
  #(c)
#finds the maximum value in the "permit" vector using square brackets and "which.max"
us_gun_permits$V3[which.max(us_gun_permits$V3)]
#finds the maximum value in the "permit" vector using the "max()" function  
max(us_gun_permits$permits[,2])

#######################################
###  Q4.5
#######################################
    #(a)
#Year: 2014 | Month: March
(us_gun_permits["3007", ])
    #(b)
#522188 permits were issued that year as seen by the matching values in the 
#lines below
us_gun_permits$V3[which.max(us_gun_permits$V3)]
(us_gun_permits["3007", ])

##############################################################################
###  Question 5
##############################################################################
#reverse the working directory until the downloads folder is reached
setwd("..")
#set the working directory to "hall" using an absolute path
setwd("~Downloads/Lab-03/School/Classes/2020/any_year_but_2020/Fall/
      Statistical Computing/Lessons/datafiles/mansion/hall")
#check the working directory to make sure it is in "hall"
getwd()

#######################################
###  Q5.1
#######################################
#import the "openxlsx" package as seen at the top of the script and read the file
#to see its contents
read.xlsx("rope.xlsx")
  #(a)
#There are 2 sheets in the "rope.xlsx" file
  #(b)
#Their names are: "natural" and "synthetic"

#######################################
###  Q5.2
#######################################
#reads in the first sheet, "natural", by name and stores it in a variable called
#"natural_ligature"
natural_ligature <- read.xlsx("rope.xlsx", sheet = "natural")
#prints "natural_ligature" to check
natural_ligature
  #(a)
#checks the class of "natural_ligature". It is a data frame
class(natural_ligature)
  #(b)
#changes the class of "natural_ligature" to a tibble
natural_ligature <- as_tibble(natural_ligature)
#checks the class of "natural_ligature". It is now a tibble.
class(natural_ligature)

#######################################
###  Q5.3
#######################################
#sets the synthetic sheet to a variable named "synthetic_strangle"
synthetic_strangle <- read.xlsx("rope.xlsx", sheet = "synthetic")
#prints synthetic_strangle to check
synthetic_strangle
  #(a)
#The class of the first column is: "character"
class(synthetic_strangle$Material)
  #(b)
#The class of the second column is: "numeric"
class(synthetic_strangle$Length)
  #(c)
#There are 7 observations in "natural_ligature"
natural_ligature

#######################################
###  Q5.4
#######################################
#The range of variables for the natural rope is 20.81423 to 92.61364
range(natural_ligature$Length)
#The range of variables for the synthetic rope is 1.261277 to 83.619255
range(synthetic_strangle$Length)

#######################################
###  Q5.5
#######################################
#You get a list of 11 numbers that are products of the two lengths along with
#a warning message that states "longer object length is not a multiple of shorter object length"
#There is nothing particularly wrong with the result.
natual_ligature$Length * synthetic_strangle$Length

##############################################################################
###  Question 6
##############################################################################
#sets the working directory to "kitchen" using a relative path
setwd("kitchen")
#checks that the working directory has changed
getwd()
#reads the "hammer.fwf" file
read_table("hammer.fwf", col_names = TRUE)

#######################################
###  Q6.1
#######################################
#reads the "hammer.fwf" file
#the problem created by the missing value is that it opens up new, unnecessary
#columns that detract from the characteristics of a fixed width format file. 
#For example, the spaces in the X2 and X3 columns are unreadable without a 
#special function. 
read_table2("hammer.fwf")

#######################################
###  Q6.2
#######################################
#checks the documentation for the "read_table" function
?read_table()
  #(a)
#The default value for the "na" argument is is "NA"
  #(b)
#Character vector of strings to interpret as missing values

#######################################
###  Q6.3
#######################################
hammer_time <- read_table("hammer.fwf", na = character())
hammer_time 

#######################################
###  Q6.4
#######################################
#The highest chart position is 1
min(hammer_time$chart_position)
#The lowest chart position is 119
max(hammer_time$chart_position)
#The mean chart position is 32.8
#converts the "chart_position" to a numeric format and assigns it to
#a variable named "num_pos"
num_pos <- as.numeric(hammer_time$chart_position)
#checks the class to make sure
class(num_pos)
#finds the mean of all the positions excluding the NA
mean(num_pos[1:5])

##############################################################################
###  Question 7
##############################################################################
#checks the working directory to make sure that we are in the "library"
getwd()
#reads the "bottle.csv" file and stores it in a variable named "booze"
booze <- read_csv("bottle.csv")
#prints "booze"
booze

#######################################
###  Q7.1
#######################################
#prints the documentation for "str_detect()
?str_detect()
#detects the presence of the string "/" within the "price" column of "booze"
#and assigns it to "has_a_slash"
has_a_slash <- str_detect(string = booze$price, pattern = "/")
#prints "has_a_slash"
has_a_slash
#counts the number of "/" within the "price" column of "booze"
#6 observations had a slash
table(has_a_slash)

#######################################
###  Q7.2
#######################################
#returns the non-matching elements of the previous 
str_detect(string = booze$price, pattern = "/", negate = TRUE)
#removes all the rows that contain a "/" in the "booze$price" column 
booze$price <- str_remove(string = booze$price, pattern = "/")
booze$price

#######################################
###  Q7.3
#######################################
  #(a)
#detects the price values that contain a comma
str_detect(string = booze$price, pattern = ",")
  #(b)
#removes all the commas from the "price" column and sets it to "booze$price"
booze$price <- str_remove(string = booze$price, pattern = ",")
#prints booze$price to check
booze$price
  #(c)
#converts booze$price to an integer
booze$price<- as.integer(booze$price)
#checks the class of booze$price
class(booze$price)

#######################################
###  Q7.4
#######################################
#omits all the NA in the data frame
booze<- na.omit(booze)
  #(a)
#The max price is 157,000
max(booze$price)
  #(b)
#The min price is 12
min(booze$price)
  #(c)
#The index for the maximum is 85
match(max(booze$price),booze$price)
  #(d)
#The index for the minimum is 2069
match(min(booze$price),booze$price)
  #(e)
#The brand id of the most expensive bottle is 227
booze$brand_id[225]
  #(f)
#The brand id of the cheapest bottle is 2075
booze$brand_id[2069]
  #(g)
#You can buy 13083 bottles of the cheapest bottle with the most expensive bottle
157000 %/% 12
  #(h)
#The remainder is 4
157000 %% 12

#######################################
###  Q7.5
#######################################
#prints the "review_point" column to visualize the data
booze$review_point
  #(a)
#The highest review point score is 97
max(booze$review_point)
  #(b)
#The lowest review point score is 63
min(booze$review_point)
  #(c)
#The index for the highest review point score is 1
match(max(booze$review_point),booze$review_point)
  #(d)
#The index for the lowest review point score is 2241
match(min(booze$review_point),booze$review_point)
  #(e)
#The brand_id for the highest review point score is 1
booze$brand_id[1]
  #(f)
#The brand_id for the lowest review point score is 2247
booze$brand_id[2241]
  #(g)
#The average review point score is 86.69121
mean(booze$review_point)

#######################################
###  Q7.6
#######################################
#creates a new column called "price_per_point" in "booze"
#by dividing the "review_point" column by "price"
booze$price_per_point <- booze$review_point / booze$price
#prints the "price_per_point" column to check
booze$price_per_point
  #(a)
#The highest price per point is 6.769231
max(booze$price_per_point)
  #(b)
#The lowest price per point is 0.0005923567
min(booze$price_per_point)
  #(c)
#The index of the highest price point is 967
match(max(booze$price_per_point),booze$price_per_point)
  #(d)
#The index of the lowest price point is 85
match(min(booze$price_per_point),booze$price_per_point)
  #(e)
#The brand_id of the bottle with the best price_per_point is 971
booze$brand_id[967]
  #(f)
#The brand_id of the bottle with the best price_per_point is 86
booze$brand_id[85]

#############################################################################
###  Question 8
##############################################################################
#check to see if the working directory is "lounge"
getwd()

#######################################
###  Q8.1
#######################################
#reads the "pipe.csv" file to a variable called "pas_du_pipe"
pas_du_pipe <- read.csv("pipe.csv")
#prints pas_du_pipe to check
pas_du_pipe

#######################################
###  Q8.2
#######################################
#finds the unique elements of the "Service_Material" column
unique(pas_du_pipe$Service_Material)

#######################################
###  Q8.3
#######################################
#prints the documentation for "str_replace()"
?str_replace()

  #(a)
#replaces the "-" with "unknown" and stores it back into the "Service_Material"
#column
pas_du_pipe$Service_Material <- str_replace(pas_du_pipe$Service_Material, "-", "Unknown")
#prints the "Service_Material" column to check
pas_du_pipe$Service_Material
#checks the unique values of Service_material to make sure
unique(pas_du_pipe$Service_Material)
  #(b)
#replaces the "brass" with "Brass" and stores it back into the "Service_Material"
#column
pas_du_pipe$Service_Material <- str_replace(pas_du_pipe$Service_Material, "brass", "Brass")
#prints the "Service_Material" column to check
pas_du_pipe$Service_Material
#checks the unique values of Service_material to make sure
unique(pas_du_pipe$Service_Material)
  #(c)
#replaces the "brass" with "Brass" and stores it back into the "Service_Material"
#column
pas_du_pipe$Service_Material <- str_replace(pas_du_pipe$Service_Material, "iron", "Iron")
#prints the "Service_Material" column to check
pas_du_pipe$Service_Material
#checks the unique values of Service_material to make sure
unique(pas_du_pipe$Service_Material)

#######################################
###  Q8.4
#######################################
#converts the "Service_Material" column to a factor
pas_du_pipe$Service_Material <- as_factor(pas_du_pipe$Service_Material)
#shows the class to check
class(pas_du_pipe$Service_Material)

#######################################
###  Q8.5
#######################################
#counts how many times each unique value of "Service_Material" occurs
#and stores it in "material_tbl"
material_tbl <- summary(pas_du_pipe$Service_Material)
#prints "material_tbl" to check
material_tbl

#######################################
###  Q8.6
#######################################
#The most common material is Copper
#order returns a permutation which rearranges its first argument into ascending 
#or descending order, breaking ties by further arguments
order(material_tbl, decreasing = TRUE)

#############################################################################
###  Question 9
##############################################################################
#checks if the current working directory is "study"
getwd()

#######################################
###  Q9.1
#######################################
#reads the "wrench.csv" file and stores it in a variable called "wrench" for 
#convenience
wrench <- read_csv("wrench.csv")
#prints wrench to check
wrench
#prints out the first 30 rows of the "wrench.csv" file
read_csv("wrench.csv")[1:30, ]

#######################################
###  Q9.2
#######################################
#prints out the 'British/Commonwealth name" data to visualize 
wrench$`British/Commonwealth name`
#Re-reads in the data file, this time using the appropriate argument to define 
#this character as a missing value, converting it to an NA in the data frame
#sets the variable to "wrench_time" to work with the data better
wrench_time <- read_csv("wrench.csv", na = character())
#prints out the new column with NA as a character
wrench_time$`British/Commonwealth name`

#######################################
###  Q9.3
#######################################
#identifies which values in the "British/Commonwealth name" are missing and 
#assigns it to "bloody_well_missing"
bloody_well_missing <- str_detect(wrench_time$`British/Commonwealth name`, pattern = "NA")
#prints "bloody_well_missing"
bloody_well_missing

#######################################
###  Q9.4
#######################################
#performs a logical comparison to see which wrenches have the same name and names it
#is_same_name
is_same_name <- wrench_time$`British/Commonwealth name`[wrench_time$`British/Commonwealth name` %in% wrench_time$`American name`]
#prints "is_same_name" to check
is_same_name
  #(a)
#according to "is_same_name", 3 wrenches have the same name in both countries
is_same_name
  #(b)
#subsets the data frame to just those rows
#their names are "torque wrench", "rigger-jigger", and "chain whip"
wrench_time[is_same_name, ]