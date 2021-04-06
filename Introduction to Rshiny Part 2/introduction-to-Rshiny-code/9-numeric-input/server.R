# Load the packages
library(shiny)
library(ggplot2)

# Load the Costa Rican data.
load("region_household.Rdata")

# Define server logic 
server <- function(input, output) {
# Load the dataset.
output$densityplot<- 
  renderPlot({   #<- function to create plot object to send to UI

  # Create density plot 
    
    ggplot(region_household,              #<- set data
           aes(x = total_in_household,    #<- map `x value`
               fill = region )) +         #<- map fill
           geom_density(alpha = 0.3)   +  #<- adjust density fill
           labs(title = "Density of number of people in a household by region") +
           facet_wrap (~ region,          #<- make facets by 'region'
                       ncol = 3)          #<- set a 3-column grid

     }) # end of renderPlot
}# end of server



 
    

