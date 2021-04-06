library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
  titlePanel("Costa Rican Data"), #<- application title
  actionButton("button", "Click here!"), #<- add action button
) #<- end of fluidPage



