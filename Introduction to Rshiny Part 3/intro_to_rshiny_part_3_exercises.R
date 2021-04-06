#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTRO TO RSHINY PART 3 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 
# Using the same server script that we created in Exercise 2 of last module, in the `renderPlot` function, add a line to subset the variables that are in the list selected by the user i.e. input$selected_variable.

# Answer:



#================================================-
#### Question 2 ####
# Using the same UI script you created as at the end of Intro to Rshiny - Part 2 - Exercise 2, run the App. 
# Try selecting the variable input. What do you notice this time? 

# Answer:



#================================================-
#### Question 3 ####
# To the UI, add an action button with the `label` "Submit" and `inputId `"submit" to the UI to trigger the regenerating of the plot. 

# Answer:



#================================================-
#### Question 4 ####
# To the server script, add the `observeEvent` outside the renderPlot function to observe when the submit button is clicked using the value `input$submit`. 
# Using the `isolate` function, keep the `renderPlot` function from regenerating unless the submit button is clicked. 
# Run the App. Try selecting a variable input and then clicking the submit button. 

# Answer:



#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 
# Using the same UI script that we used in Exercise 1, add the sidebar layout to our app. 
# Keep the title panel and the checkbox group input in the `sidebarPanel`.
# Keep the plot in the `mainPanel`. 
# Using the same server file as at the end of Exercise 1, run the App. Resize the app window to make it wider so that the plots can be seen more clearly. 

# Answer:






