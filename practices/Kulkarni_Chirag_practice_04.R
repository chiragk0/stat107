
#######################################
###  5.1
#######################################
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
nycflights13::flights
#######################################
###  5.2
#######################################
filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)
(dec25 <- filter(flights, month == 12, day == 25))

filter(flights, month = 1)
sqrt(2) ^ 2 == 2
1 / 49 * 49 == 1
near(sqrt(2) ^ 2,  2)
near(1 / 49 * 49, 1)

filter(flights, month == 11 | month == 12)
nov_dec <- filter(flights, month %in% c(11, 12))
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)

NA > 5
10 == NA
NA + 10
NA / 2
NA == NA

# Let x be Mary's age. We don't know how old she is.
x <- NA
# Let y be John's age. We don't know how old he is.
y <- NA
# Are John and Mary the same age?
x == y
is.na(x)

Exercises:
  #1
filter(flights, arr_delay >= 120) #1
filter(flights, dest == "IAH" | dest == "HOU") #2
filter(flights, carrier %in% c("AA", "DL", "UA")) #3
filter(flights, month >= 7, month <= 9) #4
filter(flights, arr_delay > 120, dep_delay <= 0) #5
filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30) #6
filter(flights, dep_time %% 2400 <= 600) #7
  #2
#This is a shortcut for x >= left & x <= right
?between()
filter(flights, between(month, 7, 9))
  #3
#The "arr_time" and "summary" seem to be missing too
filter(flights, is.na(dep_time))
  #4
#NA ^ 0 = 1
NA ^ 0
#This is TRUE because the default value is TRUE. Hence, the missing values are
#by default, TRUE. 
NA | TRUE
#Anything and FALSE is always FALSE.
NA & FALSE
NA | FALSE
NA & TRUE
NA * 0

#######################################
###  5.3
#######################################
arrange(flights, year, month, day)
arrange(flights, desc(dep_delay))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)

arrange(df, desc(x))

Exercises:
  #1
#The "arrange()" function puts the values listed as NA last
arrange(flights, dep_time) %>%tail()
  #2
#The most delayed flight was HA 51, which was delayed 1301 minutes
arrange(flights, desc(dep_delay))
#Flight B6 97 departed 43 min early
arrange(flights, dep_delay)
  #3
head(arrange(flights, desc(distance / air_time)))
  #4
#The longest flight was HA 51, which was 4983 miles
arrange(flights, desc(distance))
#The shortest flight was US 1632 which was 17 miles.
arrange(flights, distance)

#######################################
###  5.4
#######################################
select(flights, year, month, day)
select(flights, year:day)
select(flights, -(year:day))

rename(flights, tail_num = tailnum)
select(flights, time_hour, air_time, everything())

Exercises:
  #1
#variable names
select(flights, dep_time, dep_delay, arr_time, arr_delay)
#strings
select(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")
#column numbers
select(flights, 4, 6, 7, 9)
  #2
#The select call ignores the duplication
select(flights, year, month, day, year, year)
  #3
#selects variables with a character vector instead of unquoted variable name arguments
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))
  #4
#The default behavior for the "contains()" function is to ignore the case.
select(flights, contains("TIME"))

#######################################
###  5.5
#######################################
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)

transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)

Exercises:
  #1
flights_airtime <-
 mutate(flights,
         dep_time = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
         arr_time = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,
         air_time_diff = air_time - arr_time + dep_time
  )
select(
  flights_times, dep_time, dep_time_mins, sched_dep_time,
  sched_dep_time_mins
)

  #2
#there are many flights for which "air_time != arr_time - dep_time".
flights_airtime <-
mutate(flights,
         dep_time = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
         arr_time = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,
         air_time_diff = air_time - arr_time + dep_time
  )

nrow(filter(flights_airtime, air_time_diff != 0))
  #3
flights_deptime <-
  mutate(flights,
         dep_time_min = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
         sched_dep_time_min = (sched_dep_time %/% 100 * 60 +
                                 sched_dep_time %% 100) %% 1440,
         dep_delay_diff = dep_delay - dep_time_min + sched_dep_time_min
  )
  #4
rankme <- tibble(
  x = c(10, 5, 1, 5, 5)
)

rankme <- mutate(rankme,
                 x_row_number = row_number(x),
                 x_min_rank = min_rank(x),
                 x_dense_rank = dense_rank(x)
)
arrange(rankme, x)
  #5
1:3 + 1:10
  #6
?trig()

#######################################
###  5.6
#######################################
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
                   
                   flights %>% 
                     group_by(year, month, day) %>% 
                     summarise(mean = mean(dep_delay, na.rm = TRUE))

flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay, na.rm = TRUE))

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

daily <- group_by(flights, year, month, day)
(per_day   <- summarise(daily, flights = n()))

(per_month <- summarise(per_day, flights = sum(flights)))

daily %>% 
  ungroup() %>%             # no longer grouped by date
  summarise(flights = n())  # all flights

