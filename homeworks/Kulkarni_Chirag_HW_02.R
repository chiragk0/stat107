#Question1: g

#Question2: section 1.11

#Question3:
           #1. You can't fix a bug until you know it exists 
           #2. Be able to reproduce a bug on command
           #3. Identify the line(s) of code that cause the bug
           #4. Fix the bug and test it to ensure the fix worked. 

#Question 4:
            # Assign the value `20` to the variable `my_variable`
            my_variable <- 10
            # Print to check
            my_varıable #(This doesn't work because we assigned the value 10 instead of 20)

#Question 5: 
            # Assign the value `20` to the variable `my_variable`
            x y <- 10
            # Print to check
            3 == NA
            #1. Warn if variable used has no definition in scope
            #2. Warn if variable is defined but not used
            #3. Provide R style diagnostics (e.g. whitespace)

#Question 6: 
            #The keyboard shortcut quick reference appears. You can go under
            #the tools menu and find the keyboard shortcut quick reference as 
            #an option.
            
#Question 7: 
            #creates an initial sqr_even_mat to work with
            sqr_even_mat <- matrix(1:16, nrow = 4, ncol = 4)
            #multiplies the initial sqr_even_mat by 2 and transposes it
            sqr_even_mat <- 2*t(sqr_even_mat)
            #prints sqr_even_mat
            sqr_even_mat
            
            #creates a two_col_mat matrix to work with
            two_col_mat <- matrix(c(8, 16, 24, 32, 6, 14, 22, 30), nrow = 4, ncol = 2)
            #prints two_col_mat
            two_col_mat
            
#Question 8: 
            #multiplies the aforementioned matrices and stores it in prod_mat
            prod_mat = sqr_even_mat  %*% two_col_mat
            #prints prod_mat
            prod_mat
            
#Question 9:
            ?diag()
            #created a diagonal matrix with values 0.1, 0.01, and 0.001 
            decimal_shift_mat<-diag(c(0.1,0.01,0.001,0.0001), nrow = 4, ncol = 4)
            decimal_shift_mat
            
            #converts the prod_mat to a vector, multiplies it by decimal_shift mat,
            #and assigns it to shifted_decimal_mat
            shifted_decimal_mat<-as.vector(prod_mat) * decimal_shift_mat
            #prints shifted_decimal_mat
            shifted_decimal_mat

#Question 10:
            #(i)
            
            #halves a quadruple (this fixes a mistake I had made earlier) 
            #the first value of the first column(since rest of the values are 0)
            shifted_decimal_mat[1,1] <- 0.5*shifted_decimal_mat[1,1]
            #prints shifted_decimal_mat
            shifted_decimal_mat
            #halves the second column of the second row (since rest of the values
            #in the column are 0)
            shifted_decimal_mat[2,2] <- 1/2*shifted_decimal_mat[2,2]
            #prints shifted_decimal_mat
            shifted_decimal_mat
            #sets the new matrix we have into double_triple_mat
            double_triple_mat <- shifted_decimal_mat
            #prints double_triple_mat
            double_triple_mat
    
            #(ii)
            
            #multiplies shifted_decimal_mat and double_triple_mat and sets them
            #to dub_half_decimal_mat
            dub_half_decimal_mat <- shifted_decimal_mat %*% double_triple_mat
            #prints dub_half_decimal_mat
            dub_half_decimal_mat
            
            #(iii)
            
            #assignes the name "Dub" to the first column
            colnames(dub_half_decimal_mat)[1] <- c("Dub")
            #assigns the name "Half" to the second column
            colnames(dub_half_decimal_mat)[2] <- c("Half")
            #prints dub_half_decimal_mat with the new names
            print(dub_half_decimal_mat)
            #the following two lines rectify an error I had made earlier
            colnames(dub_half_decimal_mat)[4] <- c("[,4]")
            colnames(dub_half_decimal_mat)[3] <- c("[,3]")
            
            #(iv)
            
            #sets the name "1st" to the first row
            rownames(dub_half_decimal_mat)[1] <- c("1st")
            #sets the name "2nd" to the second row
            rownames(dub_half_decimal_mat)[2] <- c("2nd")
            #sets the name "3rd" to the third row
            rownames(dub_half_decimal_mat)[3] <- c("3rd")
            dub_half_decimal_mat
            
#Question 11:
            #implement the cbind() function to bind the columns together
            six_col_mat<-cbind(sqr_even_mat,two_col_mat)
            #prints six_col_mat
            six_col_mat

#Question 12:
            ?rbind()
            #this is supposed to bind the two rows but is unable to since the
            #number of columns in each matrix don't match.
            rbind(two_col_mat, sqr_even_mat)
#Question 13:
            
            #(i)
            #transposes two_col_mat and assigns it to two_row_mat
            two_row_mat <- t(two_col_mat)
            #prints two_row_mat
            two_row_mat
           
            #(ii)
            #creates the first row of the matrix
            two_row_mat[1,]
            #creates the second row of the matrix
            two_row_mat[2,]
            #binds the two aforementioned matrices together
            two_row_mat2 <- rbind(two_row_mat[1,], two_row_mat[2,])
            #prints two_row_mat2
            two_row_mat2
            
            #(iii)
            #checks if two_row_mat and two_row_mat2 are equal
            all.equal(two_row_mat, two_row_mat2)
            
#Question 14:
            #binds two_row_mat to the top of sqr_even_mat and assigns it to 
            #six_row_mat
            six_row_mat <- rbind(two_row_mat, sqr_even_mat)
            #prints six_row_mat
            six_row_mat
            
#Question15:
    #loads the tidyverse collection of packages
    library(tidyverse)
    #creates a data frame of the information provided and names it just_10_states
    just_10_states <- data.frame(
                                state = c("Alabama", "Colorado", "Kansas", "Massachusetts","Michigan", "Minnesota", "Nebraska","Ohio","South Dakota","Texas"),
                                birth_rt_15_to_17 = c(31.5,26.2,21.4,12.5,18.0,14.2,18.3,20.1,17.3,38.2),
                                state_pov_rt = c(20.1,8.8,10.8,11.0,12.2,9.2,9.6,11.5,14.5,17.4)
                                )
    #coverts the data frame to a tibble and names it just_10_states
    just_10_states <- as_tibble(just_10_states)
    just_10_states
    
#Question16:
    #creates a replicate of the data in a tribble and names it only_10_states
    only_10_states <- tribble(
                             ~state,~birth_rt_15_to_17,~state_pov_rt,
                              #------|-----------------|-------------
                              "Alabama" ,31.5, 20.1,
                              "Colorado",26.2, 8.8,
                              "Kansas",21.4, 10.8,
                              "Massachusetts",12.5,11.0,
                              "Michigan",18.0, 12.2,
                              "Minnesota",14.2, 9.2,
                              "Nebraska",18.3,  9.6,
                              "Ohio",20.1, 11.5,
                              "South_Dakota",17.3,14.5,
                              "Texas",38.2, 17.4
                     )
    #prints just_10_states
    only_10_states
    
    #checks if just_10_states and only_10_states are exactly equal
    identical(just_10_states,only_10_states)
    #checks if just_10_states and only_10_states are all equal and reports any
    #differences
    all.equal(just_10_states,only_10_states)
  
#Question17:
    #capitalizes the first column of only_10_states
    colnames(only_10_states)[1] <- c('States')
    #prints only_10_states to check
    only_10_states
    #checks if just_10_states and only_10_states are exactly equal
    identical(just_10_states,only_10_states)
    #checks if just_10_states and only_10_states are all equal and reports any
    #differences. We find that there is one string mismatch now.
    all.equal(just_10_states,only_10_states)
    
#Question18:
    
    #(i)
    #The "lm" stands for linear model
    ?lm()
    
    #(ii)
    #re-assigns the given respective values to birth_rt_15_to_17
    birth_rt_15_to_17 = c(31.5,26.2,21.4,12.5,18.0,14.2,18.3,20.1,17.3,38.2)
    #re-assigns the given respective values to state_pov_rt
    state_pov_rt = c(20.1,8.8,10.8,11.0,12.2,9.2,9.6,11.5,14.5,17.4)
    #fits the linear model between birth_rt_15_to_17 and state_pov_rt 
    #and assigns it to teen_birth_lm
    teen_birth_lm <- lm(birth_rt_15_to_17~state_pov_rt, data = just_10_states)
    #prints teen_birth_lm
    teen_birth_lm
    #(a): I used the linear regression formula in the call to lm()
    #(b): estimated intercept: 3.604
         #slope: 1.452
    
    #(iii)
    summary(teen_birth_lm)
    #(a)I used the summary() function to reveal the statistical summary of the
       #fit model
    #(b)8 degrees of freedom
    #(c)r^2 = 0.4571
    
#Question19:
    #creates a new data frame with the given data and assigns it to NorthDakota
    NorthDakota<-data.frame(
              state = c("North_Dakota"),
              birth_rt_15_to_17 = c(11.7),
              state_pov_rt = c(12)
               )
    #prints NorthDakota
    NorthDakota
    #binds NorthDakota to the top of just_10_states and names the new data frame
    #just_11_states
    just_11_states<-rbind.data.frame(NorthDakota,just_10_states)
    #prints just_11_states
    just_11_states
    #prints the first three rows of just_11_states
    head(just_11_states, 3)
    
#Question20:
    #helps visualize the data by re-printing the linear model values from earlier
    lm(birth_rt_15_to_17~state_pov_rt, data = just_10_states)
    #provides a summmary of just_10_states
    summary(just_10_states)
    #states the class of the 10 states
    class(just_10_states)
    as.matrix(just_10_states)
    
    #I got stuck on this last problem and could not finish in time. I'm hoping to revist 
    #the lectures to find the answer.
    