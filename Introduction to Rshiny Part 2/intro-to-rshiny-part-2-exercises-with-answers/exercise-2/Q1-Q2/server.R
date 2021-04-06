# Load the shiny package. 
library(shiny)

# Load ggplot2 package
library(ggplot2)

# Load the `chicago_long` dataset.
load("chicago_long.Rdata")

# Creating the server.
server <- function(input, output) {
  # Load the dataset.
  output$densityplot<- 
    renderPlot({   #<- function to create plot object to send to UI
      # Create density plot. 
      ggplot(chicago_long,               #<- take the dataset
             aes(x = norm_value,         #<- set x value
                 fill = variable)) +     #<- fill with variable
        geom_density(alpha = 0.3) + #<- adjust fill transparency
        facet_wrap (~ variable,     #<- make facets by 'variable'
                    ncol = 3)       #<- set a 3-column grid
      
    }) # end of renderPlot
}# end of server
