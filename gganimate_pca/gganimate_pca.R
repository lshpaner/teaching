# Animated Principal Component Analysis (PCA) in R

# Requisite packages and libraries for this task in RStudio

install.packages("devtools")
library(devtools)
install_github("kassambara/factoextra")
install.packages("gganimate")

# Load the necessary libraries.

library(factoextra)
library(gganimate)

# Read in the iris flower dataset by calling data(iris) and inspect it with head(iris)

data(iris)
head(iris)

# Principal Component Analysis (PCA) is a dimensionality reduction/ feature 
# selection technique aimed at increasing the comprehensibility of a model with 
# a goal of minimizing information loss in the process. Create a variable to 
# perform Principal Component Analysis (PCA) and name it res.pca, assigning it 
# to only the numerical columns (negating the last one). Ensure to normalize the
# data by scaling it.

res.pca <- prcomp(iris[, -5],  scale = TRUE)

# Each principal component carries with it a percentage of variance that it 
# accounts for in the model. Create a new variable to measure variance explained 
# and assign it to var_explained. Note Keep in mind that this next line will be 
# useful for subsequent renditions of PCA involving other datasets.

var_explained <- round(res.pca$sdev^2/sum((res.pca$sdev)^2)*100, 4)

# Obtain the eigenvalues of the PCA function using get_eig()

get_eig(res.pca)

# Create a visualization function using fviz_eig(), parse in the relevant parameters, 
# and store it in a new dataframe fviz.

fviz <- fviz_eig(res.pca, addlabels = TRUE, ggtheme=theme_classic())+
  geom_line(size=1, color="blue")

# This step finally leverages gganimate() to add animation to the visualization. 
# Add the fviz dataframe to the transition effect transition_reveal(), ensuring 
# to correct the animation direction by making the transition a function of a 
# sequence along the explained variance var_explained. Assign this to a new 
# dataframe animated.

animated <- fviz + transition_reveal(seq_along(var_explained))

#  the scree plot visualization by calling animate on the animated dataframe, 
# parsing in a suitable renderer, height, and resolution parameters.

animate(animated, renderer = gifski_renderer(), width = 1200, height=550, res=150)

