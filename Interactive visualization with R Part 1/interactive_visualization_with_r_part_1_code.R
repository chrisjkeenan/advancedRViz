#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 4: Directory settings  ####

# Set `main_dir` to the location of your `skillsoft` folder (for Mac/Linux).
main_dir = "~/Desktop/skillsoft"
# Set `main_dir` to the location of your `skillsoft` folder (for Windows).
main_dir = "C:/Users/[username]/Desktop/skillsoft"
# Make `data_dir` from the `main_dir` and remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")
# Set directory to data_dir.
setwd(data_dir)


#=================================================-
#### Slide 6: Interactive visualizations: highcharter  ####

# Install `highcharter` package.
install.packages("highcharter")

# Load the library.
library(highcharter)

# View documentation.
library(help = "highcharter")


#=================================================-
#### Slide 7: Highcharter main function: highchart  ####

?highchart


#=================================================-
#### Slide 8: Highcharter: `hchart` vs `highchart`  ####

?hchart

hchart(Some_data,       #<- dataset to use
       "plot_type",     #<- plot type to use
       hcaes(x = variable1, #<- x-axis mapping 
             y = variable2, #<- y-axis mapping 
             group = variable3, #<- group by
             ...))              


#=================================================-
#### Slide 11: Set up: load & prepare data  ####

# Set working directory to where we store data.
setwd(data_dir)

library(tidyverse)

# Read CSV file
CMP_subset = read.csv("CMP_subset.csv",
           header = TRUE)

# Prep data for univariate plots  
CMP_subset_long = CMP_subset %>%
  gather(key = "variable",
         value = "value") 

# Make names of processes and materials more user friendly and readable.
CMP_subset_long = CMP_subset_long %>%
     mutate(variable = 
            str_replace(variable,     
                          "Biological", "Bio ")) %>%  
     mutate(variable = 
            str_replace(variable, 
                          "Manufacturing", "Man. ")) %>%
     mutate(variable = 
            str_replace(variable, 
                          "0", " ")) %>%
    group_by(variable) %>%              #<- normalize
    mutate(norm_value =                 
           value/max(value, na.rm = TRUE))   



#=================================================-
#### Slide 12: Set up: prepare data  ####

# Prep data for scatterplot
CMP_subset_long2 = CMP_subset %>%
  gather(BiologicalMaterial01:ManufacturingProcess03, 
         key = "variable",                            
         value = "value") %>%                         
  # All other transformations we've done before.
  mutate(variable = str_replace(variable, "Biological", "Bio ")) %>%
  mutate(variable = str_replace(variable, "Manufacturing", "Man. ")) %>%
  mutate(variable = str_replace(variable, "0", " ")) %>%
  group_by(variable) %>%
  mutate(norm_value = value/max(value, na.rm = TRUE))

head(CMP_subset_long2,3)


#=================================================-
#### Slide 13: hchart: scatterplot  ####

# Construct an interactive scatterplot.
scatter_interactive =              #<- name the plot   
  hchart(CMP_subset_long2,         #<- set data
         "scatter",                #<- plot type "scatter"
          hcaes(x = norm_value,    #<- set aesthetics to map x-axis
                y = Yield,         #<- set aesthetics to map y-axis
                group = variable)) #<- group by



#=================================================-
#### Slide 14: hchart: scatterplot (cont'd)  ####

scatter_interactive


#=================================================-
#### Slide 16: Scatterplot: `pipe` and customize  ####

# Pipe chart options to original chart.
scatter_interactive = scatter_interactive %>%
  # Use chart options to specify zoom.
  hc_chart(zoomType = "xy") 

scatter_interactive


#=================================================-
#### Slide 17: Scatterplot: add title  ####

# Pipe chart options to original chart.
scatter_interactive = scatter_interactive %>%
 # Add title to the plot.
 hc_title(text = "CMP data: Yield vs. other variables")

scatter_interactive


#=================================================-
#### Slide 19: hchart: correlation matrix  ####

# Compute a correlation matrix for the first 
# 4 variables in our data.
cor_matrix = cor(CMP_subset[, 1:4])

# Construct a correlation plot by 
# simply giving the plotting function
# a correlation matrix.
correlation_interactive = hchart(cor_matrix) %>%
 # Add title to the plot.
 hc_title(text = "CMP data: correlation")



#=================================================-
#### Slide 20: hchart: correlation matrix (cont'd)  ####

correlation_interactive


#=================================================-
#### Slide 22: Exercise 1  ####




#=================================================-
#### Slide 24: hchart: column plot  ####

# Create data summary.
CMP_summary = summary(CMP_subset)

# Save it as a data frame.
CMP_summary = as.data.frame(CMP_summary)

# Inspect the data.
head(CMP_summary)
# Remove an empty variable.
CMP_summary$Var1 = NULL

# Rename remaining columns.
colnames(CMP_summary) = c("Variable", 
                          "Summary")
# Inspect updated data.
head(CMP_summary)


#=================================================-
#### Slide 25: Column plot: prepare data  ####

# Separate `Summary` column into 2 columns.
CMP_summary = CMP_summary %>%              #<- set original data 
  separate(Summary,                        #<- separate `Summary` variable 
           into = c("Statistic", "Value"), #<- into 2 columns: `Statistic`, `Value`
           sep = ":",                      #<- set separating character
           convert = TRUE)                 #<- where applicable convert data (to numeric)

# Inspect the first few entries in data.
head(CMP_summary)

# Inspect total number of rows in data including NAs.
nrow(CMP_summary)


#=================================================-
#### Slide 26: Column plot: create plot  ####

# Inspect `Value` column for `NAs`.
which(is.na(CMP_summary$Value) == TRUE)

# Subset only rows where `Value` is not NAs.
CMP_summary = subset(CMP_summary, !is.na(Value))

# Now the number of rows should be 4 less.
nrow(CMP_summary)

# Construct the summary chart.
CMP_summary_interactive = 
  hchart(CMP_summary,             #<- set data
         "column",                #<- set type (`column` in highcharts)
         hcaes(x = Statistic,     #<- arrange `Statistics` across x-axis
               y = Value,         #<- map `Value` of each `Statistic` to y-axis
               group = Variable)) #<- group columns by `Variable`



#=================================================-
#### Slide 27: Column plot: display plot  ####

CMP_summary_interactive


#=================================================-
#### Slide 28: Column plot: customize tooltip  ####

# Adjust tooltip options by piping `hc_tooltip` to base plot.
CMP_summary_interactive = CMP_summary_interactive %>% 
  hc_tooltip(shared = TRUE)  %>%               #<- `shared` needs to be set to `TRUE`
  hc_title(text = "CMP data variable summary") #<- add title to your plot



#=================================================-
#### Slide 29: Column plot: customize tooltip (cont'd)  ####

CMP_summary_interactive


#=================================================-
#### Slide 31: Highcharts boxplot: hcboxplot  ####

?hcboxplot

hcboxplot(x = Numeric_data_vector,
          var = Categorical_data_vector,
          ...)


#=================================================-
#### Slide 32: Highcharts boxplot: hcboxplot (cont'd)  ####

# Construct an interactive boxplot.
boxplot_interactive =  
  hcboxplot(x = CMP_subset_long$norm_value,
            var = CMP_subset_long$variable,
            name = "Normalized value") %>%
  hc_title(text = "CMP data variables")
boxplot_interactive


#=================================================-
#### Slide 34: hcboxplot: customize with `hc_plotOptions`  ####

# Enhance original boxplot with color options.
boxplot_interactive = boxplot_interactive %>% 
  hc_plotOptions(   #<- plot options
    boxplot = list(     #<- for boxplot 
      colorByPoint = TRUE)) #<- color each box
boxplot_interactive


#=================================================-
#### Slide 36: Save interactive plots: htmlwidgets  ####

# Install `htmlwidgets` package.
install.packages("htmlwidgets")

# Load the library.
library(htmlwidgets)

# View documentation.
library(help = "htmlwidgets")


#=================================================-
#### Slide 37: Save interactive plots: htmlwidgets (cont'd)  ####

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(scatter_interactive,        #<- plot object to save
           "interactive_scatterplot.html", #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself  


#=================================================-
#### Slide 39: Exercise 2  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
