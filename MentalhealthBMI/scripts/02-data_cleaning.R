#### Preamble ####
# Purpose: Cleans the raw data recorded by CCHS
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data = raw_data %>% mutate(
  lifesatisfication = case_when(
    GENDVSWL == 1 ~ "Satisfied",
    GENDVSWL == 2 ~ "Satisfied",
    GENDVSWL == 3 ~ "Neither satisfied nor dissatisfied",
    GENDVSWL == 4 ~  "Dissatisfied",
    GENDVSWL == 5 ~  "Dissatisfied",
    TRUE ~ "Others"),
  income = case_when(
    INCDGHH == 1 ~ "less than $20000",
    INCDGHH == 2 ~ "$20000~$39999",
    INCDGHH == 3 ~ "$40000~$59999",
    INCDGHH == 4 ~ "$60000~$79999",
    INCDGHH == 5 ~ "$80000 or more",
    TRUE ~ "Others"),
  gender = ifelse(DHH_SEX == 1, "Male","Female"),
  marry = case_when(
    DHHGMS == 1 ~ "Married",
    DHHGMS == 2 ~ "Common-law",
    DHHGMS == 3 ~ "Widowed/Divorced/Separated",
    DHHGMS == 4 ~ "Single",
    TRUE ~ "Others"),
  rent = ifelse(DHH_OWN == 2,"yes","no"),
  BMI = HWTDGCOR) %>% 
  dplyr::select(lifesatisfication,income,gender,marry,rent,BMI)%>%
  filter(lifesatisfication!="Others") %>%
  filter(income !="Others") %>%
  filter(marry !="Others") %>%
  filter(rent !="Others") %>%
  filter(BMI<999) %>% na.omit()

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
