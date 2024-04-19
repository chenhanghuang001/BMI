#### Preamble ####
# Purpose: Downloads and saves the data
# Author: Chenhang Huang
# Date: 21 Mar 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no
# data source: https://www23.statcan.gc.ca/imdb/p3Instr.pl?Function=getInstrumentList&Item_Id=839130&UL=AV



#### Workspace setup ####
library(tidyverse)

#### Download data ####
cchs = read.csv("data/raw_data/cchs-82M0013-E-2017-2018-Annual.csv",header = TRUE)

set.seed(302)


sampled_data <- cchs[sample(nrow(cchs), 2000), ]

the_raw_data <- sampled_data |>select(GENDVSWL,INCDGHH,DHH_SEX,DHHGMS,DHH_OWN,HWTDGCOR) |> na.omit()

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "data/raw_data/raw_data.csv") 

         
