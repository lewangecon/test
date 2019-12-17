mtcars

library(dplyr)

summary(mtcars)

mtcars <- mtcars %>% 
          filter(mpg >= mean(mpg))

summary(mtcars)

weighted.mean(mtcars$mpg, mtcars$wt)