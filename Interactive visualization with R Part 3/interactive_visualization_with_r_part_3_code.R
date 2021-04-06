#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 3 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 9: visNetwork  ####

library(visNetwork)

?visNetwork

#=================================================-
#### Slide 11: Directory settings   ####

# Set `main_dir` to the location of your `skillsoft` folder (for Mac/Linux).
main_dir = "~/Desktop/skillsoft-advanced-viz-r-2021"
# Set `main_dir` to the location of your `skillsoft` folder (for Windows).
main_dir = "C:/Users/[username]/Desktop/skillsoft"
# Make `data_dir` from the `main_dir` and # remainder of the path to data directory. 
data_dir = paste0(main_dir, "/data")
# Do the same for your 'plot_dir' which is where your interactive plots will be stored.
plot_dir = paste0(main_dir, "/plots")



#=================================================-
#### Slide 12: Loading packages   ####

library(htmlwidgets)
library(tidyverse)
library(broom)
library(dplyr)
library(visNetwork)


#=================================================-
#### Slide 16: Loading the dataset  ####

# Read in the Costa Rican dataset.
setwd(data_dir)

costa = read.csv("costa_rica_poverty.csv",header = TRUE)

# View the dimensions of the dataset.
dim(costa)

# View first few rows and columns
costa[1:5,1:10]



#=================================================-
#### Slide 17: Subsetting the dataset  ####


# Subset one region.
costa_subset_target = subset(costa, region_central == 1)


# Subset a few columns.
costa_small = costa_subset_target %>%
              select(rooms,ppl_total,
                      monthly_rent,Target)

# View the first few rows of the dataset.
head(costa_small)



#=================================================-
#### Slide 18: Cleaning the dataset  ####

# Remove rows with NA.
costa_small = na.omit(costa_small)

# We keep only the unique rows since duplicate rows would have a distance of 0.
costa_small= unique(costa_small)

head(costa_small)



#=================================================-
#### Slide 19: Measuring similarity of households   ####

?dist


#=================================================-
#### Slide 20: Measuring similarity of terms  ####

# Create distance matrix.
costa_distance = dist(costa_small)

# `dist` returns the lower triangle of the distance matrix as a vector.
head(costa_distance)

# Normalize the distances to values between 0 and 1. 
costa_distance = costa_distance/max(costa_distance)

head(costa_distance)


#=================================================-
#### Slide 21: Measuring similarity of terms  ####


# Use 1- distance to obtain the value for similarity. 
costa_sim = 1-costa_distance 
head(costa_sim)


#=================================================-
#### Slide 23: Exercise 1  ####




#=================================================-
#### Slide 25: Creating the network: edges   ####

# Create edge dataframe. 
costa_edges = tidy(costa_sim)
# Edges dataframe has to be named this way for visNetwork input.
colnames(costa_edges) = c("from", "to", "value")
head(costa_edges)


#=================================================-
#### Slide 27: Creating the network: edges  ####

# We choose the median as the threshold since this gives us the best visualization.
costa_edges = subset(costa_edges,value>median(costa_edges$value))

# Arrange by order of edge thickness.
costa_edges = arrange(costa_edges, desc(value))

# Subset only top 200.
costa_edges = costa_edges[1:200,]



#=================================================-
#### Slide 28: Creating the network: nodes  ####

# Get unique nodes from edges dataframe and combine them 
costa_nodes_from = data.frame(id = unique(costa_edges$from))
costa_nodes_to = data.frame(id = unique(costa_edges$to))
costa_nodes = rbind(costa_nodes_from,costa_nodes_to)

# Retain unique nodes in case nodes are repeated in `from` and `to` columns
costa_nodes = unique(costa_nodes)


#=================================================-
#### Slide 29: Creating the network: nodes  ####

# Add color to the nodes dataframe based on Target value from original dataframe
costa_small = select(costa_small, Target)               #<- we only need the target info
costa_small$id = rownames(costa_small)                 

# Merge nodes dataframe with the dataframe with Target value 
costa_nodes = merge(costa_nodes, costa_small,
                    by = "id", all.x = TRUE)            #<- merge() needs the `id` column to 
                                                        #   join the two dataframes
# Assign color to nodes based on the Target value
costa_nodes$color = factor(costa_nodes$Target,          #<- create a factor 
labels = c("orange", "darkblue", "maroon", "seagreen"), #<- assign color 
levels = c(1, 2, 3, 4))                                 #   based on Target value

# We do not need the Target column anymore.
costa_nodes = select(costa_nodes, c(id, color))          
head(costa_nodes)


#=================================================-
#### Slide 31: Creating the network   ####

# Create network.
costa_network = visNetwork(costa_nodes,                 #<- set nodes
                           costa_edges)           #<- set edges

costa_network


#=================================================-
#### Slide 34: Customizing the network visualization  ####


# Add network visualizations
costa_network = visNetwork(costa_nodes,                 #<- set nodes
                           costa_edges)  %>%            #<- set edges
                 visOptions(highlightNearest = TRUE,    #<- highlight nearest nodes
                                                        #   when clicking on a node 
                           nodesIdSelection = TRUE)     #<- create a dropdown menu to 
                                                        #   select particular nodes  

costa_network


#=================================================-
#### Slide 35: Saving networks with htmlwidgets  ####

# Set working directory to where you save interactive plots.
setwd(plot_dir)

# Load the library.
library(htmlwidgets)

# Save desired interactive plot to an HTML file.
saveWidget(costa_network,                     #<- plot object to save
           "network.html",                    #<- name of file to where the plot is to be saved
            selfcontained = TRUE)             #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded
                                              #   into the HTML file itself  


#=================================================-
#### Slide 37: Exercise 2  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
