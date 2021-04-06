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
  plotOutput("densityplot")  #<- `densityplot` from server converted to output element
) #<- end of fluidPage

