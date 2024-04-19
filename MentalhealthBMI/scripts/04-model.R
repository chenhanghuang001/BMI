#### Preamble ####
# Purpose: Models build 
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(readr)



#### Read data ####
analysis_data <- read_csv("data/analysis_data.csv")

analysis_data <- analysis_data |> mutate_if(is.character, as.factor)

### Model 1 ####
first_model <-
  stan_glm(
    formula = BMI ~ lifesatisfication,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 10, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 25, autoscale = TRUE),
    seed = 853
  )

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

### Model 2 ####
second_model <-
  stan_glm(
    formula = BMI ~ lifesatisfication + income +gender + marry + rent,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 25, autoscale = TRUE),
    seed = 853
  )

#### Save model ####
saveRDS(
  second_model,
  file = "models/second_model.rds"
)
