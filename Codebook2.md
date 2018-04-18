---
title: "CodeBook2"
author: "Tflorinn"
date: "17 April 2018"
output: html_document
---
Codebook for the Task 2: 
Data : 
DataT2table --> getting the data for DataT2 to create a table and add some collumn titles 
DataT2table87 --> it is a focuse of the years 1987 from the table DataT2table to figure out name of variable 
DataT2table1 --> new table with a correct label for the names  using the value from DataT2 and VAriable_names
DataT2table2 --> new table using the value from DataT2table1 and Variable_Names_clean so using the new clean names variable
DataT2table3 --> using some data from DataT2table2 and redefinning the names to make it easier to read 
CleanData --> still cleaninig the data using the data from DataT2table3 and Variable_NAmes_clean1
DailyAverages --> using data from CleanData and convert them into a daily averages of Mwh
CleanData1 --> using the data from DailyAverages and associate it with the new label from Variabe_Daily_Avgs_Clean
DailyAverages_with_2017dollars --> using the data from DailyAvverages and convert the capital sotck in 2017 US dollars
DailyAverages_Clean_Air_Act_2017USD --> this is using data from DailyAverages_with_2017dollars and we are adding a colums to this table that gone a tell us if the Clean Air Act Phase I has been implemented. 



Values : 
DataT2 --> contain the panel data "Panel_8595.txt"
variable_names --> contains all the string of variable name 
Variable_Names_clean --> just contain all the vriable namas that we want to use
Variable_NAmes_clean1 --> update of the names with the correct labeling 
Variable_Daily_Avgs_Clean --> this contain the the daily cleaned labels 

