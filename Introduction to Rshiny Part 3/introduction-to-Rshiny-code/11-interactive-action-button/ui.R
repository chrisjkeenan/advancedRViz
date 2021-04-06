library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- Fluid pages scale their components in realtime to fill all available browser width.
   titlePanel("Costa Rican Data"), #<- Application title
   checkboxGroupInput("region", label = h3("Select Region"),
                      choices = list("Antlantica" = "region_antlantica", 
                                     "Brunca" = "region_brunca", 
                                     "Central" = "region_central", 
                                     "Chorotega"= "region_Chorotega",
                                     "Huetar" = "region_huetar",
                                     "Pacifico" = "region_pacifico" 
                                     ), 
                      selected =  "region_antlantica"),
   
  # Action button to trigger the event.
   actionButton(inputId = "submit",  #<- input ID
                label = "Submit"),   #<- input label
    
   plotOutput("densityplot")  #<- `scatterplot` from server converted to output element
  ) #<- end of fluidPage

