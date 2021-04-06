#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## ADVANCED VISUALIZATION WITH R PART 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Directory settings  ####

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
#### Slide 14: Loading the CMP dataset for EDA  ####

# Set working directory to where we store data.
setwd(data_dir)

# Read CSV file called "ChemicalManufacturingProcess.csv"
CMP = read.csv("ChemicalManufacturingProcess.csv",
               header = TRUE,
               stringsAsFactors = FALSE)


#=================================================-
#### Slide 15: About the CMP dataset  ####

# View CMP dataset in the tabular data explorer.
View(CMP)


#=================================================-
#### Slide 17: Subsetting data (cont'd)  ####

# Let's make a vector of column indices we would like to save.
column_ids = c(1:4,  #<- concatenate a range of ids
               14:16)#<- with another a range of ids
column_ids

# Let's save the subset into a new variable.
CMP_subset = CMP[ , column_ids]
str(CMP_subset)


#=================================================-
#### Slide 19: Univariate plots: boxplots  ####

summary(CMP_subset$Yield)
boxplot(CMP_subset$Yield,
        col = "orange",
        main = "Yield Summary") #<- add title 


#=================================================-
#### Slide 20: Sample colors for visualization  ####

?sample


#=================================================-
#### Slide 21: Sample colors for visualization (cont'd)  ####

# Set random seed to get the same sample every time!
set.seed(1)

# We have as many variables as columns in our data.
# Save number of columns to a variable using `ncol` function.
n_cols = ncol(CMP_subset)

# Pick a sample of colors for each
# variable in our data set
col_sample = sample(colors(),#<- vector of colors
                    n_cols)  #<- n elements to sample 
col_sample


#=================================================-
#### Slide 22: Compare variables: boxplots combined  ####

# Make a box plot of all variables and give a vector of colors for each of them.
boxplot(CMP_subset, col = col_sample) 


#=================================================-
#### Slide 24: Univariate plots: histogram  ####

# Univariate plot: histogram.
hist(CMP_subset$Yield,
     col = col_sample[1],
     xlab = "Yield",   #<- set x-axis label
     main = "Dist. of Yield") #<- set title


#=================================================-
#### Slide 25: Univariate plots: histogram (cont'd)  ####

# Histogram data without plot.
hist(CMP_subset$Yield, plot = FALSE)

# Histogram data without plot.
hist(CMP_subset$Yield, plot = FALSE)


#=================================================-
#### Slide 26: Compare variables: histograms combined  ####

# Make a combined histogram plot.
par(                                    #<- set plot area parameters with `par`
    mfrow = c(1, 2))                    #<- split area into 1 row 2 columns with `mfrow` 
hist(CMP_subset$BiologicalMaterial01,   #<- add 1st histogram
     col = col_sample[2],
     xlab = "Bio Material #1",   
     main = "Dist. of Bio Material #1")
hist(CMP_subset$BiologicalMaterial02,   #<- add 2nd histogram
     col = col_sample[3],
     xlab = "Bio Material #2",   
     main = "Dist. of Bio Material #2")



#=================================================-
#### Slide 30: Bivariate plots: R `plot` function  ####

?plot


#=================================================-
#### Slide 31: Bivariate plots: scatterplot  ####

plot(CMP_subset[ , 2], CMP_subset[ , 1],
     xlab = "Bio Material 01", ylab = "Yield",  #<- add axis labels
     main = "Bio Material 01 vs Yield",         #<- add title
     pch = 8,                                   #<- type of symbol to use
     cex = 2,                                   #<- scale of the point
     col = "steelblue")


#=================================================-
#### Slide 34: Multivariate plots: scatterplot matrix  ####

# Plot scatterplots for many variables.
pairs(CMP_subset[, 1:4], #<- select variables
      pch = 19,          #<- set symbol
      col = "steelblue") #<- set color


#=================================================-
#### Slide 36: Exercise 1  ####




#=================================================-
#### Slide 39: Install `ggplot2`   ####

install.packages("ggplot2")

# Then we need to load it to our environment.
library(ggplot2)

# Take a look at the documentation.
library(help = "ggplot2")



#=================================================-
#### Slide 40: Working with `ggplot2`   ####

?ggplot


#=================================================-
#### Slide 45: Building a plot with `geom_histogram`  ####

library(ggplot2)
# Create base plot.
ggp1 = ggplot(CMP_subset,    #<-Set data
              aes(x = Yield))#<-Set aesthetics
ggp1

# Add histogram layer.
ggp1 + geom_histogram()


#=================================================-
#### Slide 47: Plotting with `geom_histogram`: adjust  ####

ggp1 = ggp1 +
  geom_histogram(aes(y = ..density..),   #<- y-axis of type `density`
                 binwidth = 0.75,        #<- adjust binwidth
                 color = "steelblue",
                 fill = "gray")

ggp1


#=================================================-
#### Slide 49: `geom_histogram`: add density layer  ####

ggp1 = ggp1 +                       
       geom_density(alpha = 0.5,    #<- add density layer with 50% opacity
               color = "gray",     
               fill = "steelblue")+ 
              labs(title = "Yield Distribution",
              subtitle = "Histogram & Density")
ggp1



#=================================================-
#### Slide 50: `geom_histogram`: polish theme  ####

ggp1 = ggp1 + 
  theme_bw() +     #<- add a black and white theme
  
  # Customize elements of the theme.
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))

# Display polished plot.
ggp1


#=================================================-
#### Slide 52: Exercise 2  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
