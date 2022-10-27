
#To get a formatted table, make sure that the {flextable} package is loaded
#Use additional code to create the summary table called "table.sum"
#If you want to format the table yourself, then don't use this code


#create the formatted table
ft <- flextable(table.sum)

#create header labels
ft <- set_header_labels(ft,
                        season = "Season",
                        year = "Year",
                        location = "Location",
                        dates = "Dates",
                        samples = "# of Samples",
                        area = "Total Area Sampled (m^2)"
                        )


#bold the headings
ft <- bold(ft, part="header")

ft <- merge_v(ft, j = ~ season + year)

#set table properties
ft <- set_table_properties(ft, layout = "autofit", width = 1)

#center columns
ft <- align(ft, align = "center", part = "all" )


#add lines between year x season
ft <- theme_vanilla(ft) %>% 
  fontsize(size = 10)

ft <- fix_border_issues(ft)

#print the table
#comment out or delete the line below before you render a quarto document
ft

#send to MS Word if desired
#comment out or delete the line below before you render a quarto document
print(ft, preview = "docx") # can change this to "html" or "pptx"

#see https://davidgohel.github.io/flextable/ for more information and formatting options