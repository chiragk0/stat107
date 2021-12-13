list.files()

# Move into the `School` directory
setwd("./School")
# Check the working directory
getwd()

#I changed everything before "Lab-03" to "~/Downloads/"
setwd("~/Downloads/Lab-03/School/Classes/2020")

#The files under the 2020 directory are "covid19.csv", "Icon/r",and "plague_mask.jpg"
list.files()

# Move back to the parent directory, `Classes`
setwd("..")

# Confirm the working directory has changed
# You SHOULD be in the `Classes` directory
getwd()
# Then check the content to the working directory
list.files()

# Move into `any_year_but_2020` using a relative path
setwd("any_year_but_2020")
# Double check that the directory changed
getwd()

list.files("../2020")

getwd()

list.files()

setwd("./Fall")
list.files()

list.files(recursive = TRUE)

#resets the working directory to the home directory
setwd("~/")
#sets the working directory to "mansion"
setwd("~/Downloads/Lab-03/School/Classes/any_year_but_2020/Fall/Statistical Computing/Lessons/datafiles/mansion")
#gets the working directory and prints it
getwd()
#lists the files in the working directory
list.files()


setwd("conservatory")
getwd()

#loads the tidyverse
library(tidyverse)
#opens the documentation for read_tsv
?read_tsv
#reads a delimited file into a tibble
read_tsv("axe.tsv")

#Question 2 and Question 3
read_table2("axe.tsv")

list.files("../ballroom")

# See the documentation for `cat()`
?cat
# See the documentation for `readLines()`
?read_lines

# CONCATINATE the LINES from the file "../ballroom/candlestick.fwf"
# Using the "newline" escape character (\n) as the separator.
cat( read_lines( "../ballroom/candlestick.fwf" ) , sep = "\n" )
read_fwf("candlestick.fwf")

setwd("~/Downloads/Lab-03/School/Classes/any_year_but_2020/Fall/Statistical Computing/Lessons/datafiles/mansion")
setwd("ballroom")
getwd()

# Move up to the parent directory `mansion`
setwd("..")
# Confirm
getwd()

#I had to use 8 ".."s to get to the the "cereal.RData" file
list.files("..")
list.files("../..")
list.files("../../..")
list.files("../../../..")
list.files("../../../../..")
list.files("../../../../../..")
list.files("../../../../../../..")
list.files("../../../../../../../..")

load("../../../../../../../../cereal.RData")
cereal

# Confirm the names of the data frame
names(cereal)
# Access the column `sugars`
cereal$sugars
# Try to access the sugars column without using the `$` operator
sugars

attach(cereal)
# After "attaching" the cereal data frame
# Try AGAIN to access the sugars column without using the `$` operator
sugars

left_three <-
  cereal[1:10, 1:3]
left_three

right_two <-
  cereal[1:10, 15:16]
right_two

joined_lft3_rgt2 <-
  cbind(left_three, right_two)
joined_lft3_rgt2

setwd("~/Downloads/Lab-03/School/Classes/any_year_but_2020/Fall/Statistical Computing/Lessons/datafiles/mansion/hall")
install.packages("openxlsx")
library("openxlsx")
#The default value for the sheet argument is 1
?read.xlsx()

