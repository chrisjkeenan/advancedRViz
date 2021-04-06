# Set working directory
setwd(data_dir)

# Load the 'shiny' package
library(shiny)

# Creating the ui

ui <- fluidPage(
  
  # Title of the app.
  titlePanel("Chicago Census Data"),
  
  # Render the output as plot.
  plotOutput(outputId = "densityplot")
  
)