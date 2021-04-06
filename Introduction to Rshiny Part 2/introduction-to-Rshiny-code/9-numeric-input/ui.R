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

