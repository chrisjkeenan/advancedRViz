#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTRO TO RSHINY PART 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 6: Creating action buttons in R  ####

# This function will not generate an action button on its own.
# It needs to be added to the base UI script we created earlier.

actionButton("change_in_action_id", "Click here!")

# This function will not generate an action link on its own.
# It needs to be added to the base UI script we created earlier.

actionLink("change_in_action_id", "Click here!")



#=================================================-
#### Slide 7: Adding an action button to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
   titlePanel("Costa Rican Data"), #<- application title
   actionButton("button", "Click here!") #<- add action button
   
  ) #<- end of fluidPage



#=================================================-
#### Slide 10: Creating a slider in R  ####

# This function will not generate a slider on its own.
# It needs to be added to the base UI script we created earlier.

# slider examples
sliderInput("Example-1", "Basic Integer slider", #<- add Input Id and label
min = 0, max = 500,  #<- specify max and min values                  
value = 250), #<- default value to display when we run the app

# slider with step 
sliderInput("Example-2", " Slider with step",
min = 0, max = 2,
value = 1, step = 0.5), #<- set step as 0.5

# slider with range specification
sliderInput("Example-3", "Slider with range",
min = 1, max = 500,
value = c(100,250)),  #<- specify range to be displayed when we run the app

# Slider with custom currency formatting and animation
sliderInput("Example-4", "Custom slider with animation",
min = 0, max = 1000,
value = 0, step = 250,
pre = "$", sep = ",",  #<- specify pre-fix and separator to display in the slider
animate = TRUE)  #<- configure animate button



#=================================================-
#### Slide 11: Adding a slider to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Costa Rican Data"), #<- application title
  # slider examples
  sliderInput("Example-1", "Basic Integer slider", #<- add Input Id and label
              min = 0, max = 500,  #<- specify max and min values                  
              value = 250), #<- default value to display when we run the app
  
  # slider with step 
  sliderInput("Example-2", " Slider with step",
              min = 0, max = 2,
              value = 1, step = 0.5), #<- set step as 0.5
  
  # slider with range specification
  sliderInput("Example-3", "Slider with range",
              min = 1, max = 500,
              value = c(100,250)),  #<- specify range to be displayed when we run the app
  
  # Slider with custom currency formatting and animation
  sliderInput("Example-4", "Custom slider with animation",
              min = 0, max = 1000,
              value = 0, step = 250,
              pre = "$", sep = ",",  #<- specify pre-fix and separator to display in the slider
              animate = TRUE)  #<- configure animate button
) #<- end of fluidPage





#=================================================-
#### Slide 14: Exercise 1  ####




#=================================================-
#### Slide 17: Creating checkbox in R  ####

# This function will not generate a checkbox on its own.
# It needs to be added to the base UI script we created earlier.

ui <- fluidPage(
  checkboxInput("checkbox-input", "Checkbox input", FALSE)
)



#=================================================-
#### Slide 18: Adding checkbox to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Costa Rican Data"), #<- application title
  checkboxInput("checkbox-input", "Checkbox input", FALSE)
) #<- end of fluidPage




#=================================================-
#### Slide 20: Data preparation: load the dataset  ####

# Set the working directory to the data directory.
setwd(data_dir)

# Load the dataset and view the first few rows. 
load("region_household.Rdata")
head(region_household)


#=================================================-
#### Slide 21: Create static density plot based on regions  ####

# This is how our static `ggplot` density plot was created.

density_plot <- 
ggplot(region_household,            #<- set data
       aes(x = total_in_household,  #<- map `x value`
           fill = region )) +       #<- map fill
       geom_density(alpha = 0.3) +  #<- adjust fill transparency
       labs(title =                 #<- add title 
            "Density of number of people by region") +
      facet_wrap (~ region,         #<- make facets by 'region'
                  ncol = 3)         #<- set a 3-column grid


#=================================================-
#### Slide 22: Create static density plot based on regions - cont'd  ####

density_plot


#=================================================-
#### Slide 23: Add density plot to our base app: UI  ####

library(shiny)

ui <- fluidPage(
  
  # Title of the app.
  titlePanel("Costa Rican Data"),
  
  # Render the output as plot.
  plotOutput(outputId = "densityplot")
  
)


#=================================================-
#### Slide 24: Add density plot to our base app: server  ####

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic. 
server <- function(input, output) {
 
  # Load the dataset.
  load("region_household.Rdata")
  
output$densityplot<- 
  renderPlot({   #<- function to create plot object to send to UI

  # Create density plot. 
    ggplot(region_household,              #<- set data
           aes(x = total_in_household,    #<- map `x value`
               fill = region )) +         #<- map fill
           geom_density(alpha = 0.3)   +  #<- adjust density fill
           labs(title = "Density of number of people in a household by region") +
           facet_wrap (~ region,          #<- make facets by 'region'
                       ncol = 3)          #<- set a 3-column grid

     }) # end of renderPlot
}# end of server


#=================================================-
#### Slide 26: Creating a checkbox group in R  ####

# This function will not generate a checkbox on its own.
# It needs to be added to the base UI script we created earlier.

checkboxGroupInput(
                   "region",                                          #<- name of the input variable
                   label = h3("Select Region"),                       #<- the title for the widget
                   choices = list("Antlantica" = "region_antlantica", #<- list of choices 
                                  "Brunca" = "region_brunca",         #   with choice label
                                  "Central" = "region_central",       #   and choice value
                                  "Chorotega"= "region_Chorotega",
                                  "Huetar" = "region_huetar",
                                  "Pacifico" = "region_pacifico"), 
                             selected = NULL)                         #<- initial selected value


#=================================================-
#### Slide 27: Adding a checkbox group to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
   titlePanel("Costa Rican Data"), #<- application title
   checkboxGroupInput("region", label = h3("Select Region"),
                      choices = list("Antlantica" = "region_antlantica", 
                                     "Brunca" = "region_brunca", 
                                     "Central" = "region_central", 
                                     "Chorotega"= "region_Chorotega",
                                     "Huetar" = "region_huetar",
                                     "Pacifico" = "region_pacifico" 
                                     ), 
                      selected = "region_antlantica"), #<- set default input
    plotOutput("densityplot")  #<- `scatterplot` from server converted to output element
  ) #<- end of fluidPage



#=================================================-
#### Slide 30: Creating radio buttons in R  ####

# This function will not generate a checkbox on its own.
# It needs to be added to the base UI script we created earlier.

radioButtons(
                   "region",                                          #<- name of the input variable
                   label = h3("Select Region"),                       #<- the title for the widget
                   choices = list("Antlantica" = "region_antlantica", #<- list of choices 
                                  "Brunca" = "region_brunca",         #   with choice label
                                  "Central" = "region_central",       #   and choice value
                                  "Chorotega"= "region_Chorotega",
                                  "Huetar" = "region_huetar",
                                  "Pacifico" = "region_pacifico"), 
                             selected = NULL)                         #<- initial selected value


#=================================================-
#### Slide 31: Adding  radio buttons to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
   titlePanel("Costa Rican Data"), #<- application title
   radioButtons("region", label = h3("Select Region"),
                      choices = list("Antlantica" = "region_antlantica", 
                                     "Brunca" = "region_brunca", 
                                     "Central" = "region_central", 
                                     "Chorotega"= "region_Chorotega",
                                     "Huetar" = "region_huetar",
                                     "Pacifico" = "region_pacifico" 
                                     ), 
                      selected = "region_antlantica"), #<- set default input
    plotOutput("densityplot")  #<- `scatterplot` from server converted to output element
  ) #<- end of fluidPage



#=================================================-
#### Slide 35: Creating a numeric input box in R  ####

# This function will not generate an numeric input on its own.
# It needs to be added to the base UI script we created earlier.

numericInput("contact",  #<- input_id
               "Contact number:", #<- Label to display
               0, #<- default input
               min = 0,  #<- minimum value
               max = 9999999999)  #<- maximum value



#=================================================-
#### Slide 36: Adding a numeric input box to our base app: UI  ####

library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Costa Rican Data"), #<- application title
  numericInput("contact",  #<- input_id
               "Contact number:", #<- Label to display
               0, #<- default input
               min = 0,  #<- minimum value
               max = 9999999999)  #<- maximum value
) #<- end of fluidPage





#=================================================-
#### Slide 39: Exercise 2  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
