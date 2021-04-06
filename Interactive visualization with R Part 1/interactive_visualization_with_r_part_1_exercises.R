#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 1 EXERCISE ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-


#### Question 1 ####

# Set up data:
# Confirm your working directory. Make sure it is set to `data_dir`.
# Load `tidyverse` and `highcharter` packages. 
# Read in "fast_food_data.csv" to a data frame `fast_food`.
# Create a new subset from `fast_food`, named `fast_food_sub`, 
# Select only `Calories` and variables that end in "g.", 
# EXCLUDE variables that start with "Serving" from `fast_food`.

# Answer:


#================================================-
#### Question 2 ####

# Set up & specify:
# To make a scatterplot of normalized nutritional components compared to calories,
# we need to convert `fast_food_sub` into a long dataset `FF_subset_long2`
# and normalize the nutrition components.
# Explicitly exclude `Calories` from the gather.
# Use the same code used previously to:
# - change the case of all letters to lower case
# - remove the last character from the end of the nutrition variables
# - replace all remaining . with _ in the variable names
# Then use the group_by & mutate statements to normalize the nutritional values, using the MEAN to normalize.
# Check the top of FF_subset_long2 to confirm you have four columns. What are those column names?
# Answer: Calories, variable, value, norm_value



#================================================-
#### Question 3 ####

# Create a scatterplot named ff_inter_scatter using hchart. 
# Plot the normalized values against `Calories` and set the group = variables.
# View `ff_inter_scatter`.

# Answer:


#================================================-
#### Question 4 ####

# Use `hc_chart` to specify "xy" zoom for `ff_inter_scatter`.
# Add the title to the plot "Fast Food Data Scatterplot".
# Do you notice any patterns in `trans_fat__g` values by looking at the scatterplot?
# If so, describe what you see and try to interpret it.

# Answer:


#================================================-
#### Question 5 ####

# Create a version of `fast_food_sub`, named `fast_food_sub2`, 
# that has dropped all rows with NA values. 
# Then create a correlation matrix, named cor_matrix2, that includes all columns of `fast_food_sub2` except Calories.
# Plot `cor_matrix2` using hchart and assign it to `correlation_interactive2`.

# Answer:




#### Exercise 2 ####
# =================================================-


#### Question 1 ####

# Save the output of `summary(fast_food_sub2)` to `ffood_summary` and a data frame object.
# Then inspect `ffood_summary`.
# Remove `Var1` from `ffood_summary` and rename the remaining columns to be "Variable" and "Summary".
# Inspect `ffood_summary` after you make those changes.

# Answer: 




#================================================-
#### Question 2 ####

# Replicate the transformation used in the class slides to separate 
# the `Summary` column into two different columns.
# You want the statistic and the value to be in different columns.
# And convert the applicable data to numeric, rather than character.
# What separator will you use to split the column into two?
# Use `subset` to retain only values that are not NA.

# Answer:


#================================================-
#### Question 3 ####

# Construct the summary chart `ffood_summary_interactive` using `hchart`.
# Add the setting to share tooltip.
# View `ffood_summary_interactive`.
# What's off about this chart? 
# What's wrong with Sodium? 
# What should we have done before summarizing the data?

# Answer: 


#================================================-
#### Question 4 ####

# Create boxplot using `FF_subset_long2` from exercise 1, using `hchart()`.
# Save it as `ff_bp_interactive`.

# Answer: 



#================================================-
#### Question 5 ####

# Enhance the boxplot options using `hc_plotOptions` to color each box plot.
# Add the title "Fast Food Data Boxplot" to the plot.
# View the plot.

# Answer:




#================================================-
#### Question 6 ####

# Load the `htmlwidgets` package.
# Using `saveWidget` command, save the boxplot to `plot_dir`.
# Save the widget with the name "interactive_boxplot.html".

# Answer:





