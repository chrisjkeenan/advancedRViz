#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## ADVANCED VISUALIZATION WITH R PART 2 ##

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
#### Slide 5: Loading the data  ####

# Set working directory to where we store data.
setwd(data_dir)

# Read the csv file into R environment.
CMP_subset = read.csv("CMP_subset.csv",
                      header = TRUE,
                      stringsAsFactors = FALSE)


#=================================================-
#### Slide 7: Scatterplot with `geom_point`: set up (cont'd)  ####

# Load package
library(ggplot2)

ggp2 = ggplot(CMP_subset,                   #<- specify dataframe
              aes(x = BiologicalMaterial01, #<- map x-axis
                  y = Yield))               #<- map y-axis

ggp2


#=================================================-
#### Slide 8: Scatterplot with `geom_point`: set up (cont'd)  ####

ggp2 = ggp2 + geom_point()
ggp2


#=================================================-
#### Slide 10: Scatterplot with `geom_point`: adjust  ####

ggp2 = ggp2 + 
  
  # Adjust the color of the points.
  geom_point(color = "darkorange") + 
  
  # Add linear regression line (`lm`). 
  geom_smooth(method = lm) +
  
  # Add a title and a subtitle.
  labs(title = "Bio. Material 1 vs. Yield",
       subtitle = "Scatterplot with linear fit")

# View the plot.
ggp2


#=================================================-
#### Slide 11: Scatterplot with `geom_point`: polish  ####

ggp2 = ggp2 +
  
  # Add black & white theme, adjust labels.
  theme_bw() + 
  
  # Customize elements of the theme.
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))
#View the plot
ggp2



#=================================================-
#### Slide 12: Saving a theme to a variable  ####

my_ggtheme = theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))

# Add saved theme and re-save the plot.
ggp2 = ggp2 + my_ggtheme
ggp2



#=================================================-
#### Slide 15: Set up: load tidyverse  ####

# Load tidyverse library
library(tidyverse)
# Save our custom `ggplot` theme to a variable.
my_ggtheme = theme_bw() +                     
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        legend.text = element_text(size = 16),              
        legend.title = element_text(size = 18),             
        plot.title = element_text(size = 25),               
        plot.subtitle = element_text(size = 18))          


#=================================================-
#### Slide 16: Set up: data conversion with `gather`  ####

CMP_subset_long = CMP_subset %>%
  gather(key = "variable",
         value = "value") 
# Inspect the first few observations.
head(CMP_subset_long)

# Inspect the last few observations.
tail(CMP_subset_long)


#=================================================-
#### Slide 17: Set up: data cleaning with `mutate`  ####

# Make names of processes and materials more user friendly and readable.
CMP_subset_long = CMP_subset_long %>%
  
     # Replace `Biological` with `Bio`.
     mutate(variable = 
              str_replace(variable,     #<- in column `variable`
                          "Biological", #<- replace "Biological"
                          "Bio ")) %>%  #<- with "Bio "
  
     # Replace `Manufacturing` with `Man.`.
     mutate(variable = 
              str_replace(variable, 
                          "Manufacturing", 
                          "Man. ")) %>%
  
     # Remove `0` from numbering.
     mutate(variable = 
              str_replace(variable, 
                          "0", 
                          " "))
# Inspect few first 
# entries in the data.
head(CMP_subset_long)

# Inspect few last 
# entries in the data.
tail(CMP_subset_long)


#=================================================-
#### Slide 21: Set up & link data: make boxplots  ####

# A basic box plot with pre-saved theme.
boxplots = ggplot(CMP_subset_long,   #<- set the base plot + data
                  aes(x = variable,  #<- map `variable` to x-axis
                      y = value)) +  #<- map `value` to y-axis
           geom_boxplot() +          #<- add boxplot geom
           my_ggtheme                #<- add pre-saved theme

# View plot.
boxplots


#=================================================-
#### Slide 22: Set up: normalize data with group_by + mutate  ####

# Let's normalize the data and then create boxplots.
CMP_subset_long = CMP_subset_long %>%
  group_by(variable) %>%              #<- group values by variable
  mutate(norm_value =                 #<- make `norm_value` column
           value/max(value,           #<- divide value by group max
                     na.rm = TRUE))   #<- don't forget the NAs!

CMP_subset_long


#=================================================-
#### Slide 23: Set up: boxplot with normalized data  ####

# Construct the base plot for normalized data.
base_norm_plot = ggplot(CMP_subset_long,        #<- set data
                        aes(x = variable,       #<- map `variable`
                            y = norm_value)) +  #<- map `norm_value`
                 geom_boxplot() +               #<- add boxplot layer
                 my_ggtheme                     #<- add theme

# View 
base_norm_plot


#=================================================-
#### Slide 24: Adjust: normalized boxplot aesthetics  ####

# Let's add a fill color to the plot.
boxplots_norm = ggplot(CMP_subset_long,        #<- set data
                        aes(x = variable,       #<- map `variable`
                            y = norm_value,     #<- map `norm_value`
                            fill = variable)) + #<- set fill
                 geom_boxplot()  +              #<- boxplot layer
                 my_ggtheme                     #<- add theme

# View boxplot
boxplots_norm


#=================================================-
#### Slide 25: Adjust: normalized boxplot legends  ####

# Make color of fill based on variable.
boxplots_norm = boxplots_norm +     #<- set base plot   
                guides(fill = FALSE) #<- remove redundant legend 

# View updated plot.
boxplots_norm


#=================================================-
#### Slide 26: Polish: normalized boxplot details  ####

# Make outliers stand out with red color and bigger size.
boxplots_norm = boxplots_norm +       #<- previously saved plot
  geom_boxplot(outlier.color = "red", #<- adjust outlier color
               outlier.size = 5) +    #<- adjust outlier size
  labs(title = "CMP data variables",  #<- add title and subtitle
       subtitle = "Boxplot of scaled data")

# View updated plot.
boxplots_norm


#=================================================-
#### Slide 28: Exercise 1  ####




#=================================================-
#### Slide 32: Set up: transform data for scatterplot  ####

CMP_subset_long2 = CMP_subset %>%
  gather(BiologicalMaterial01:ManufacturingProcess03, #<- gather all variables but `Yield`
         key = "variable",                            #<- set key to `variable`
         value = "value") %>%                         #<- set value to `value`
  # All other transformations we've done before.
  mutate(variable = str_replace(variable, "Biological", "Bio ")) %>%
  mutate(variable = str_replace(variable, "Manufacturing", "Man. ")) %>%
  mutate(variable = str_replace(variable, "0", " ")) %>%
  group_by(variable) %>%
  mutate(norm_value = value/max(value, na.rm = TRUE))

# Inspect the data.
head(CMP_subset_long2)


#=================================================-
#### Slide 33: Set up & link: normalized data base plot  ####

# Create a base plot.
base_norm_plot = ggplot(data = CMP_subset_long2,  #<- set data 
                        aes(x = norm_value,       #<- set x-axis to represent normalized value
                            y = Yield,            #<-   y-axis to represent `Yield` 
                            color = variable)) +  #<- set color to depend on `variable`
                        my_ggtheme                #<- set theme

base_norm_plot


#=================================================-
#### Slide 34: Set up & adjust: normalized data scatterplot  ####

# Create a scatterplot.
scatter_norm = base_norm_plot +        #<- base plot
               geom_point(size = 3,    #<- add point geom with size of point = 3
                          alpha = 0.7) #<-  make it 70% opaque

# View updated plot.
scatter_norm


#=================================================-
#### Slide 35: Adjust: add density geom to scatterplot  ####

# Adjust scatterplot to include 2D density.
scatter_norm = scatter_norm +              #<- previously saved plot
               geom_density2d(alpha = 0.7) #<- add 2D density geom with 70% opaque color

# View updated plot.
scatter_norm


#=================================================-
#### Slide 36: Adjust: wrap scatterplots in facets  ####

# Wrap each scatterplot into a facet.
scatter_norm = scatter_norm +                   #<- previously saved plot
               facet_wrap(~ variable, ncol = 3) #<- wrap plots by variable into 3 columns


#=================================================-
#### Slide 37: Adjust: wrap scatterplots in facets (cont'd)  ####

# View updated plot.
scatter_norm


#=================================================-
#### Slide 38: Adjust & polish: legends and text in scatterplot  ####

# Add finishing touches to the plot.
scatter_norm = scatter_norm +                        #<- previously saved plot
  guides(color = FALSE) +                            #<- remove legend for color mappings
  theme(strip.text.x = element_text(size = 14)) +    #<- increase text size in strips of facets
  labs(title = "CMP data: Yield vs. other variables",#<- add title and subtitle
       subtitle = "2D distribution of scaled data")

# View updated plot.
scatter_norm


#=================================================-
#### Slide 42: Saving plots: export to PNG (cont'd)  ####

setwd(plot_dir)
png("CMP_boxplots_norm.png", width = 1200,
    height = 600,
    units = "px") boxplots_norm
dev.off()


setwd(plot_dir)
png("CMP_scatterplot_norm.png",
    width = 1200, 
    height = 600, 
    units = "px")
scatter_norm
dev.off()

#=================================================-
#### Slide 45: Saving plots: export to PDF (cont'd)  ####

# Set working directory to where you want to save plots.
setwd(plot_dir)

pdf("CMP_plots.pdf", #<- name of file
    width = 16,      #<- width in inches
    height = 8)      #<- height ...

boxplots_norm        #<- plot 1
scatter_norm         #<- plot 2

dev.off()            #<- clear graphics device


#=================================================-
#### Slide 47: Exercise 2  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
