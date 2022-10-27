
#before you run this code, make sure your dataframe has all the necessary columns
#you need season, year, location, mon.ADD, mon.precip

weather.sum <- limpet.df %>%  #put the name of your wrangled data here
  
  #summarize by date, season, year, & location (to get number of microhabs and area sampled per date)
  group_by(season, year) %>% 
  summarize(
    mon.ADD = round(mean(mon.ADD, na.rm=TRUE), digits=0),
    mon.precip = round(mean(mon.precip, na.rm=TRUE), digits=0)
  )  


weather.sum

