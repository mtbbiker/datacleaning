print("Set Directory and loading packages")
setwd("~/Research/Courses/Getting and Cleaning Data/Data")
library(dplyr)
library(data.table)
library(tidyr)

print("Getting Training Data")
#Create a list of the Features to be used as col names
trainfeatures<- read.csv("features.txt",header = FALSE,sep = "",stringsAsFactors = FALSE)
#Import the data and add the column names
mytrain <- read.csv("X_train.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = trainfeatures[,2])
#y-train and the labels from activity labels needs to be joined
mytrainactivity <- read.csv("y_train.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = c("activity"))
#Subject_train is the person linked to test data, link that to the mydata
personstrain <- read.csv("subject_train.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = c("subject"))

#What about fread()
#Mutate
#alldata <- mutate(persons,mytrain$activity)
#sdata <-mutate(mytrain[,c(1:3)], subject = personstrain$subject , activity =  mytrainactivity$activity)
print("Extracting mean columns for train data")
mytrain <- select(mytrain,contains("mean"))
sdata <-mutate(mytrain, subject = personstrain$subject , activity =  mytrainactivity$activity)


DTT <- data.table(sdata)


#To join the train and test table, both DF needs to become DT, each witk a key column
#setkey(DTT,subject)
#tables()

print("Getting Testing Data")
#Create a list of the Features to be used as col names
testfeatures<- read.csv("features.txt",header = FALSE,sep = "",stringsAsFactors = FALSE)
#Import the data and add the column names
mytest <- read.csv("test/X_test.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = testfeatures[,2])
#y-train and the labels from activity labels needs to be joined
mytestactivity <- read.csv("test/y_test.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = c("activity"))
#Subject_train is the person linked to test data, link that to the mydata
personstest <- read.csv("test/subject_test.txt",header = FALSE,sep = "",stringsAsFactors = FALSE,col.names = c("subject"))

#What about fread()
#Mutate
#alldata <- mutate(persons,mytrain$activity)
print("Extracting mean columns, for test data")
mytest <- select(mytest,contains("mean"))
stestdata <-mutate(mytest, subject = personstest$subject , activity =  mytestactivity$activity)


DTest <- data.table(stestdata)


l = list(DTT,DTest)
print("Combining Testing and Traing Data")
DTResult <- rbindlist(l)
#Only get mean and std from table to be used
#DTResult <- select(DTResult, tBodyAcc.mean...X,tBodyAcc.mean...Y,tBodyAcc.mean...Z, )

#Only show Columns with mean in to be replaced with Tidy data functions (see swirl tut)

#Tidy data satisfies three conditions:
# 1) Each variable forms a column
# 2) Each observation forms a row
# 3) Each type of observational unit forms a table

#res <- select(DTResult,contains("mean"))
#Complete Step 5 by creating a 2nd data set with the average of each variable


#Write the Data to text file to be submitted 
print("Writing Tidy data to file")
write.table(DTResult,"tidydata.txt",row.names = FALSE)
#Set the Path again
print("Resetting working directory")
setwd("~/Research/Courses/Getting and Cleaning Data/Course project")
