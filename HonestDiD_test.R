library(tidyverse)

set.seed(123456)

# Simulate a dataset with 200 individuals and 7 periods, 
# Treated Group: The first 100 invidiuals
# Base Period: 4
# the treatment starts in the fifth period
# Constant Treatment effect


  data <- data.frame(time = rep(c(1:7), 200)) %>% 
    mutate(id = (row_number()-1)%/%7 + 1,
           d = as.numeric(row_number()<=700)) %>% 
    group_by(id) %>% 
    mutate(post = as.numeric(time>4)) %>% 
    mutate(y = d + post + rnorm(n()),
           y = ifelse(d==1 & post == 1, y + .5, y))
  
  data <- fastDummies::dummy_cols(data, select_columns = "time")
  
  data <- data %>% 
    mutate(t1p = time_1*d,
           t2p = time_2*d,
           t3p = time_3*d,
           t5p = time_5*d,
           t6p = time_6*d,
           t7p = time_7*d
           )

# DID Estimation 

  results <- lm(y ~ d + post + t1p + t2p + t3p + t5p + t6p + t7p, data = data)
  summary(results)

# Take out the coefficients and var-cov matrix
  betahat <- results$coefficients[c("t1p", "t2p","t3p", "t5p", "t6p", "t7p")]
  
  sigma <- vcov(results)
  sigma <- sigma[c("t1p", "t2p","t3p", "t5p", "t6p", "t7p"), c("t1p", "t2p","t3p", "t5p", "t6p", "t7p")]

# Put them in the structure as in the paper
  data <- list(betahat = betahat,
               sigma = sigma,
               prePeriodIndices = c(1:3),
               postPeriodIndices = c(4:6)
               )

# Below is the code snippet from the paper
numPrePeriods = length(data_college$prePeriodIndices)
numPostPeriods = length(data_college$postPeriodIndices)

l_vec = basisVector(1, numPostPeriods)


DeltaSD_RobustResults = createSensitivityResults(betahat = data$betahat,
                                                 sigma = data$sigma,
                                                 numPrePeriods = numPrePeriods,
                                                 numPostPeriods = numPostPeriods,
                                                 l_vec = l_vec,
                                                 Mvec = seq(from = 0, to = 0.04, by = 0.01))
head(DeltaSD_RobustResults)

# Construct dataframe with OLS confidence interval for theta
OriginalResults = constructOriginalCS(betahat = data$betahat,
                                      sigma = data$sigma,
                                      numPrePeriods = numPrePeriods,
                                      numPostPeriods = numPostPeriods,
                                      l_vec = l_vec)