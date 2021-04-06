#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 1 EXERCISE ANSWERS ##

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
setwd(data_dir)
library(tidyverse)
library(highcharter)

fast_food = read.csv("fast_food_data.csv")
fast_food_sub = fast_food %>%
  select(Calories, ends_with("g."), -starts_with("Serving")) #<- select and ends_with

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

FF_subset_long2 = fast_food_sub %>%
  gather(-Calories, #<- gather all variables but `Calories`
         key = "variable",                   #<-   set key to `variable`
         value = "value")%>%
  mutate(variable = tolower(variable)) %>%   #<- lower case of characters
  mutate(variable = substr(variable, 1, nchar(variable)-1)) %>%   #<- removes last . from the string
  mutate(variable = str_replace_all(variable,  "[.]",  "_")) %>%  #<- removes first . in string and replaces it with _
  group_by(variable) %>%
  mutate(norm_value = value/mean(value, na.rm = TRUE))

head(FF_subset_long2)

#================================================-
#### Question 3 ####

# Create a scatterplot named ff_inter_scatter using hchart. 
# Plot the normalized values against `Calories` and set the group = variables.
# View `ff_inter_scatter`.

# Answer:
ff_inter_scatter =                #<- name the plot   
  hchart(FF_subset_long2,         #<- set data
         "scatter",               #<- make type "scatter"
         hcaes(x = norm_value,    #<- map x-axis
               y = Calories,      #<- map y-axis
               group = variable)) #<- group by


ff_inter_scatter

#================================================-
#### Question 4 ####

# Use `hc_chart` to specify "xy" zoom for `ff_inter_scatter`.
# Add the title to the plot "Fast Food Data Scatterplot".
# Do you notice any patterns in `trans_fat__g` values by looking at the scatterplot?
# If so, describe what you see and try to interpret it.

# Answer:
ff_inter_scatter = ff_inter_scatter %>%  
  hc_chart(zoomType = "xy") %>%                #<- use chart options to specify zoom.
  hc_title(text = "Fast Food Data Scatterplot")#<- use `hc_title` to add a title

ff_inter_scatter
# The `trans_fat__g` variable has a very distinct pattern, it seems like there are few 
# unique values present in this variable, which leads us to a conclusion that
# even though the data is encoded as numeric it is actually categorical data.
# Uncovering patterns like this is exactly why we should do EDA and plot our data
# before running any analyses as it may affect the output of our algorithms and models.

#================================================-
#### Question 5 ####

# Create a version of `fast_food_sub`, named `fast_food_sub2`, 
# that has dropped all rows with NA values. 
# Then create a correlation matrix, named cor_matrix2, that includes all columns of `fast_food_sub2` except Calories.
# Plot `cor_matrix2` using hchart and assign it to `correlation_interactive2`.

# Answer:
fast_food_sub2 = drop_na(fast_food_sub)
cor_matrix2 = cor(fast_food_sub2[, 2:8])
correlation_interactive2 = hchart(cor_matrix2) %>%
  hc_title(text = "Fast Food Data Correlation")

correlation_interactive2



#### Exercise 2 ####
# =================================================-


#### Question 1 ####

# Save the output of `summary(fast_food_sub2)` to `ffood_summary` and a data frame object.
# Then inspect `ffood_summary`.
# Remove `Var1` from `ffood_summary` and rename the remaining columns to be "Variable" and "Summary".
# Inspect `ffood_summary` after you make those changes.

# Answer: 

# Create data summary.
ffood_summary = summary(fast_food_sub2)

# Save it as a data frame.
ffood_summary = as.data.frame(ffood_summary)

# Inspect the data.
head(ffood_summary)

# Remove an empty variable.
ffood_summary$Var1 = NULL

# Rename remaining columns.
colnames(ffood_summary) = c("Variable", "Summary")

# Inspect updated data.
head(ffood_summary)

#================================================-
#### Question 2 ####

# Replicate the transformation used in the class slides to separate 
# the `Summary` column into two different columns.
# You want the statistic and the value to be in different columns.
# And convert the applicable data to numeric, rather than character.
# What separator will you use to split the column into two?
# Use `subset` to retain only values that are not NA.

# Answer:
# Separator should be ":" and the number of rows in the `ffood_summary` is 63

# Transformation using tidyr
ffood_summary = ffood_summary %>%          #<- set original data 
  separate(Summary,                        #<- separate `Summary` variable 
           into = c("Statistic", "Value"), #<- into 2 columns: `Statistic`, `Value`
           sep = ":",                      #<- set separating character
           convert = TRUE)                 #<- where applicable convert data (to numeric)

# Subset only rows where `Value` is not NAs.
ffood_summary = subset(ffood_summary, !is.na(Value))

#================================================-
#### Question 3 ####

# Construct the summary chart `ffood_summary_interactive` using `hchart`.
# Add the setting to share tooltip.
# View `ffood_summary_interactive`.
# What's off about this chart? 
# What's wrong with Sodium? 
# What should we have done before summarizing the data?

# Answer: 
# Sodium looks larger than everything else because of the units of measurement. 
# We should have scaled all the data to the same scale, or transformed sodium to grams.
ffood_summary_interactive = 
  hchart(ffood_summary,           #<- set data
         "column",                #<- set type (`column` in highcharts)
         hcaes(x = Statistic,     #<- arrange `Statistics` across x-axis
               y = Value,         #<- map `Value` of each `Statistic` to y-axis
               group = Variable)) #<- group columns by `Variable`

ffood_summary_interactive


ffood_summary_interactive = ffood_summary_interactive %>% 
  hc_tooltip(shared = TRUE) #<- `shared` needs to be set to `TRUE`

ffood_summary_interactive

#================================================-
#### Question 4 ####

# Create boxplot using `FF_subset_long2` from exercise 1, using `hchart()`.
# Save it as `ff_bp_interactive`.

# Answer: 

ff_bp_interactive =  
  hcboxplot(x = FF_subset_long2$norm_value,
            var = FF_subset_long2$variable,
            name = "Normalized value")

ff_bp_interactive

#================================================-
#### Question 5 ####

# Enhance the boxplot options using `hc_plotOptions` to color each box plot.
# Add the title "Fast Food Data Boxplot" to the plot.
# View the plot.

# Answer:

# Enhance original boxplot with some options.
ff_bp_interactive = ff_bp_interactive %>% 
  hc_plotOptions(                #<- plot options
    boxplot = list(              #<- for boxplot 
      colorByPoint = TRUE)) %>%  #<- color each box
  hc_title(text = "Fast Food Data Boxplot")

ff_bp_interactive


#================================================-
#### Question 6 ####

# Load the `htmlwidgets` package.
# Using `saveWidget` command, save the boxplot to `plot_dir`.
# Save the widget with the name "interactive_boxplot.html".

# Answer:
# Set working directory to where you save plots.
setwd(plot_dir)
library(htmlwidgets)


# Save desired interactive plot to an HTML file.
saveWidget(ff_bp_interactive,            #<- plot object to save
           "interactive_boxplot.html",    #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself  
  





