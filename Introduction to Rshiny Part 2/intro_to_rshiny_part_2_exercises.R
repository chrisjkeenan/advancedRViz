#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTRO TO RSHINY PART 2 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-


#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 
# Set the title as 'Chicago Census Data'.
# Create an action button with the input and label as 'ex_action_button'.
# Add a slider between the range of 0-100 to the same UI.
# Set the initial value to 1, step size as 5 and add an animate option to it.
# Name the slider as 'ex_slider'.
# Run the app with the basic server script as shown below.

# Hint:

server <- function(input, output) {
}

# Answer:



#================================================-



#### Exercise 2 ####
# =================================================-


#### Question 1 ####
# Using the given code, create a density plot for the various variables and add to the server script. 

# ggplot(chicago_long,               #<- take the dataset
#        aes(x = norm_value,         #<- set x value
#        fill = variable)) +     #<- fill with variable
#        geom_density(alpha = 0.3) + #<- adjust fill transparency
#        facet_wrap (~ variable,     #<- make facets by 'variable'
#                    ncol = 3)       #<- set a 3-column grid

# Add this plot to your server script within the `renderPlot` function and name this plot object `output$densityplot`. 
# Make sure to load the `ggplot2` library along with the `shiny` library. 

# Answer:




#================================================-
#### Question 2 ####
# Add the title "Chicago Census Data" to the UI.
# Add the `densityplot` that we created in the previous question to your UI using the `plotOutput` function. 
# Run the App, making sure that the chicago_long.Rdata is in the same folder as your UI and server files. 
# Try re-sizing the window and see how the app changes!

# Answer:




#================================================-
#### Question 3 ####

# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 
# To the same UI script that we created in Question-2, add a Checkbox group widget to accept user input for `variable` with options ("percent_house_crowded", "percent_house_below_poverty","percent_16_unemployed", "percent_25_without_diploma", "percent_dependent", "per_capita_income","hardship_index").
# Name the Checkbox group widget value `selected_variable`.
# Set the default selected variable to "percent_house_crowded".

# Answer:




#================================================-
#### Question 4 ####
# Using the same server script as before, run the App. 
# Try selecting the variable input. What do you notice?

# Answer:

 

#================================================-
#### Question 5 ####
# Repeat the same process as in Question 3, but with a radio button this time.
# Use the same server script as before.

# Answer:




