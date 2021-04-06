#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTRO TO RSHINY PART 1 Exercises ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 

# Inside the folder 'exercises', create a new R file called 'ui.R'.

# In the ui.R file, load the Shiny package.

# Add the code to create the actual UI. Leave it empty for now.



#================================================-
### Question 2 ####
# Inside the folder 'exercise', create a new R file called 'server.R'.

# In the 'server.R' file, set the directory to the 'idb-advanced-viz' folder.

# In the 'server.R' file, add the code to load the 'shiny' package.

# In the 'server.R file, add the code to load the 'chicago_long' dataset i.e 'chicago_long.Rdata'. In order for this command to work, the Rdata file has to be in the same folder as your server and UI files.
# Hint: load("chicago_long.Rdata")

#================================================-
### Question 3 ####
# In the 'server.R' file, add the code to create the actual Server.
# Leave it empty for now.


#================================================-
#### Question 4 ####
# Run your application.
# What do you see?

# Answer:


#================================================-
#### Question 5 ####
# Using the given code, create a density plot for the various variables and add to the server script. 

# ggplot(chicago_long,               #<- take the dataset
#        aes(x = norm_value,         #<- set x value
#        fill = variable)) +     #<- fill with variable
#        geom_density(alpha = 0.3) + #<- adjust fill transparency
#        facet_wrap (~ variable,     #<- make facets by 'variable'
#                    ncol = 3)       #<- set a 3-column grid

# Add this plot to your server script within the `renderPlot` function and name this plot object `output$densityplot`. 
# Make sure to load the `ggplot2` library along with the `shiny` library. 

#================================================-  
#### Question 6 ####
# Add the title "Chicago Census Data" to the UI.
# Add the `densityplot` that we created in the previous question to your UI using the `plotOutput` function. 
# Run the App, making sure that the chicago_long.Rdata is in the same folder as your UI and server files. 
# Try resizing the window and see how the app changes!






