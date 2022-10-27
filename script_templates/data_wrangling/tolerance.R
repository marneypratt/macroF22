
# make sure the 'tidyverse' package is installed and loaded to run the code below

# macros and master.taxa data must both be imported before you can run the code below

macro.tol <- macros %>% 
  
  #join taxonomic information 
  left_join(., master.taxa) %>%

  # remove missing values
  dplyr::filter(!is.na(number), !is.na(tolerance)) %>% 
  
  # multiply the tolerance value times the number present for each kind of organism in each sampleID
  # change group_by function to remove or add grouping variables as needed 
  # but you MUST keep organism_aggr and sampleID in the group_by statement
  group_by(sampleID, organism_aggr, year, season, location, benthicArea) %>% 
  dplyr::summarise(num = sum(number), 
                   tol = mean(tolerance)) %>% 
  mutate(x.t = num*tol)


