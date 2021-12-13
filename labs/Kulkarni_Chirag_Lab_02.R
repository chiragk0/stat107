#################################
###  QUESTION 1
#################################
### SOLUTION
?matrix

### WRITTEN RESPONSE:
# The first three arguments are 
#   "data"
#   "nrow"
#   "ncolumn"
#################################
#################################


matrix(  c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102), 1   , 11  )
matrix(  c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102), ncol = 11   , nrow = 1  )

#################################
###  QUESTION 2
#################################
### SOLUTION
?matrix #(same solution as last time)

### WRITTEN RESPONSE:
# The default values for nrow and ncol are:
#   nrow = 1
#   ncol = 1
#################################
#################################

matrix(  c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102), nrow = 1  )
matrix(  c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102), ncol = 11  )

#################################
###  QUESTION 3
#################################
### SOLUTION
?rbind()

### WRITTEN RESPONSE:
# The rbind() function comes from the 'base' package
#################################
#################################

rbind(c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102))
cbind(c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102))

#################################
###  QUESTION 4
#################################
### SOLUTION
drownings<-c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102)
drownings
mean(drownings)

### WRITTEN RESPONSE:
# The average number of drowning deaths is 100.3636
#################################
#################################

?rep
rep(x = 1, times = 11)
c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)
c(rep(x = 1, times = 11), c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4))

matrix(c(rep(x = 1, times = 11), c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)), nrow = 2)

#byrow:	
#logical. If FALSE (the default) the matrix is filled by columns, otherwise the 
#matrix is filled by rows.

#################################
###  QUESTION 5
#################################
### SOLUTION
?matrix

### WRITTEN RESPONSE:
# The default value for byrows is FALSE
#################################
#################################

matrix(data = c(rep(x = 1, times = 11), 
                c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)  ), 
       nrow = 2,
       byrow = TRUE)

sideways_mat <- 
  matrix(data = c(rep(x = 1, times = 11), c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)), 
         nrow = 2,
         byrow = TRUE
  )
sideways_mat

?t
t(sideways_mat)

matrix(data = c(rep(x = 1, times = 11), c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)), 
       ncol = 2)
matrix(data = c(rep(x = 1, times = 11), c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)), 
       nrow = 11)

cbind(
  rep(x = 1, times = 11), 
  c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)
)

nic_cage<-cbind(
  rep(x = 1, times = 11), 
  c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4)
)
nic_cage

nic_cage[, 1]
nic_cage[, 1, drop = FALSE]

#################################
###  QUESTION 6
#################################
### SOLUTION
nic_cage[1, ]

### WRITTEN RESPONSE:
# The fourth row contains values 1 and 3
#################################
#################################

#################################
###  QUESTION 7
#################################
### SOLUTION
mean(nic_cage[,1])

### WRITTEN RESPONSE:
# The average value for the first column is 1
#################################
#################################

#################################
###  QUESTION 8
#################################
### SOLUTION
mean(nic_cage[,2])

### WRITTEN RESPONSE:
# Nicholas Cage acted for an average of 2.2727 years between 1999 and 2009
#################################
#################################

t(nic_cage)
dim(t(nic_cage))
dim(nic_cage)

x_prime_x <- 
  t(nic_cage) %*% nic_cage
x_prime_x

#################################
###  QUESTION 9
#################################
### SOLUTION
dim(x_prime_x)

### WRITTEN RESPONSE:
#The dimensions of x'x are 2x2
#################################
#################################

#################################
###  QUESTION 10
#################################
### SOLUTION
x_prime_x

### WRITTEN RESPONSE: the matrix stored in x_prime_x is 11,25,25,69
#################################
#################################

?solve
solve(x_prime_x)

beta_hat <-
  solve(x_prime_x) %*% t(nic_cage) %*% drownings
beta_hat

help(rownames, package = "base")
rownames(beta_hat)

rownames(beta_hat) <-
  c("Intercept", "Slope")
rownames(beta_hat)

str(PlantGrowth)

install.packages("tidyverse")
library(tidyverse)

nico_drown_tbl <-
  tibble(
    films = nic_cage[,2],
    drown = drownings
  )

str(nico_drown_tbl)
nico_drown_tbl

tibble(
  films = c(2, 2, 2, 3, 1, 1, 2, 3, 4, 1, 4),
  drown = c(109, 102, 102, 98, 85, 95, 96, 98, 123, 94, 102)
)

tribble(
  ~ films, ~ drown,
  2,     109,         
  2,     102,         
  2,     102,         
  3,      98,     
  1,      85,     
  1,      95,     
  2,      96,     
  3,      98,     
  4,     123,         
  1,      94
)

#################################
###  QUESTION 11
#################################
### SOLUTION
?lm()

### WRITTEN RESPONSE: The function lm() is part of the stats package
#################################
#################################

my_first_formula <- y ~ x
my_first_formula

class(my_first_formula)

model.matrix(drown ~ films, 
             data = nico_drown_tbl)
nic_cage

my_lm <- 
  lm(drown ~ films, 
     data = nico_drown_tbl)
class(my_lm)

my_lm

beta_hat

class(my_lm)
summary(my_lm)

class(nico_drown_tbl)

#################################
###  QUESTION 12
#################################
### SOLUTION
cor(nico_drown_tbl)

### WRITTEN RESPONSE: The cor() function gives the correlation between the two variables
#################################
#################################