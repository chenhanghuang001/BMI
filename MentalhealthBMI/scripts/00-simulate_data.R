#### Preamble ####
# Purpose: Simulates 
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no


#### Workspace setup ####
library(tidyverse)

num_obs <- 2000

cchs <- tibble(
  lifesatification = sample(1:3, size = num_obs, replace = TRUE),
  income = sample(1:5, size = num_obs, replace = TRUE),
  gender = sample(1:2,size = num_obs, replace = TRUE),
  marry = sample(1:4, size = num_obs, replace = TRUE),
  rent = sample(1:2, size = num_obs, replace = TRUE),
  BMI = ((lifesatification + income + gender + marry + 3*rent) * 5),
  
) |>
  mutate(
    lifesatification = case_when(
      lifesatification == 1 ~ "Satisfied",
      lifesatification == 2 ~ "Neither satisfied nor dissatisfied",
      lifesatification == 3 ~ "Dissatisfied"
    ),
    income = case_when(
      income == 1 ~ "less than $20000",
      income == 2 ~ "$20000~$39999",
      income == 3 ~ "$40000~$59999",
      income == 4 ~ "$60000~$79999",
      income == 5 ~ "$80000 or more"     
    ),
    gender = if_else(gender == 1, "Male", "Female"),
    marry = case_when(
      marry == 1 ~ "Married",
      marry == 2 ~ "Common-law",
      marry == 3 ~ "Widowed/Divorced/Separated",
      marry == 4 ~ "Single"
    ),
    rent = if_else(rent == 1, "no", "yes"),
  ) 

head(cchs)
