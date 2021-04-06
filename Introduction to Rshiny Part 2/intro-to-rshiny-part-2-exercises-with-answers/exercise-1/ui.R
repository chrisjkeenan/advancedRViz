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
