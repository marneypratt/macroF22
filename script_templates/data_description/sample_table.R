
#To get a formatted table, make sure that the {flextable} package is loaded
#If you want to format the table yourself, then erase the code from 
#where it says "#create the formatted table" on

table.sum <- ___ %>%  #put the name of your wrangled data here
  
  #summarize by date, year, season, location (to get number of microhabs sampled per date)
  group_by(date, year, season, location) %>% 
  summarize(
    area = sum(benthicArea),
    mon.ADD = mean(mon.ADD, na.rm=TRUE),
    mon.precip = mean(mon.precip, na.rm=TRUE),
    samples = n()
  ) %>% 
  
  #change date to month/day
  mutate(date = format(as.Date(date), '%m/%d')) %>% 
  
  
  #summarize by year, season, location 
  group_by(year, season, location) %>% 
  summarize(
    dates = str_c(date, collapse = ", "),
    samples = sum(samples),
    area = sum(area),
    mon.ADD = round(mean(mon.ADD, na.rm=TRUE), digits=0),
    mon.precip = round(mean(mon.precip, na.rm=TRUE), digits=0)
  )  


#create the formatted table
ft <- flextable(table.sum)

#create header labels
ft <- set_header_labels(ft,
                        year = "Year",
                        season = "Season",
                        location = "Location",
                        dates = "Dates",
                        samples = "# of Samples",
                        area = "Total Area Sampled (m^2)",
                        mon.ADD = "Monthly ADD",
                        mon.precip = "Monthly Precipitation (mm)"
)


#bold the headings
ft <- bold(ft, part="header")

ft <- merge_v(ft, j = ~ year + season)

#set table properties
ft <- set_table_properties(ft, layout = "autofit", width = 1)

#center columns
ft <- align(ft, align = "center", part = "all" )


#add lines between year x season
ft <- theme_vanilla(ft) %>% 
  fontsize(size = 10)

ft <- fix_border_issues(ft)

#print table
ft

#send to MS Word if desired
#comment out or delete the line below before you render a quarto document
#print(ft, preview = "docx") # can change this to "html" or "pptx"

#see https://davidgohel.github.io/flextable/ for more information and formatting options