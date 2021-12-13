##############################################################################
###  Question 1
##############################################################################

#######################################
###  rc2e Section 2.2
#######################################

x <- 3 #This sets 3 as the value for X
y <- 4 #This sets 4 as the value for Y
z <- sqrt(x^2 + y^2) #This square roots X^2 and Y^2 and stores it in Z
print(z) #This prints Z to be displayed

x <- 3 #This sets 3 as the value for X
print(x)#This prints X to be displayed

x <- c("fee", "fie", "foe", "fum")#This sets the string "fee", "fie", "foe", "fum" 
                                  #as the value for X
print(x)#This prints X to be displayed

foo <- 3#This sets 3 as the value for foo
print(foo)#This prints foo to be displayed

5 -> fum #This sets 5 as the value for fum, but it is poor syntax
print(fum)#This prints fum to be displayed

#######################################
###  rc2e Section 2.3
#######################################

x <- 10#This sets 10 as the value for x
y <- 50#This sets 50 as the value for y
z <- c("three", "blind", "mice") #This sets the string ("three", "blind", "mice") 
                                #as the value for z
f <- function(n, p) sqrt(p * (1 - p) / n)#This establishes variables n and p and 
                                        #finds the standard deviation of p
ls()#The ls function displays the names of objects in my workspace

x <- 10#This sets 10 as the value for x
y <- 50#This sets 50 as the value for y
z <- c("three", "blind", "mice")#This sets the string ("three", "blind", "mice") 
                                #as the value for z
f <- function(n, p) sqrt(p * (1 - p) / n)#This establishes variables n and p and 
                                          #finds the standard deviation of p
ls.str()#The ls.str function displays the names of objects in my workspace and
        #provides some information about them. 

ls()#The ls function displays the names of objects in my workspace
ls(all.names = TRUE)#This forces ls to list everything by setting the all.names 
#argument to TRUE

#######################################
###  rc2e Section 2.4
#######################################

x <- 2 * pi #This sets 2*pi as the value for x
x#This prints fum to be displayed
rm(x)#The rm function removes, permanently, one or more objects from the 
    #workspace
x#This prints fum to be displayed, but it is no longer found now 

rm(x, y, z)#This removes multiple objects from the workspace. 

ls()#The ls function displays the names of objects in my workspace
rm(list = ls())#This erases all the objects in my workspace
ls()#The ls function displays the names of objects in my workspace

#######################################
###  rc2e Section 2.5
#######################################

c(1, 1, 2, 3, 5, 8, 13, 21)#The c function constructs a vector
c(1 * pi, 2 * pi, 3 * pi, 4 * pi)#The c function constructs a vector
c("My", "twitter", "handle", "is", "@cmastication")#The c function constructs a vector
c(TRUE, TRUE, FALSE, TRUE)#The c function constructs a vector

v1 <- c(1, 2, 3)#This constructs a vector made up of (1, 2, 3) and assigns it to v1 
v2 <- c(4, 5, 6)#This constructs a vector made up of (4, 5, 6) and assigns it to v2 
c(v1, v2)#This prints v1 and v2 and displays them

mode(3.1415)#The mode function provides the mode of the provided object
mode("foo")#The mode function provides the mode of the provided object

c(3.1415, "foo")#This constructs a vector made up of (3.1415, "foo")
mode(c(3.1415, "foo"))#The mode function provides the mode of the provided object

#######################################
###  rc2e Section 2.8
#######################################

a <- 3#sets 3 to a 
a == pi#test for equality
a != pi#test for inequality
a < pi#test for less than
a > pi#test for greater than
a <= pi#test for less than or equal to
a >= pi#test for greater than or equal to 

v <- c(3, pi, 4)#This constructs a vector made up of (3, pi, 4)
w <- c(pi, pi, pi)#This constructs a vector made up of (pi, pi, pi)
v == w#test for equality
v != w#test for inequality
v < w#test for less than
v <= w#test for greater than
v > w#test for less than or equal to
v >= w#test for greater than or equal to 

v <- c(3, pi, 4)#This constructs a vector made up of (3, pi, 4)
v == pi#test for equality
v != pi#test for inequality

v <- c(3, pi, 4)#This constructs a vector made up of (3, pi, 4)
any(v == pi)#Return TRUE if any element of v equals pi
all(v == 0)#Return TRUE if all elements of v are zero

#######################################
###  rc2e Section 2.9
#######################################

fib <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)#This constructs a vector made up of (3, pi, 4)
                                         #and assigns it to fib
fib#prints fib
fib[1]#prints 1st element of fib
fib[2]#prints 2nd element of fib
fib[3]#prints 3rd element of fib
fib[4]#prints 4th element of fib
fib[5]#prints 5th element of fib

fib[1:3]#selects elements 1 to 3
fib[4:9]#selects elements 4 to 9

fib[c(1, 2, 4, 8)]#selects elements 1,2,4,8

fib[-1]#exclude first value and return all other values 

fib[1:3]#selects elements 1 to 3
fib[-(1:3)]#excludes elements 1 to 3

fib < 10#This vector is TRUE wherever fib is less than 10
fib[fib < 10]#Use that vector to select elements less than 10
fib %% 2 == 0#This vector is TRUE wherever fib is even
fib[fib %% 2 == 0]#Use that vector to select the even elements

v <- c(3, 6, 1, 9, 11, 16, 0, 3, 1, 45, 2, 8, 9, 6, -4)#sets a list of numbers to v
v[ v > median(v)]#selects all numbers greater than the median

v[(v < quantile(v, 0.05)) | (v > quantile(v, 0.95)) ]#selects elements in the lower 
                                                     #and upper 5%
v[ abs(v - mean(v)) > sd(v)]#selects all elements that exceed +/-
                            #1 standard deviations from the mean.
v <- c(1, 2, 3, NA, 5)#sets new values to v
v[!is.na(v) & !is.null(v)]#selects all elements that are neither NA or NULL

years <- c(1960, 1964, 1976, 1994)#This constructs a vector made up of (1960, 1964, 1976, 1994)
names(years) <- c("Kennedy", "Johnson", "Carter", "Clinton")#define the names by 
                                                            #assigning a vector of character strings to the attribute
years#prints years

years["Carter"]#refers to the element Carter
years["Clinton"]#refers to the element Clinton

years[c("Carter", "Clinton")]#This generalizes to allow indexing by vectors of names

#######################################
###  rc2e Section 2.10
#######################################

v <- c(11, 12, 13, 14, 15)#This constructs a vector made up of (11, 12, 13, 14, 15)
w <- c(1, 2, 3, 4, 5)#This constructs a vector made up of (11, 12, 13, 14, 15)
v + w#print v+w
v - w#prints v-w
v * w#print v*w
v / w#prints v/w
w^v#prints w^v

w#prints w
w + 2#prints w+2
w - 2#prints w-2
w * 2#prints w*2
w / 2#prints w/2
2^w#prints 2^w

mean(w)#prints the mean of w
w - mean(w)#prints w - the mean of w

sd(w)#prints the standard deviation of w
(w - mean(w)) / sd(w)#calculates the z-score of a vector in one expression

w <- 1:5#sets numbers 1 to 5 to w
w#prints w
sqrt(w)#prints the square root of w
log(w)#prints the log of w
sin(w)#prints the sin of w

#######################################
###  rc2e Section 5.4
#######################################

f <- factor(v)#The factor function encodes my vector of discrete values into a factor

f <- factor(v, levels)#This includes a second argument that gives the possible
                      #levels of the factor

f <- factor(c("Win", "Win", "Lose", "Tie", "Win", "Lose"))#converts categorical data
                                                          #into a factor
f#prints f

wday <- c("Wed", "Thu", "Mon", "Wed", "Thu",
          "Thu", "Thu", "Tue", "Thu", "Tue")#This constructs a vector made up of (11, 12, 13, 14, 15)
f <- factor(wday)#encodes wday into a factor
f#print f

f <- factor(wday, levels=c("Mon", "Tue", "Wed", "Thu", "Fri"))#lists the possible values of wday explicitly
f#prints f

##############################################################################
###  Question 2
##############################################################################

#######################################
###  Question 2, Part (i)
#######################################

w <- c(1, 2, 3, 4, 5)
v <- c(11, 12, 13, 14, 15)

v%%2#1st,3rd,and 5th values are odd
v%/%2#1st,4th,and 5th values are odd
w^3#1st,3rd,and 5th values are odd
v*exp(3)/pi#1st,3rd,4th,and 5th values are odd
3^w#1st,2nd,3rd,4th,5th values are odd
v-5#2nd and 4th values are odd
prod(w)#none of the values are odd

cumprod(w)#the cumulative product is 120
sum(v)#the sum is 65
cumsum(v)#the cumulative sum is 65

#######################################
###  Question 2, Part (ii)
#######################################

v %% 5 #prints the remainder of each element of v is divided by 5
(v %% 5) == 0#checks if the remainder of each element of v divided by 5 is 0
(v %% 5) == 0|(v %% 2) == 0#checks if the remainder of each element of v divided 
                           #by 5 or 2 is 0
(v %% 7) == 0&(v %% 2) == 0#checks if the remainder of each element of v divided
                           #by 7 and 2 is 0

#######################################
###  Question 2, Part (iii)
#######################################

(v %% 2) == 0 #checks if the remainder of each element of v divided by 2 is 0
v > 12#checks if each element of v is greater than 12
(v %% 2) == 0&v > 12#checks if the remainder of each element of v divided by 2 
                    #is 0 and if each element of v is greater than 12
v[(v %% 2) == 0&v > 12]#selects all elements that are have a remainder of 0 when
                       #divided by 2 and are greater than 12

#######################################
###  Question 2, Part (iv)
#######################################

w_grtr_3 <- w > 3# Creates a logical vector which checks if an element in `w` is greater than 3
                 # and assigns it to a variable named w_grtr_3
w_grtr_3#prints w_grtr_3
!w_grtr_3#prints the opposite of the normal boolean values for w_grtr_3

##############################################################################
###  Question 3
##############################################################################

my_ltrs <- 
  sample(
    c("r","o", "t", "c", "a", "f", "s"), 
    size = 25, 
    replace = TRUE#
  )
my_ltrs#

my_ltrs <- factor(my_ltrs)
my_ltrs
sort(my_ltrs)#

my_ltrs <- factor(my_ltrs,
                  levels = c('f','a','c','t','o','r','s')#
)
my_ltrs#
sort(my_ltrs)#
