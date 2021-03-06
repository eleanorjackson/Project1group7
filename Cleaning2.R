---
title: "Task 2 markdown"
output: html_document
---

# Call in dplyr so that later on we can use mutate

library(dplyr)

# Make sure you are in the correct folder in which the data is being held 

setwd("/Users/ellie/Desktop/Data Cleaning Project/Task 2")


setwd("./Data Cleaning Project")
setwd("./Task 2")

# Seeing what files are in the folder Task 2
list.files()

# creating variable assignment for the Panel data
DataT2 <- "Panel_8595.Txt"

# Creating a table with column titles N1, ... F2 

DataT2table <- read.table(DataT2, skip = 2, col.names = c("N1", "N2", "N3", "Y1", "Y2", "Y3", "X1", "X2", "X3", "X4", "X5", "F1", "F2"), skipNul = TRUE)


#Focusing just on the year 1987 so that we can figure out the names of each of the variables 

DataT2table87<- subset(DataT2table, N3 == 87)

#Useing Standard deviation in the year 1987 of each variable in order to figure out the name of the variable 

sd(DataT2table87$Y1)

# We know Y1 is Electricity mesured in kWh, we need to convert this to kWh millions 


sd(DataT2table87$Y2)

# We know then that Y2 is SO_2, units short ton


sd(DataT2table87$Y3)

# We know Y3 is NO_x, measured in short tons 

sd(DataT2table87$X1)

# We know X1 is capital stock, measured in millions $

sd(DataT2table87$X2)
 
# We know X2 is number of Employees, measured in workers


sd(DataT2table87$X3)

# We know X3 is Heat content of coal, measured in billions btu 

sd(DataT2table87$X4)

# We know X4 is Heat content of oil, measured in billions btu 

 sd(DataT2table87$X5)

# We know X5 is heat content of gas, measured in billions btu 

# Creating a variable that contains the string of variable names to implement later on in our creation of the data table 

Variable_names <-c("Plant_ID", "N2", "Year", "Electricity", "S02_short_tons", "NOx_short_tons", "Capital_Stock_USD1973", "Employees_People", "Heat_content_of_coal_btu", "Heat_content_of_oil_btu", "Heat_content_of_gas_btu", "F1", "F2")

# Creation of new data table with correct labelings for variable names 
DataT2table1 <- read.table(DataT2, skip = 2, col.names = Variable_names,  skipNul = TRUE)

# Take a look at the top of the data table
head(DataT2table1)


# Creating a new variable with only desired variable names  

Variable_Names_clean <- c("Plant_ID", "Year", "Electricity", "S02_short_tons", "NOx_short_tons", "Capital_Stock_USD1973", "Employees_People", "Heat_content_of_coal_btu", "Heat_content_of_oil_btu", "Heat_content_of_gas_btu")

#Creating a new data table with only desired columns 

DataT2table2 <- select(DataT2table1, Variable_Names_clean)

# Take a look at new data fram DataT2table2

head(DataT2table2)

# Redefine large numerical variables so that it is easier to read

DataT2table3 <- mutate(DataT2table2, Electricity_kWh = Electricity/ 10^6, Capital_Stock_USD1973_millions =  Capital_Stock_USD1973/ 10^6, Heat_content_of_coal_billions_btu =  Heat_content_of_coal_btu / 10^9 , Heat_content_of_oil_billions_btu = Heat_content_of_oil_btu/ 10^9, Heat_content_of_gas_billions_btu = Heat_content_of_gas_btu / 10^9)

#take a look at it 

head(DataT2table3)

#New variable with proper labeling 

Variable_Names_clean1 <- c("Plant_ID", "Year", "Electricity_kWh", "S02_short_tons", "NOx_short_tons", "Capital_Stock_USD1973_millions", "Employees_People", "Heat_content_of_coal_billions_btu", "Heat_content_of_oil_billions_btu", "Heat_content_of_gas_billions_btu")


#New data table CleanData with only the easier to read labels 

CleanData <- select(DataT2table3, Variable_Names_clean1)


#take a look at it 

head(CleanData)

#Creating a new data table that has converted heat data (daily Mwh) 

DailyAverages <- mutate(CleanData, Heat_content_of_gas_Mwh_daily = Heat_content_of_gas_billions_btu* 0.293297222 / 365, Heat_content_of_oil_Mwh_daily = Heat_content_of_oil_billions_btu * 0.293297222/ 365 , Heat_content_of_coal_Mwh_daily = Heat_content_of_coal_billions_btu * 0.293297222/ 365, S02_short_tons_daily = S02_short_tons / 365 , NOx_short_tons_daily = NOx_short_tons/ 365)

#take a look 

head(DailyAverages)

#Creating new variable with daily cleaned labels 

Variable_Daily_Avgs_Clean <- (c("Plant_ID", "Year", "Electricity_kWh", "S02_short_tons_daily", "NOx_short_tons_daily", "Capital_Stock_USD1973_millions", "Employees_People", "Heat_content_of_coal_Mwh_daily", "Heat_content_of_oil_Mwh_daily", "Heat_content_of_gas_Mwh_daily"))

#Creation of new data frame with only desired labels 

CleanData1 <- select(DailyAverages, Variable_Daily_Avgs_Clean)

#take a look 

head(CleanData1)

#New data table with Capital Stock represented in 2017 US dollars 

DailyAverages_with_2017dollars <- mutate(DailyAverages, Capital_Stock_USD2017_millions = Capital_Stock_USD1973_millions * 5.68)

#Take a look 

head(DailyAverages_with_2017dollars)

#Creation of new Data table with new label/ column that tells reader if the Clean Air Act Phase I had been implemented

DailyAverages_Clean_Air_Act_2017USD <- mutate(DailyAverages_with_2017dollars, Clean_Air_Act_PhaseI = ifelse(Year > 89, "1", "0"))
 
#Take a look 

head(DailyAverages_Clean_Air_Act_2017USD)
tail(DailyAverages_Clean_Air_Act_2017USD)

write.table(DailyAverages_Clean_Air_Act_2017USD,"tidy2.txt")

#Shows where Clean Air Act Phase I distinction was made 

DailyAverages_Clean_Air_Act_2017USD[450:500,]
