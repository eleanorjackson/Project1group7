---
title: "Task 1 "
output: pdf_document
---

#First we convert the activity labels into a data table 

Labels <- "activity_labels.txt"
Labels1 <- read.table(Labels)

# Next we convert all the traning and test data into data tables with the y-test and y-training with variable names Activity 

X_train <- "X_train.txt"
Y_train <- "y_train.txt"

X_test <- "X_test.txt"
Y_test <- "y_test.txt"

X_traint <- read.table(X_train)
Y_traint <- read.table(Y_train, col.names= "Activity")

X_testt <- read.table(X_test)
Y_testt <- read.table(Y_test, col.names= "Activity")

#Convert subject data into data tables with Variable name Subject
S_train<- "subject_train.txt"
S_test <- "subject_test.txt"

S_traint <- read.table(S_train, col.names = "Subject" )
S_testt<- read.table(S_test, col.names = "Subject")

#Convert Variable names into a data table and transpose it so we have 2 rows instead of 2 columns 
Variable <- "features.txt"
Variablet <- read.table(Variable)
Variablet1 <-t(Variablet)

#Make row 2 the column names for the data table 
colnames(Variablet1) =Variablet1[2, ]

#get rid of first and second row in Variable data table so that all we have is the variable names/ column names 
Variablet1 <- Variablet1[-1: -2,]


# combine all the data frames together by row so that we have equal rows in all new data tables created 
y1 <- rbind(Y_traint, Y_testt)
y2 <- rbind(X_traint, X_testt)
y3 <- rbind(S_traint, S_testt)

# combine the data with the variable names and then make the variable names once again the column names and remove them from the data 
table1 <- rbind(Variablet1, y2)
colnames(table1) = table1[1, ]

table2 <- table1[-1, ]

#create a variable with the strings "mean"" and "std"" 

string <- c("mean", "std")

# create a new table with only the variable names that contain "mean"" or "std"" 
select_col <- table2[ grep(paste("mean", "std", sep = "|"), colnames(table2))]  

# Add the Activity and Subject columns to the data table 
table3 <- cbind(y1, select_col)

table4 <- cbind(y3, table3)

#rename all the Activity numbers by their corresponding names 
table4$Activity[table4$Activity ==1] <-"Walking" 
table4$Activity[table4$Activity == 2] <- "Walking_upstairs"
table4$Activity[table4$Activity == 3] <- "Walking_downstairs"
table4$Activity[table4$Activity == 4] <- "Sitting"
table4$Activity[table4$Activity == 5] <- "Standing"
table4$Activity[table4$Activity == 6] <- "Laying"

# Make column 1 and 2 characters and 3:81 numeric 
y5 <- sapply(table4[,1:2], as.character)

y6 <- sapply(table4[,3:81], as.numeric)

# combine two data sets into 1 
table6 <- cbind.data.frame(y5, y6)

#group by Subject and Activity 
subject <- group_by(table6, Subject, add = T)

Activity <- group_by(subject, Activity, add = T)

#Create table with means of all the data 
mean2 <- summarise_all(Activity, funs(mean))

write.table(mean2, file= "tidy1.txt")

          

 


