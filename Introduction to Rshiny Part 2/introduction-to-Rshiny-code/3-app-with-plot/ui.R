library(shiny)

ui <- fluidPage(
  
  # Title of the app
  titlePanel("Costa Rican Data"),
  
  # Render the output as plot
  plotOutput(outputId = "densityplot")
  
)
