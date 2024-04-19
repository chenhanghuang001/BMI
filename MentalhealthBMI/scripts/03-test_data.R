#### Preamble ####
# Purpose: Tests the data 
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no

#### Workspace setup ####
library(tidyverse)
library(readr)

## load the 
cchs = read_csv("data/analysis_data.csv")



## test if Lifesatisfication has three levels :"Satisfied" , "Neither satisfied nor dissatisfied", "Dissatisfied"
cchs$lifesatisfication |>
  unique() == c("Satisfied" , "Neither satisfied nor dissatisfied" , "Dissatisfied")

## test if gender has two levels :"Male" , "Female"
cchs$gender |>
  unique() == c("Male" , "Female")

## test if the marry is string variable 
cchs$marry  |> class() == "character"

## test if the rent has two levels 
cchs$rent |>
  unique() == c("no" , "yes")


## test if the marry is string variable 
cchs$marry |> class() == "character"


## test if the BMI is numeric
cchs$BMI |> class() == "numeric"


