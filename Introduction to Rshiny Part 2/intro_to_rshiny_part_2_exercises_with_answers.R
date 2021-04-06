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

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Chicago Census Data"), #<- application title
  actionButton("ex_action_button", "ex_action_button"), #<- add action button
  
  sliderInput("ex_slider", " ex_slider",
              min = 0, max = 100,  #<- set min as 0 and max as 100
              value = 1, step = 5, #<- set step as 0.5
              animate=TRUE) 
  
) #<- end of fluidPage

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

# Set working directory.
setwd(data_dir)

# Load the shiny package. 
library(shiny)

# Load ggplot2 package
library(ggplot2)

# Load the `chicago_long` dataset.
load("chicago_long.Rdata")

# Creating the server.
server <- function(input, output) {
  # Load the dataset.
  output$densityplot<- 
    renderPlot({   #<- function to create plot object to send to UI
      # Create density plot. 
      ggplot(chicago_long,               #<- take the dataset
             aes(x = norm_value,         #<- set x value
                 fill = variable)) +     #<- fill with variable
        geom_density(alpha = 0.3) + #<- adjust fill transparency
        facet_wrap (~ variable,     #<- make facets by 'variable'
                    ncol = 3)       #<- set a 3-column grid
      
    }) # end of renderPlot
}# end of server

#================================================-
#### Question 2 ####
# Add the title "Chicago Census Data" to the UI.
# Add the `densityplot` that we created in the previous question to your UI using the `plotOutput` function. 
# Run the App, making sure that the chicago_long.Rdata is in the same folder as your UI and server files. 
# Try re-sizing the window and see how the app changes!

# Answer:

# Load the 'shiny' package
library(shiny)

# Creating the ui

ui <- fluidPage(
  
  # Title of the app.
  titlePanel("Chicago Census Data"),
  
  # Render the output as plot.
  plotOutput(outputId = "densityplot")
  
)


#================================================-
#### Question 3 ####

# Navigate to the 'shiny' folder and the subfolder called 'exercises'. 
# To the same UI script that we created in Question-2, add a Checkbox group widget to accept user input for `variable` with options ("percent_house_crowded", "percent_house_below_poverty","percent_16_unemployed", "percent_25_without_diploma", "percent_dependent", "per_capita_income","hardship_index").
# Name the Checkbox group widget value `selected_variable`.
# Set the default selected variable to "percent_house_crowded".

# Answer:
# Load the shiny package.
library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Chicago Census Data"), #<- application title
  checkboxGroupInput("selected_variable", label = h3("Select Variable"),
                     choices = list("Percent House Crowded" = "percent_house_crowded", 
                                    "Percent House Below Poverty " = "percent_house_below_poverty", 
                                    "Percent 16 Unemployed" = "percent_16_unemployed", 
                                    "Percent 25 without Diploma"= "percent_25_without_diploma",
                                    "Percent Dependent" = "percent_dependent",
                                    "Per Capita Income" = "per_capita_income" ,
                                    "Hardship Index" = "hardship_index" ), 
                     selected = "percent_house_crowded" ),
  plotOutput("densityplot")  #<- `densityplot` from server converted to output element
) #<- end of fluidPage

#================================================-
#### Question 4 ####
# Using the same server script as before, run the App. 
# Try selecting the variable input. What do you notice?

# Answer:
# There is no change in the plot based on the variable selection. 

#================================================-
#### Question 5 ####
# Repeat the same process as in Question 3, but with a radio button this time.
# Use the same server script as before.

# Answer:
# Load the shiny package.
library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Chicago Census Data"), #<- application title
  radioButtons("selected_variable", label = h3("Select Variable"),
                     choices = list("Percent House Crowded" = "percent_house_crowded", 
                                    "Percent House Below Poverty " = "percent_house_below_poverty", 
                                    "Percent 16 Unemployed" = "percent_16_unemployed", 
                                    "Percent 25 without Diploma"= "percent_25_without_diploma",
                                    "Percent Dependent" = "percent_dependent",
                                    "Per Capita Income" = "per_capita_income" ,
                                    "Hardship Index" = "hardship_index" ), 
                     selected = "percent_house_crowded" ),
  plotOutput("densityplot")  #<- `densityplot` from server converted to output element
) #<- end of fluidPage


