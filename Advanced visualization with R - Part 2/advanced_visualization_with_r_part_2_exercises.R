#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## ADVANCED VISUALIZATION WITH R PART 2 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-


#### Question 1 ####

# Read the fast_food_data.csv into a dataset named "fast_food". 
# Set both the `header` and `stringsAsFactors` arguments equal to TRUE. 
# Subset the data set to be named "fast_food_subset" and include columns 3, 5, 6, 10, 11. 
# Then rename those columns "type", "calories","totfat","carbs", & "sugars".

# Answer: 



#================================================-
#### Question 2 ####

# Create a base plot for a scatterplot of totfat on the x axis and calories on the y axis, and save it to `ffplot1`.
# Add a scatterplot layer with color as `tomato2`.
# Enhance the scatterplot `ffplot1` with `my_ggtheme`.
# Add a regression line to the scatterplot, and save the final figure as `ffplot1`.
my_ggtheme = theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))

# Answer:



#================================================-
#### Question 3 ####

# Load the `tidyverse` package
# Create a new subset from `fast_food`, named `fast_food_sub`, 
# Select only `Calories` and variables that end in "g.", 
# EXCLUDE variables that start with "Serving" from `fast_food`.
# Drop the rows with missing values.

# Transform `fast_food` to a long dataset `fast_food_long`.
# Gather them using `key` and `value`.
# Make sure to check the data afterwards.

# Answer:



#================================================-
#### Question 4 ####

# Set up data:
# Use separate `mutate` statements to achieve the following goals:
# - Convert all strings in variable to lower case
# - Use `substr` and `nchar` to remove the last "." from `variable`
# - Remove remaining "."" from variable names. The ideal variable reads "trans_fat__g" 

# Hint: use `str_replace_all`.
# Confirm the changes in `fast_food_long`.

# Answer: 



#================================================-
#### Question 5 ####

# Create a base box plot of `fast_food_long` and save it as `ffboxplot`.
# Update the aesthetics of the box plot by filling the boxplot with color, 
# but make sure a legend for color is not included in the plot.

# Answer:




#================================================-
#### Question 6 ####

# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.
# Add a title "Fast Food Data" and subtitle "Boxplot" to the plot.

# Answer:




#================================================-
#### BONUS ####

#### Question 7 ####

# Normalize the values for all variables in `fast_food_long`.
# Remove NA's while normalizing with the maximum value.
# Create a boxplot with normalized data.
# Highlight outliers and add title and subtitle as in Question 6.

# Answer:





#### Exercise 2 ####
# =================================================-

#### Question 1 ####

# Convert `fast_food_sub` into a long dataset `FF_subset_long2`
# Normalize the nutrition components.
# Explicitly exclude `Calories` from the `gather` statement.
# Use the same code used previously to:
# - Change the case of all letters to lower case
# - Remove the last character from the end of the nutrition variables
# - Replace all remaining . with _ in the variable names
# Then use the group_by & mutate statements to normalize the nutritional values, using the MEAN to normalize.
# Check the head of FF_subset_long2 to confirm you have four columns. What are those column names?

# Answer: 



#================================================-
#### Question 2 ####

# Create a base plot with `FF_subset_long2` and call it `base_norm_plot`.
# Make sure to use the normalized values on the x-axis and calories on the y-axis.
# Add a scatterplot layer to `base_norm_plot` with point size = 1.5 and 50% opacity. Save it as `scatter_norm`.
# Answer:




#================================================-
#### Question 3 ####

# Add a 2d geom_density layer to `scatter_norm` and save it as `scatter_norm`.
# Split the scatterplots into different facets for each variable using `facet_wrap`, displayed in 2 rows.
# Answer:




#================================================-
#### Question 4 ####

# Add a built-in theme `theme_light()` to the scatterplots.
# Remove the redundant legend.
# Finally, add title "Fast Food: Calories vs. Other variables" and, 
# subtitle "2D distribution of scaled data" to the plots.
# View the updated plot.
# Answer:





#================================================-
#### Question 5 ####

# Set working directory to where you want to save plots.
# Use `pdf()` function to save `ffboxplot` from Exercise 1 and `scatter_norm` from Exercise 2.
# Save the plots as "ggplot_visualizations.pdf".
# Set `width = 12` and `height = 7`.
# Clear graphics device after saving your plots.
# Open your plots directory and check the saved plots.
# Answer:



