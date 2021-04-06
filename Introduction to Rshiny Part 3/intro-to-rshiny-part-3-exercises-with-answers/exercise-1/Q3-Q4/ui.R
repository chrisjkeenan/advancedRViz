# Load the shiny package.
library(shiny)

# Define UI for application.
ui<- fluidPage(        #<- fluid pages scale their components in real time to fill all available browser width
    titlePanel("Chicago Census Data"), #<- application title
    checkboxGroupInput("selected_variable", label = h3("Select Variable"),
                       choices = list("Percent House Crowded" = "percent_house_crowded", 
                                      "Percent House Below Poverty " = "percent_house_below_poverty", 
                                      "Percent 16 Unemployed" = "percent_16_unemployed", 
                                      "Percent 25 without Diploma"= "percent_25_without_diploma",
                                      "Percent Dependent" = "percent_dependent",
                                      "Per Capita Income" = "per_capita_income" ,
                                      "Hardship Index" = "hardship_index"), 
                       selected = "percent_house_crowded"),
    # Action button to trigger the event.
    actionButton(inputId = "submit",  #<- input ID
                 label = "Submit"),    #<- input label
    
    plotOutput("densityplot")  #<- `densityplot` from server converted to output element
) #<- end of fluidPage