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



#================================================-
#### Question 2 ####

# Create a layered density plot 'ff_layered_density_interactive' of `Calories', `Total.Fat..g.`, and, 'Sodium..mg.' 
# using the hc_add_series() function.
# Add a vertical line for the mean of each of the three variables and set its colour to "red".
# Label the vertical lines as 'Calories avg.' and `Total.Fat..g. avg.` and 'Sodium..mg. avg.' respectively.
# Add the setting that the tooltip is shared to 'ff_layered_density_interactive'.
# Add the title "Fast food data: density and average of select variables"

# Answer:



#### Exercise 2 ####
# =================================================-

#### Question 1 ####

# Confirm your working directory. Make sure it is set to `data_dir`.
# Read in "state_data.csv" to a data frame `state_df`.
# Set `header` = TRUE and `stringsAsFactors` = FALSE.
# Select the `Murder` rate and `state` from the `state_df` to create `data_for_map2`.
# And rename the columns to `value` and `State`.

# Answer: 



#================================================-
#### Question 2 ####

# Create an interactive map of murder rate by state in 1975 named `interactive_murder_map`.
# Use the `US_map` data as the map information and the `data_for_map_2` information for the data. 
# Add area name to the map.
# Use color codes "#ba3030" for `max` and "#f9f2f2" for `min`.
# Add a tooltip with a "%" as the valueSuffix.
# Set the title for the plot as "US States Murder Rate (1975)". 

# Answer: 



#================================================-
#### Question 3 ####

# Using `saveWidget` command, save the plot to `plot_dir`,

# Answer:




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



#================================================-
#### Question 5 ####

# Create a motion map `unemp_map_motion`
# Name the series `Unemployment rate`
# Use `uscountygeojson` as mapData
# Set borderWidth to 0.01
# Set plot title to "Unemployment rate between 2000 and 2019"

# Answer:




#================================================-
#### Question 6 ####

# Using `saveWidget` command, save the plot to `plot_dir`,

# Answer:

   


