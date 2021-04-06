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

