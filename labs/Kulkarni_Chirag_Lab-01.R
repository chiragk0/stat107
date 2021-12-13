## ----setup, include=FALSE--------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, dev="cairo_pdf")


## --------------------------------------------------------------------------------
# Assign the value of `10` to the variable `x`
# Replace the three dots with the correct assignment operator
x<-10
# Simply run a line with only the variable's name to PRINT TO CHECK
x


## --------------------------------------------------------------------------------
# Assign the value of `10` to the variables `x`, `y`, and `z`
x <- y <- z <- n <- 10

# Print to check
x
y
z
n


## -------------------------------------------------------------------
y

# Make `y` increase by one.  Do this by assigning `y` the value of `y` plus 1
y <- y+1
y


## -------------------------------------------------------------------------
class(x)


## -------------------------------------------------------------------------
xbar <- 3.666
xbar

m0 <- 3
m0

stddev <- 1.212
stddev

# Store the sample size
n <- 10
# Print to check
n
# Take the square root of the sample size
sqrt(n)

# Use all of the values in the equation for t
t_stat <- (xbar - m0) / (stddev / n)
t_stat


## ---- CHECK N ---------------------------------------------------------
# Please type the code from the lab here, then submit it to the console.
#
# NOTE THAT applying the `sqrt()` function to `n` does not change the value of `n`


## ---- ASSIGN SQRT N ---------------------------------------------------------------------
# Please type the code from the lab here, then submit it to the console.
#
# NOTE THAT we can only save the changed the value of `n` by assigning the return value 
# to a new variable
...
sqrt_n <- sqrt(n)
t_stat <- (xbar - m0) / (stddev / sqrt_n)
t_stat

###############################################################################
##  TYPE CONVERSION
###############################################################################

## --------------------------------------------------------------------------------
class(x)

x_str <- as.character(x)
x_str
# Change the below `...` to match the lab
class(x_str)


## -------------------------------------------------------------------------
x_str^2

# Change the below `...` to match the lab
as.numeric(x_str)^2


## --------------------------------------------------------------------------------
is.integer(x)
is.numeric(x)
is.character(x)

is.numeric(x_str)
is.character(x_str)


## --------------------------------------------------------------------------------
decimal_nums <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
decimal_nums

integer_nums <- 1:10
integer_nums

class(decimal_nums)
class(integer_nums)

## -------------------------------------------------------------------
integer_nums / 2
class(integer_nums / 2)

## ---- echo = FALSE---------------------------------------------------------------
set.seed(1)
mixed_nums <- sample(integer_nums)


## --------------------------------------------------------------------------------
mixed_nums

min(mixed_nums)
max(mixed_nums)
range(mixed_nums)

head(mixed_nums)
tail(mixed_nums)

sort(mixed_nums)
sort(mixed_nums, decreasing = TRUE)


## --------------------------------------------------------------------------------
mixed_nums

## --------------------------------------------------------------------------------
# Change the below `...` to match the lab
decending_nums <- sort(mixed_nums, decreasing = TRUE)
decending_nums


## --------------------------------------------------------------------------------

# Create a random sample
x <- c(rbinom(20, 10, 0.7), rbinom(10, 10, 0.3))
x

x_sorted<- sort(x)
# Print `x_sorted` for comparison with the values that follow. 
x_sorted

# Find the minimum of `x`
min(x)
# Find the maximum of `x`
max(x)
# Find the range of `x`
range(x)

# Calculate the total of all values in `x`
sum(x)
# How long is `x`???
length(x)

# Calculate the sample mean of `x` by calculating the separate values yourself:
#
# Assign the sum to a variable called `total`
total <- sum(x)
# Assign the number of observations to a variable called `n`
n <- length(x)
# Calculate the average = total divided by sample size
avg <- total / n
# Print to check
avg
# Now calculate the mean using the `mean()` function
mean(x)

# `unique()` returns only one of each unique value
unique(x)

# `table()` does something similar to `unique()`, except it also tells you how
#  often each value occurs 
table(x)

# these tables can be saved/assigned to a variable
freq_dist <- table(x)
freq_dist
class(freq_dist)



# Note that the `median` is the same as the 50% quantile
median(x)
quantile(x, 0.5)

# And we can find other quantiles
#
# Find the 25% quantile of `x`
quantile(x, 0.25)
# Find the 75% quantile of `x`
quantile(x, 0.75)

# Store the variance of `x`
var_x <- var(x)
# Print to check
var_x

# RECALL that the standard deviation is defined as the square-root of the variance.
sqrt(var_x)
# Calc the standard deviation directly
sd(x)

###############################################################################
##  Missing values
###############################################################################

## --------------------------------------------------------------------------------
0 / 0

1 / 0

10^10 / Inf

sin(Inf)
cos(-Inf)
tan(Inf)

args(mean)


## --------------------------------------------------------------------------------
x
mean(x)

x[3] <- N/A
x
mean(x)

?mean
mean(x, na.ram = TRUE)


## --------------------------------------------------------------------------------
miss <- NA
miss

miss == NA


## --------------------------------------------------------------------------------
# Check if `miss` contains a missing value
is.na(miss)

# This kind of check can be applied across an entire vector
is.na(x)

# Recall, since TRUE = 1 and FALSE = 0, we can count how many missing values we have
sum(is.na(x))

# We can likewise flip the TRUE/FALSE values by using the `!` symbol. This way, we can
# count how many NON-missing values we have
!is.na(x)
sum(!is.na(x))

# We can also use these logical result to subset the original vector, returning only 
# the non-missing values
x[!is.na(x)]



###############################################################################
##  Character vectors
###############################################################################

## --------------------------------------------------------------------------------
# Define the basic colors to be sampled
cmyk <- c("magenta", "red", "yellow", "green", "cyan", "blue", "black")
# Print to check
cmyk

# Sample the colors, with replacement
colorful <- sample(cmyk, 25, replace = TRUE)
# Print to check
colorful
# Check the variable's class
class(colorful)


## --------------------------------------------------------------------------------
sort(colorful)
colorful


## --------------------------------------------------------------------------------
# Convert the variable by coercing to factor and over-writing the original
colorful_fctr <- as.factor(colorful)
class(colorful_fctr)


## --------------------------------------------------------------------------------
colorful_fctr


## --------------------------------------------------------------------------------
levels(colorful_fctr)
sort(colorful_fctr)


## --------------------------------------------------------------------------------
cmyk

colorful_fctr <- 
    factors(colorful, 
           levels = cymk)

class(colorful_fctr)
colorful
levels(colorful_fctr)

sort(colorful_fctr)


## --------------------------------------------------------------------------------
# Tablulate the counts of the CHARACTER vector `colorful`
color_counts <- 
    table(colorful) # <<< This is a character variable
color_counts

# Tablulate the counts of the FACTOR vector `colorful_fctr`. 
# Over-write the previous `color_counts`
color_counts <- 
    table(colorful_fctr)  # <<< This is a factor variable
color_counts




## --------------------------------------------------------------------------------
num_char <- c("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten")

num_char[3]

num_char <- as.factor( num_char )
num_char
num_char[8]


## --------------------------------------------------------------------------------
sort(num_char)

num_char <- 
    factor( 
        num_char,
        levels = num_char)
num_char
sort(num_char)


## --------------------------------------------------------------------------------
# Any and all lines beginning with a hashtag will be
# readable by YOU, but will be completely ignored by R

# Note that the variable `x` will not be printed to the console

# x
y
z
n


## --------------------------------------------------------------------------------

print("This code ought to be commented!!!")

print("Mac: Place your cursor on the above line, then press `Cmnd` + `Shift` + `C`")
print("Windows: Place your cursor on the above line, then press `Ctrl` + `Shift` + `C`")

print("Next, press `Cmnd/Ctrl` + `Shift` + `C` again to uncomment the line.")

print("Finally, highlight all of the lines with a print function...")
print("... and comment them out with `Cmnd/Ctrl` + `Shift` + `C`")



##################################################################################
##################################################################################
###     END OF LAB
##################################################################################
##################################################################################

expected_number<-(1*0.249)+(2*0.108)+(3*0.091)+(4*0.118)+(5*0.133)+(6*0.109)+(7*0.07)+(8*0.057)+(9*0.046)+(10*0.019)
expected_number

n <- 15
p <- 1/3
x <- 0:n

np<-15 * 1/3
np