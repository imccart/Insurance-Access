
# Meta --------------------------------------------------------------------

## Title:  Combine ACS and Medicaid Expansion Data
## Author: Ian McCarthy
## Date Created: 12/6/2019
## Date Edited:  12/9/2019


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate, readr, readxl,
               scales, gganimate, cobalt, ivpack, stargazer, haven, ggthemes,
               acs, tidyr)


# Tidy --------------------------------------------------------------------
exp.data <- read_csv("data/Atlas_Reimbursements_2003-2015.csv")

exp.data <- pivot_longer(exp.data, cols=starts_with("Y"),
                         names_to="Year", names_prefix="Y",
                         names_ptypes = list(Year = integer()),
                         values_to="Expenditures")
exp.data <- exp.data %>%
  rename(HRR=HRR_ID) %>%
  select(HRR, Year, Expenditures)

dartmouth.data <- exp.data %>%
  left_join(mort.data, by=c("HRR","Year")) %>%
  filter(complete.cases(.))
