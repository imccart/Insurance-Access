
# Meta --------------------------------------------------------------------

## Title:  Combine ACS and Medicaid Expansion Data
## Author: Ian McCarthy
## Date Created: 12/6/2019
## Date Edited:  4/2/2020


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, readr, readxl, scales, acs, tidyr)

source('data-code/Medicaid.R')
source('data-code/ACS.R')


# Tidy --------------------------------------------------------------------
final.data <- final.insurance %>%
  left_join(kff.final, by="State") %>%
  mutate(expand_year = year(date_adopted),
       expand = (year>=expand_year & !is.na(expand_year))) %>%
  rename(expand_ever=expanded)


write_tsv(final.data,'data/output/acs_medicaid.txt')
