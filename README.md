---
title: "README"
author: "Matthew Parra"
date: "April 17, 2018"
output: html_document
---

## tidy1.txt: This file contains the results from an experiment of movements performed with a Samsung Galaxy on the waist.  Thirty participants performed the actions of standing, walking, walking upstairs, walking downstairs, sitting, and laying while velocities in multiple directions were taken.  
##Original files were separated into two training and two test datasets with variable titles separated.
##We merged the x_test, x_train, y_test, and y_train datasets into one dataset.
##We transposed labels to describe the columns and rows in the dataset
##Trimmed the table to only include the mean and standard deviation of each variable
##Renamed activity labels with descriptive names
##grouped all data by subject and activity

##tidy2.txt: This file contains data from 92 coal fired plants from 1985 to 1995.
##The plants had one good output, net electrical generation, and two bad outputs, sulfur dioxide and nitrogen oxides
##The inputs consisted of capital stock, number of employees, and heat content of coal, gas, oil
##We converted all energy measurements and daily pollutants into daily averages
##We converted the dollars measured in 1973 to 2017 dollars 
##Additionally we added a factor variables to indicate whether or not the CAA Phase I of the Clean Air Act had been announced or not

##tidy2_a.txt:This file averaged all the variables across all the years for each plant for the 11 year period using the aggregate function
##tidy2_b.txt: This file aggregated all variables within a particular year across all 92 plants using the aggregate function 