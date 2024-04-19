#### Preamble ####
# Purpose: Replicated graphs 
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no


#### Workspace setup ####
library(tidyverse)
library(readr)

#### Load data ####

cchs <- read_csv("data/analysis_data.csv")

cchs = cchs |> mutate_if(is.character, as.factor)


cchs |> ggplot(aes(x = BMI, fill = rent)) +
  geom_histogram(alpha=0.5, position="identity") + 
  theme_minimal() +
  labs(
    x = "BMI",
    y = "Number of observations",
    fill = "rent a house"
  ) 




