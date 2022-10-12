
#before you run the code below...

#make sure the 'flextable' and `tidyverse` packages are installed and loaded
#make sure your data are imported

library(flextable)

#set the variable you want to summarize
x.var <- "___" #put the name of the column you want to summarize in the blank here

#calculate descriptive stats
df.sum <- ___ %>% #put the name of the data frame here
  group_by(___) %>% #put the grouping variable(s) here
  summarise(mean = round(mean(.data[[x.var]]), digits=2), #change the digits as needed
            SD = signif(sd(.data[[x.var]]), digits=2),
            median = round(median(.data[[x.var]]), digits=2),
            IQR = round(IQR(.data[[x.var]]), digits=2),
            min = round(min(.data[[x.var]]), digits=2),
            max = round(max(.data[[x.var]]), digits=2),
            N = n())

#create the table
ft <- flextable(df.sum,
                cwidth=0.75) #can vary cell width as needed

#bold the headings
ft <- bold(ft, part="header")

#center columns
ft <- align(ft, align = "center", part = "all" )
ft

#send to MS Word if desired
#comment out or delete the line below before you knit an R Markdown document
print(ft, preview = "docx") # can change this to "html" or "pptx"

#see https://davidgohel.github.io/flextable/ for more information and formatting options
