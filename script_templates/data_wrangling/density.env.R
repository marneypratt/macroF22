
# make sure the 'tidyverse' package is installed and loaded to run the code below

# macro.env and master.taxa must both be imported before you can run the code below

macro.density <- macro %>% 
  
  #calculate density for each row
  mutate(invDens = number/benthicArea) %>% 
  
  
  #join the env data
  left_join(., env) %>% 
  
  # Sum for each sampleID and the different taxa 
  # density of ALL macroinvertebrates
  # change group_by function to remove or add grouping variables as needed 
  # if you want a specific group of organisms, add that column name into 
  # the list of grouping variables (family, organism_aggr, FFG, etc)
  # then filter for the organism or group you want
  group_by(sampleID, season, year, location) %>% 
  dplyr::summarise (density = sum(invDens, na.rm = TRUE),
                    
                    # replace the blanks below with your water quality variable of intertest
                    ___ = mean(__, na.rm = TRUE)) 


