# The following is a brief introduction on how to install the reticulate package 
# in RStudio so that you can integrate Python libraries into the IDE (workspace) 
# that shares code with R. This will enable you to eventually knit everything 
# together with R and Python into one neat looking RMarkdown document.

# The importance of determining and setting (correctly) the working directory 
# cannot be stressed enough. Obtain the path to the working directory by running
# the getwd() function. Set the working directory by running the setwd("...") 
# function, filling the parentheses inside with the correct path.

getwd() 
setwd()

# To install specific packages, it is equally important to ensure to set the 
# working directory to where base R is installed. In the console window, 
# install the reticulate package by entering and running the following code using
# the install.packages() R syntax:

install.packages("reticulate")

# Using the reticulate package from R to install python libraries 

# The reticulate library allows us to install python packages in RStudio. However, 
# to do that successfully, the syntax for calling the installation will change 
# from install.packages() to py_install(). # Load in the reticulate library and 
# enter a new command for making a pandas (python) package installation through 
# the library as follows:

library(reticulate)
py_install("pandas")

# Create an R Markdown file 
# Navigate to the "File" menu up top, click on "New File," follow by "R Markdown."

# The following window will pop-up, prompting you to save the file according to 
# various selections. Go ahead and name. In this case, an example title is set to 
# "Reticulate_Demo." The author field can either be filled in or left blank, and 
# it is best to select the "HTML" radio button since knitting (compiling) the 
# outputs between PDF and HTML can always be switched between at a later time. 
# Go ahead and click "OK."

# Using R to Read-In and Examine a Dataset

# Initiate an R code chunk.
# Load the reticulate library

library(reticulate)

# Read in an example dataset into R using the ``read.csv("...", sep=";") function. 
# This specific dataset is semicolon delimited, so the semicolon separator needs 
# to be contained within the function. Assign the dataset to a dataframe called 
# "white_wine." In R, it is best practice to use the left arrow<-` for assignment 
# statements.

url="https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv"
white_wine <- read.csv(url, sep=";")

# Inspect the first six rows of the dataset by using the head() function. 
# You should see a variety of properties (variables) associated with white wines. 
# This is one "sanity" check for ensuring that the dataset was correctly read in.

head(white_wine)

# Using Python to Read-In and Examine a Dataset

# Initiate a Python code chunk.

# Load the pandas library in Python. Read in the same dataset into Python using 
# the pd.read_csv("...", sep=";") function. Once again, assign the dataset to a 
# dataframe called "white_wine." In Python, the equals sign = is used for 
# assignment statements.

import pandas as pd
white_wine = pd.read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/\
wine-quality/winequality-white.csv",sep=";")

# Inspect the first five rows of the dataset by using the df.head() function 
# where df is your white_wine dataframe. You should see a variety of properties 
# (variables) associated with white wines. This is one "sanity" check for ensuring 
# that the dataset was correctly read in.

white_wine.head()