#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVE VISUALIZATION WITH R PART 3 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####

# Set working directory to where the data is located.
# Load the 'chicago_with_target.csv' dataset and save it as `chicago` dataframe. 
# More information about the chicago dataset can be found at https://www.kaggle.com/apgross/chicagocensusdata 
# Our Target variable here is whether the per_capita_income is below or above the mean. 
# Rename the column names as the following:
# c("community_number", "community_area", "percent_house_crowded", "percent_house_below_poverty","percent_16_unemployed", "percent_25_without_diploma", "percent_dependent", "per_capita_income","hardship_index", "Target")
# Use na.omit() to remove any NA rows present.
# Keep only the unique rows of `chicago` dataframe as `chicago_nw` since we want to see the network with unique nodes. 
# Print out the first few rows of the dataframe `chicago_nw`. 

# Answer: 



#================================================-
#### Question 2 ####

# Subset the columns "percent_house_crowded", "percent_house_below_poverty", "percent_16_unemployed","percent_25_without_diploma", "percent_dependent", "per_capita_income", "hardship_index" since we want to use only numeric variables to create our network. 
# Create distance matrix `chicago_distance` for the `chicago_nw` dataframe using the `dist` function 
# Normalize the distances to values between 0 and 1. 
# Create a similarity matrix `chicago_sim` using `chicago_distance`

# Answer: 




#### Exercise 2 ####
# =================================================-

#### Question 1 ####

# Create edge dataframe `chicago_edges` using the `tidy` function and the `chicago_sim` matrix
# Rename the columns of `chicago_edges` to "from", "to", "value" since this is how visNetwork reads the edge dataframe
# View the first few rows of the`chicago_edges`.

# Answer: 




#================================================-
#### Question 2 ####
# Choosing the median as the threshold, subset only those rows in `chicago_edges` where `value` is greater than the threshold. 
# Order the `chicago_edges` dataframe by descending order of `value`.
# Keep only the top 100 rows in `chicago_edges` as we want to visualize a small network.

# Answer:




#================================================-
#### Question 3 ####

# Create the nodes dataframe `chicago_nodes_from` using the unique values from the "from"" column of `chicago_edges` dataframe.
# Create the nodes dataframe `chicago_nodes_to` using the unique values from the "to" column of `chicago_edges` dataframe.
# Combine the nodes `chicago_nodes_from` and `chicago_nodes_to` create dataframe `chicago_nodes`. 
# Keep only the unique nodes. 

# Answer: 



#================================================-
#### Question 4 ####

# Add color to the nodes dataframe based on Target value by doing the following:
# 1. Create a dataframe called `chicago_small` with only the Target column from `chicago`.
# 2. Create an ID column for the `chicago_small` dataframe using the rownames of `chicago`
# 3. Merge the `chicago_nodes` dataframe with the `chicago_small` dataframe using the `id` column.
# 4. Add a `color` variable to the `chicago_nodes` dataframe whose value depends on the `Target` variable. Set the level 0 as "maroon" and level 1 as "darkblue". 
# 5. Only keep the `id` and `color` columns for `chicago_nodes`. 

# Answer: 



#================================================-
#### Question 5 ####

# Create the network using `visNetwork` with nodes `chicago_nodes` and  edges `chicago_edges`.
# Set `highlightNearest` and `nodesIdSelection` as TRUE in visOptions.
# What do you observe in the network? Notice the difference in the connections between red and the blue nodes. 

# Answer: 



