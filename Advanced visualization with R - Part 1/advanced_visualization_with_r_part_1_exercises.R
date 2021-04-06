#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## ADVANCED VISUALIZATION WITH R PART 1 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####

# Read the fast_food_data.csv into a dataset named "fast_food_data". 
# Set both the `header` and `stringsAsFactors` arguments equal to TRUE. 
# Subset the data set to be named "fast_food_subset" and include columns 3, 5, 6, 10, 11. 
# Then rename those columns "type", "calories","totfat","carbs", & "sugars".

# Answer: 



#================================================-
#### Question 2 ####

# Create a dataset `fast_food_num`, which consists of only the numeric variables from fast_food_subset. Hint: Drop the 'type' column.
# Then retrieve the number of columns from `fast_food_num` and store it in the variable `num_col`.
# Sample `num_col` number of colors from `colors` and store it in `color_sam`. 
# Make sure to set the seed to 2 before sampling.
# What four colors did sample choose?

# Answer: May vary. Our answer is "lightgray", "lavenderblush4", "grey12", and "grey88"



#================================================-
#### Question 3 ####

# Make a boxplot of the variables in `fast_food_num` using the colors stored in `color_sam`. 
# Which variable has the widest range?

# Answer: Calories


#================================================-
#### Question 4 ####

# Create a 2x2 grid of histograms of all 4 variables in `fast_food_num`, using colors in  `color_sam`.
# appropriately labeled with xlabel and title for each.

# Answer: 


#================================================-
#### Question 5 ####

# Reset the grid by running par(mfrow = c(1, 1)).
# Begin with plotting total fat against carbohydrate. Have total fat be on the x-axis and carbohydrate on the y-axis.
# Use the column index to specify the variables. Create appropriate labels for x and y axes and title.
# Fill in with triangle symbol(set pch to 17) and color "salmon2".

# Answer:



#================================================-
#### Question 6 ####
# Create a scatterplot matrix of all the variables in fast_food_num.
# Choose a random color from colors() and set the color of the points each time the plot is generated.
# Answer:




#### Exercise 2 ####
# =================================================-

#### Question 1 ####

# Load ggplot2 
# Create a base plot using `ggplot()` on fast_food_subset.
# Set x to equal calories. 
# Assign ggplot's output to the variable `ffplot1`.

# Answer:



#================================================-
#### Question 2 ####

# Add a histogram layer using geom_histogram() to ffplot1 to see the plotted histogram.
# Answer:




#================================================-
#### Question 3 ####
# Modify the histogram to make it a density plot, and set the binwidth to 50.
# Enhance the histogram further by setting the color to "salmon2" and the fill color to "salmon3".
# Save the adjusted ffplot1, by reassigning the output of ffplot + geom_histogram back to ffplot1.
# Make sure to view your plot after you save it.

# Answer:



#================================================-
#### Question 4 ####
# Add a density layer to `ffplot1` with 20% opaque, gray fill, and a steelblue border.
# Save the new plot as `ffplot1`.
# View your final plot.

# Answer:



#================================================-
#### Question 5 ####
# Specify a black-and-white theme, set axis title to size 22 and axis text to size 18.
# Save the above formatting into a variable called `ff_theme`.
# Add the variable `ff_theme` to `ffplot1` and save it as `ffplot1`.

# Answer:




