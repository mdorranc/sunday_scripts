# This is a script to explore the gapMinder data using R
# Matt Dorrance
# matt.dorrance@gmail.com
# April 19, 2015

# Installing needed Packages and dependencies
# Comment out items already installed there are more elegant ways to do this
# install.packages("dplyr", dependencies = TRUE)

# Loading any non-standard required packages
library("dplyr")

# Main Body of Code

#Read in data as tab-delimted
gap.in <- read.table("output/combined_gapMinder.tsv", 
                     sep = "\t", 
                     header = TRUE)
for (row.number in 1:10){
  for (column.number in 1:5){
    print (gap.in[row.number, column.number])
  }
 }

#Equivalent in one line
gap.in[1:10,1:5]

#How to create a custom function called add.me that adds two arguments
add.me <- function(arg1,arg2){
    arg1+arg2
}

add.me(17, 12)

# Working with functions in dplyr such as filter
gap.in %>%
  filter(pop>15000000) %>%
  select(country, year, pop) %>%
  group_by(country) %>%
  summarize(min = min(pop))

# Challenge
# Calculate the mean population per continent per year from years 
# across all years prior to 1990

gap.in %>%
  filter(year<1990)%>%
  select(continent, year, pop) %>%
  group_by(continent) %>%
  summarize(mean = mean(pop))

# If things are truncated in the console you can use use.data.frame

# Talking about tidy data
data(iris)
attach(iris)

# installed package tidyr - then commented out when done
#install.packages("tidyr", dependencies = TRUE)

# Putting tidyr into the library
library ("tidyr")

# This took the iris data and took it from a wide data collection and moved
# it to a long data set.
iris.long <-gather(iris, "Measurement", "Value", 1:4)

