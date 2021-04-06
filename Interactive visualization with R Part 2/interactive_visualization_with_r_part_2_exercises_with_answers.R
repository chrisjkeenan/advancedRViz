#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 2 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-


#### Question 1 ####

# Set up data:
# Confirm your working directory. Make sure it is set to `data_dir`.
# Load `tidyverse` and `highcharter` package. 
# Read in "fast_food_data.csv" to a data frame `fast_food`.
# Select only the variables 'Calories', `Total.Fat..g.` and, 'Sodium..mg.'  from 'fast_food', and name it `fast_food_sub`.
# Normalize the data with the function given in class slides.
normalize <- function(x) 
             {return ((x - min(x, na.rm = TRUE))/
                      (max(x, na.rm = TRUE) -
                       min(x, na.rm = TRUE)))}

# Answer:

setwd(data_dir)
library(tidyverse)
library(highcharter)

fast_food = read.csv("fast_food_data.csv")
fast_food_sub = fast_food %>%
  select(Calories, Total.Fat..g.,Sodium..mg.)

fast_food_sub$Calories <- normalize(fast_food_sub$Calories)
fast_food_sub$Total.Fat..g. <- normalize(fast_food_sub$Total.Fat..g.)
fast_food_sub$Sodium..mg. <- normalize(fast_food_sub$Sodium..mg.)


#================================================-
#### Question 2 ####

# Create a layered density plot 'ff_layered_density_interactive' of `Calories', `Total.Fat..g.`, and, 'Sodium..mg.' 
# using the hc_add_series() function.
# Add a vertical line for the mean of each of the three variables and set its colour to "red".
# Label the vertical lines as 'Calories avg.' and `Total.Fat..g. avg.` and 'Sodium..mg. avg.' respectively.
# Add the setting that the tooltip is shared to 'ff_layered_density_interactive'.
# Add the title "Fast food data: density and average of select variables"

# Answer:

ff_layered_density_interactive = highchart() %>%
  hc_chart(type = "area") %>%
  hc_add_series(data = density(fast_food_sub$Calories),
                name = "Calories") %>%
  hc_add_series(data = density(fast_food_sub$Total.Fat..g.),
                name = "Total.Fat..g.") %>%
  hc_add_series(data = density(fast_food_sub$Sodium..mg.),
                name = "Sodium..mg.") %>%
  hc_xAxis(plotLines = list(
    list(label = list(text = "Calories avg."),
         width = 2,
         color = "red",
         value = mean(fast_food_sub$Calories)),
    list(label = list(text = "Total.Fat..g. avg."),
         width = 2,
         color = "red",
         value = mean(fast_food_sub$Total.Fat..g.)),
    list(label = list(text = "Sodium..mg. avg."),
         width = 2,
         color = "red",
         value = mean(fast_food_sub$Sodium..mg.)))) %>%
  hc_tooltip(crosshairs = TRUE) %>%
  hc_title(text = "Fast food data: density and average of select variables")

ff_layered_density_interactive


#### Exercise 2 ####
# =================================================-

#### Question 1 ####

# Confirm your working directory. Make sure it is set to `data_dir`.
# Read in "state_data.csv" to a data frame `state_df`.
# Set `header` = TRUE and `stringsAsFactors` = FALSE.
# Select the `Murder` rate and `state` from the `state_df` to create `data_for_map2`.
# And rename the columns to `value` and `State`.

# Answer: 

setwd(data_dir)
state_df = read.csv("state_data.csv", 
                     header = TRUE,               
                     stringsAsFactors = FALSE) 
data_for_map2 = select(state_df, 
                       Murder, #<- select `Murder` to display as value on shape
                       State)  

colnames(data_for_map2) = c("value", "State") 

#================================================-
#### Question 2 ####

# Create an interactive map of murder rate by state in 1975 named `interactive_murder_map`.
# Use the `US_map` data as the map information and the `data_for_map_2` information for the data. 
# Add area name to the map.
# Use color codes "#ba3030" for `max` and "#f9f2f2" for `min`.
# Add a tooltip with a "%" as the valueSuffix.
# Set the title for the plot as "US States Murder Rate (1975)". 

# Answer:

interactive_murder_map = 
  highchart(type = "map") %>% 
  hc_add_series(mapData = US_map,
                data = data_for_map2,               
                name = "Murder Rate in 1975",      
                joinBy = c("name",                 
                           "State"),
                dataLabels = list(enabled = TRUE,                  
                                  format =                          
                                  '{point.properties.postal-code}')) %>%           
  hc_colorAxis(min = min(data_for_map2$value), 
               max = max(data_for_map2$value),
               minColor = "#f9f2f2",               
               maxColor = "#ba3030") %>% 
  hc_tooltip(valueSuffix = "%") %>%         
  hc_title(text = "US States Murder Rate (1975)")   

interactive_murder_map

#================================================-
#### Question 3 ####

# Using `saveWidget` command, save the plot to `plot_dir`,

# Answer:

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(interactive_murder_map,            #<- plot object to save
           "interactive_murder_map.html",     #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself 


#================================================-
#### Question 4 ####

# Set working directory to data_dir
# Read `unemployment.json` as un_emp, and use it to create a list for motion map.
# Follow these steps:
#   1. group data by state (FIPS code)
#   2. go through each state
#   3. select the FIPS for that state and create a list of values for that state
#   4. select the first value to initialize the map
#   5. Put everything together into `un_emp_rate`
# Name the variable en_emp_list

# Answer:
setwd(data_dir)

un_emp = fromJSON("unemployment.json")
head(un_emp)

en_emp_list <- un_emp %>% 
      group_by(fips) %>%                         #<- group by state
      do(un_emp_rate = list(                    #<- go through each state 
         fips = first(.$fips),                   #<- select the FIPS for that state
         sequence = .$value,                     #<- create a list of values for that state
         value = first(.$value))) %>%            #<- select the first value to initialize the map
      .$un_emp_rate                             #<- put the three together in a list `un_emp_rate`

#================================================-
#### Question 5 ####

# Create a motion map `unemp_map_motion`
# Name the series `Unemployment rate`
# Use `uscountygeojson` as mapData
# Set borderWidth to 0.01
# Set plot title to "Unemployment rate between 2000 and 2019"

# Answer:
unemp_map_motion <- highchart(type = "map") %>% 
  hc_add_series(data = en_emp_list,                          #<- data to plot on shapes
                name = "Unemployment rate",   #<- series name
                mapData = uscountygeojson,          #<- map data from `highcharter`       
                joinBy = "fips",                    #<- join by `fips` field in `data` and `mapData`
                borderWidth = 0.01) %>%             #<- adjust border line for each shape
  hc_colorAxis(stops = color_stops()) %>%           #<- create a color legend 
  hc_title(text = "Unemployment rate between 2000 and 2019") %>% 
  hc_motion(                                        #<- add motion
    enabled = TRUE,
    axisLabel = "year",                             #<- name of motion slider
    labels = sort(unique(un_emp$year)),       #<- label the animation by year
  )

unemp_map_motion

#================================================-
#### Question 6 ####

# Using `saveWidget` command, save the plot to `plot_dir`,

# Answer:

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(unemp_map_motion,          
           "unemployment_map_motion.html",     
           selfcontained = TRUE)             
                                          


