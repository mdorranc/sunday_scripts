# This is a script to explore the gapMinder data using R
# Matt Dorrance
# matt.dorrance@gmail.com
# April 19, 2015

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

