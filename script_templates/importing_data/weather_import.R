# make sure the `readr` package is installed and loaded before you run the code below
# this code will import the seasonal weather data for the Mill River
# Summer is Apr 15 - Jun 15
# Fall is Aug 15 - Oct 15
# see the file called weather_metadata.txt for details the data

# make sure the readr` package is loaded before importing these files

weather <- read_csv("data/weather.csv",
                   col_types = cols(season = col_factor(levels = c("Summer","Fall")))) %>% 
  
  filter(year >= 2018) %>% 
  mutate(year = as_factor(year))