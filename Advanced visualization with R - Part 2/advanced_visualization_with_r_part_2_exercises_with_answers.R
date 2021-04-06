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
setwd(data_dir)
fast_food = read.csv("fast_food_data.csv", header = TRUE, stringsAsFactors = TRUE)
head(fast_food)

column_ids = c(3, 5, 6, 10, 11) #<- creates a list of column ids and assigns that list to a variable

fast_food_subset = fast_food[ , column_ids] #<- uses that variable to subset the dataset

colnames(fast_food_subset) = c("type", "calories", "totfat", "carbs", "sugars") #<- renames the columns for east of use
head(fast_food_subset)


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
ffplot1 = ggplot(fast_food_subset,                   
                 aes(x = totfat,
                     y = calories)) + 
          geom_point(color = "tomato2") + #<- sets color of points
          my_ggtheme +
          geom_smooth(method = lm)        #<- add linear regression line (`lm`)

ffplot1

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
library(tidyverse)

fast_food_sub = fast_food %>%
  select(Calories, ends_with("g."), -starts_with("Serving")) %>% #<- select and ends_with
  drop_na()


fast_food_long =  fast_food_sub%>%  
    gather(key = "variable", value = "value")    #<- set key and value with gather

head(fast_food_long) #<- check results

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
fast_food_long = fast_food_long %>%
                 mutate(variable = tolower(variable)) %>%                        #<- lower case of characters
                 mutate(variable = substr(variable, 1, nchar(variable)-1)) %>%   #<- removes last . from the string
                 mutate(variable = str_replace_all(variable,  "[.]",  "_"))      # <- removes .

head(fast_food_long)

#================================================-
#### Question 5 ####

# Create a base box plot of `fast_food_long` and save it as `ffboxplot`.
# Update the aesthetics of the box plot by filling the boxplot with color, 
# but make sure a legend for color is not included in the plot.

# Answer:
ffboxplot = ggplot(fast_food_long, 
                   aes(x = variable, 
                       y = value,
                       fill = variable)) + 
            geom_boxplot() + 
            guides(fill = FALSE) 
 
ffboxplot

#================================================-
#### Question 6 ####

# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.
# Add a title "Fast Food Data" and subtitle "Boxplot" to the plot.

# Answer:
ffboxplot = ffboxplot +                 #<- previously saved plot
  geom_boxplot(outlier.color = "red",   #<- adjust outlier color
               outlier.size = 3) +      #<- adjust outlier size
  labs(title = "Fast Food Data",
       subtitle = "Boxplot")
ffboxplot


#================================================-
#### BONUS ####

#### Question 7 ####

# Normalize the values for all variables in `fast_food_long`.
# Remove NA's while normalizing with the maximum value.
# Create a boxplot with normalized data.
# Highlight outliers and add title and subtitle as in Question 6.

# Answer:

fast_food_long = fast_food_long %>%
  group_by(variable) %>%              #<- group values by variable
  mutate(norm_value =                 #<- make `norm_value` column
           value/max(value,           #<- divide value by group max
                     na.rm = TRUE))   #<- don't forget the NAs!

fast_food_long

ffboxplot = ggplot(fast_food_long, 
                   aes(x = variable, 
                       y = norm_value,
                       fill = variable)) + 
            geom_boxplot(outlier.color = "red",   #<- adjust outlier color
               outlier.size = 3) + 
            guides(fill = FALSE) +
            labs(title = "Fast Food Data",
                  subtitle = "Boxplot")
 
ffboxplot




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

# Answer: Calories, variable, value, norm_value

FF_subset_long2 = fast_food_sub %>%
  gather(-Calories, #<- gather all variables but `Calories`
         key = "variable",                   #<-   set key to `variable`
         value = "value")%>%
  mutate(variable = tolower(variable)) %>%   #<- lower case of characters
  mutate(variable = substr(variable, 1, nchar(variable)-1)) %>%   #<- removes last . from the string
  mutate(variable = str_replace_all(variable,  "[.]",  "_")) %>%  #<- removes . in string and replaces it with _
  group_by(variable) %>%
  mutate(norm_value = value/mean(value, na.rm = TRUE))

head(FF_subset_long2)

#================================================-
#### Question 2 ####

# Create a base plot with `FF_subset_long2` and call it `base_norm_plot`.
# Make sure to use the normalized values on the x-axis and calories on the y-axis.
# Add a scatterplot layer to `base_norm_plot` with point size = 1.5 and 50% opacity. Save it as `scatter_norm`.
# Answer:
base_norm_plot = ggplot(data = FF_subset_long2,  
                         aes(x = norm_value,
                             y = Calories,     
                             color = variable))

scatter_norm = base_norm_plot + 
                geom_point(size=1.5, 
                           alpha=0.5)
scatter_norm

#================================================-
#### Question 3 ####

# Add a 2d geom_density layer to `scatter_norm` and save it as `scatter_norm`.
# Split the scatterplots into different facets for each variable using `facet_wrap`, displayed in 2 rows.
# Answer:
scatter_norm = scatter_norm + 
              geom_density2d()  + 
              facet_wrap(~variable, nrow = 2)

scatter_norm

#================================================-
#### Question 4 ####

# Add a built-in theme `theme_light()` to the scatterplots.
# Remove the redundant legend.
# Finally, add title "Fast Food: Calories vs. Other variables" and, 
# subtitle "2D distribution of scaled data" to the plots.
# View the updated plot.
# Answer:

scatter_norm = scatter_norm + 
              theme_light() + 
              guides(color = FALSE) +
              labs(title = "Fast Food: Calories vs. Other variables",
                    subtitle = "2D distribution of scaled data")
              

scatter_norm

#================================================-
#### Question 5 ####

# Set working directory to where you want to save plots.
# Use `pdf()` function to save `ffboxplot` from Exercise 1 and `scatter_norm` from Exercise 2.
# Save the plots as "ggplot_visualizations.pdf".
# Set `width = 12` and `height = 7`.
# Clear graphics device after saving your plots.
# Open your plots directory and check the saved plots.
# Answer:

setwd(plot_dir)

pdf("ggplot_visualizations.pdf",
    width = 12,
    height = 7)
ffboxplot
scatter_norm

dev.off()


