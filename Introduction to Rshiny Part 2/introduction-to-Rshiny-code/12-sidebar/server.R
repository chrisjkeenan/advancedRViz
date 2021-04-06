library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic 
server <- function(input, output) {

observeEvent(input$submit,
             
output$densityplot<- 
  renderPlot({   #<- function to create plot object to send to UI
  
  # Read in Costa Rican data.
  load("region_household.Rdata")
  
  isolate({
  # Keep only the regions selected by the user
  region_household = subset(region_household,
                            region %in% input$region) #<- `input$region` is a list of regions selected by user
    
  # Create density plot 
    ggplot(region_household,              #<- set data
           aes(x = total_in_household,    #<- map `x value`
               fill = region )) +         #<- map fill
           geom_density(alpha = 0.3)   +  #<- adjust density fill
           labs(title = "Density of number of people in a household by region") +
           facet_wrap (~ region,          #<- make facets by 'region'
                       ncol = 2)          #<- set a 3-column grid
  }) # end of isolate
 }) # end of renderPlot
) # end of observeEvent
}# end of server



 
    

