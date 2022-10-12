
# make sure the 'tidyverse' package is installed and loaded to run the code below

# macro data must be imported before you can run the code below

macro.density <- macro %>% 
  
  #calculate density for each row
  mutate(invDens = number/benthicArea) %>% 
  
  
  # Sum for each sampleID and the different taxa 
  # density of ALL macroinvertebrates
  # change group_by function to remove or add grouping variables as needed 
  # if you want a specific group of organisms, add that column name into 
  # the list of grouping variables (family, organism_aggr, FFG, etc)
  # then filter for the organism or group you want
  group_by(sampleID, season, location, year) %>% 
  dplyr::summarise (density = sum(invDens, na.rm = TRUE)) 


