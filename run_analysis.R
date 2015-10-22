print("Set Directory and loading packages")
#setwd("./Data")
datadir <- "Data"
library(dplyr)
#library(data.table)
#library(tidyr)

print("Getting Training Data - STEP 1")
trdfile <- paste(datadir, "/train/X_train.txt", sep = "")
# Get the Training Data
train_x <- read.table(trdfile)
trdyfile <- paste(datadir, "/train/y_train.txt", sep = "")
train_y <- read.table(trdyfile)
trsubfile <- paste(datadir, "/train/subject_train.txt", sep = "")
train_subject <- read.table(trsubfile)
#Cleanup
rm(trdfile)
rm(trdyfile)
rm(trsubfile)

print("Getting Testing Data - STEP 1")
# Get the features from the files
tstfile <- paste(datadir, "/test/X_test.txt", sep = "")
test_x <- read.table(tstfile)
tstyfile <- paste(datadir, "/test/y_test.txt", sep = "")
test_y <- read.table(tstyfile)
tstysubfile <- paste(datadir, "/test/subject_test.txt", sep = "")
test_subject <- read.table(tstysubfile)
#cleanup
rm(tstfile)
rm(tstyfile)
rm(tstysubfile)

# Read the features
featuresfile <- paste(datadir, "/features.txt", sep = "")
features <- read.table(featuresfile)

# Read the activity labels
activityfile <- paste(datadir, "/activity_labels.txt", sep = "")
activity_labels <- read.table(activityfile)
#Cleanup
rm(featuresfile)
rm(activityfile)

print("Merging data - STEP 1")
# Join the data 
join_data <- rbind(train_x,test_x)
join_labels <- rbind(train_y,test_y)
join_subjects <- rbind(train_subject,test_subject)

# Set the names of the columns from the features vector
names(join_data) = features[[2]]
# Add the new column names for the activity and subjects
names(join_labels) = c("activityid")
names(join_subjects) = c("subjects")

print("Extracting mean columns for train data  - STEP 2")
# Get the mean and std() variables to be used in STEP 4
means_cols <- grep("mean",features[[2]])
std_cols <- grep("std",features[[2]])
merged_cols <- unique(c(means_cols,std_cols)) ## Make sure we don't have duplicates

# Extract relevant joined data from the indices 
cols_join_data <- join_data[merged_cols]

print("Apply activity descriptive names to activities  - STEP 3")
# Update Column names
names(activity_labels) = c("activityid","activityname")

# Substitute the IDs with the merge function 
activities <- merge(activity_labels,join_labels,"activityid")

#Now join subject and activities with merged data set
cols_join_data$activities <- activities[[2]]
cols_join_data$subjects <- join_subjects[[1]]

print("Re-label variable names - STEP 4")
#STEP 4
# Clean up the variable names by removing characters as per Hadley Wikham 
names(cols_join_data) <- gsub("\\(\\)","",names(cols_join_data))
#names(cols_join_data) <- gsub("std","Std",names(cols_join_data))
#names(cols_join_data) <- gsub("mean","Mean",names(cols_join_data))
names(cols_join_data) <- gsub("-","",names(cols_join_data))
names(cols_join_data) <- gsub('Acc',"Acceleration",names(cols_join_data))
names(cols_join_data) <- gsub('GyroJerk',"AngularAcceleration",names(cols_join_data))
names(cols_join_data) <- gsub('Gyro',"AngularSpeed",names(cols_join_data))
names(cols_join_data) <- gsub('Mag',"Magnitude",names(cols_join_data))
names(cols_join_data) <- gsub('^t',"Timedomain",names(cols_join_data))
names(cols_join_data) <- gsub('^f',"Frequencydomain",names(cols_join_data))
names(cols_join_data) <- gsub('\\.mean',"Mean",names(cols_join_data))
names(cols_join_data) <- gsub('\\.std',".StandardDeviation",names(cols_join_data))
names(cols_join_data) <- gsub('Freq\\.',"Frequency.",names(cols_join_data))
names(cols_join_data) <- gsub('Freq$',"Frequency",names(cols_join_data))

# Create the aggregate data set - Calcualte the Mean - STEP - 5
print("Aggregate and Writing Tidy data to file - STEP 5")
second_set_data <- aggregate(cols_join_data, by=list(activity = cols_join_data$activities, subject=cols_join_data$subjects), mean)
#Clean-up data sets
rm(activities)
rm(activity_labels)
rm(features)
rm(join_data)
rm(join_labels)
rm(join_subjects)
rm(test_subject)
rm(test_y)
rm(test_x)
rm(train_subject)
rm(train_y)
rm(train_x)
rm(means_cols)
rm(std_cols)
rm(merged_cols)
rm(datadir)
# write to file
write.table(cols_join_data, "tidydata.txt")
write.table(second_set_data,"avg_tidydata.txt",row.name=FALSE)
#print("Resetting working directory")
#setwd("~/Research/Courses/Getting and Cleaning Data/Course project")