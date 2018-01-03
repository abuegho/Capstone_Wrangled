## Clean up your column names to be simple, short and descriptive

Traffic_W = rename(Traffic_Violations, Date = "Date Of Stop",
                   Time = "Time Of Stop")

## Check for missing values and decide what you want to do about them

Traffic_W = Traffic_Violations %>% 
  filter(is.na(Traffic_W$Description) == F) %>% 
  filter(is.na(Traffic_W$Make) == F) %>% 
  filter(is.na(Traffic_W$`DL State`) == F)

# over 79,000 entries have Null Geolocations
# about 10,000 violations involve a "Foot Patrol", which may indicate a non-automobile violation, but that is not the case. Many of those violations do involve vehicles