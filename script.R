library(dplyr)
library(tidyr)

## Clean up your column names to be simple, short and descriptive

Traffic_W = rename(Traffic_Violations, Date = "Date Of Stop",
                   Time = "Time Of Stop")

## Check for missing values and decide what you want to do about them

Traffic_W = filter(Traffic_W, is.na(Traffic_W$Description) == F)
Traffic_W = filter(Traffic_W, is.na(Traffic_W$Make) == F)
Traffic_W = filter(Traffic_W, Traffic_W$Make != "NONE")
Traffic_W = filter(Traffic_W, is.na(Traffic_W$`DL State`) == F)

# over 79,000 entries have Null Geolocations

## Make sure the values in each column make sense. If you find values that don't,
## decide what you want to do about those. Look for outliers. Do they make sense? 
## Do you want to keep them in the data set?

Traffic_W = Traffic_W %>% 
  filter(HAZMAT == "No") %>% 
  select(-c(HAZMAT, Article, Agency))

write.csv(Traffic_W, file = "Traffic_W.csv")