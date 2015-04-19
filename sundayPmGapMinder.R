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

# Begin Final Project 
# The countries we are going to look at are China, Canada and Cuba

# Section 1  Make three scatter plots, 
#  one for each country that have year on the x-axis and GDP on the y Axis.  
#  Make sure you load all the libraries you might need.
#  Describe what you see in the results using markdown text.

#  Load libraries
library ("dplyr")

#  Load Data from the file

gap.in <- read.table("output/combined_gapMinder.tsv", 
                     sep = "\t", 
                     header = TRUE)

#  China, Canada, Cuba Let's make a dataset for each with the year and GDP

gap.in %>%
  filter(country=="China") %>%
  select(year, gdpPercap) -> China

gap.in %>%
  filter(country=="Canada") %>%
  select(year, gdpPercap) -> Canada

gap.in %>%
  filter(country=="Cuba") %>%
  select(year, gdpPercap) -> Cuba

# Now that we have the data wrangled, let's do 3 scatter plots for each item

plot(China$year, China$gdpPercap, xlab="Year",ylab="GDP", 
       main="China GDP per Year", 
       col="green", lwd=2, type="p")

plot(Canada$year, Canada$gdpPercap, xlab="Year",ylab="GDP", 
     main="Canada GDP per Year", 
     col="green", lwd=2, type="p")

plot(Cuba$year, Cuba$gdpPercap, xlab="Year",ylab="GDP", 
     main="Cuba GDP per Year", 
     col="green", lwd=2, type="p")
