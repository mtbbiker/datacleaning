---
title: "Codebook"
author: "Eugene Terblanche"
date: "2015-10-19"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project creates a subset of the training and testing data that was recorded from the experiment to record activity data for 30 subjects. The Signal data was ignored as the project only requires that the measured data should be cleaned and presented.

##Study design and data processing

###Collection of the raw data
The initial raw data was collected from the Accelerometer and gyroscope from subjects (19-48 years) wearing a smartphone (samsung Galaxy SII). Each person performed the following activities:
1. Walking.
2. Walking a flight od stairs.
3. Walking down a flight of stairs.
4. Sitting stationary
5. Laying down

The dataset created by this project is a combination (merged) set of the testing and the training data.

###Notes on the original (raw) data 
The original data sample was grouped in a training (70%) and a test set (30%). The orginal Signal data is omitted for this project as we are only interested in the measured data. 

##Creating the tidy datafile

###Guide to create the tidy data file
The following steps were completed:
1. The data set was downloaded from the link provided. The data was extracted to a newly created Project Directory.
2. R Studio was used to create a Project and an R script in this directory. The working directory was set to the project directory.
3. An R file to extract and tidy the data was created and named "run_analysis.R"
4. Running the run_analysis completes STEP 1 - STEP 5 as per the project requirement.
5. The script merges, and cleans the data and writes the data to a new file - "tidydata.txt"

###Cleaning of the data
1. The script start by setting the Data directory to where the data was extracted.
2. The libraries used in this script to tidy the data are loaded (dplyr, data.table, tidyr)
3. The "features.txt" file is loaded in a dataset(features) - This produces a table with a list of all the variables.
4. Processing is done on the features to clean and rename the variable names (Create new labels)
5. The training dataset is then created by reading the "X_train.txt" and the "features" table is used as the column names. The Readme file was here used that states that each column is the "X_train.txt" corresponds to a variable as in the featues table.
6. The training activity table was created by reading the "y_train.txt" file. According to the ReadMe file from the original dataset this is the Activity for each measurement in the "X_train.txt" file. The column name was changed to activity.
7. The activity values were replaced by the Activity Labels: ('Walking','Walking up stairs', 'Walking down stairs', 'Sitting', 'Standing', 'Laying') in the activity dataset. This is STEP 3 from the project requirement
8. The train subject data set was created, this is a list of the corresponding subject to the corresponding measurement. The column name was changed to "subject" This is STEP 4 from project requirement
9. The trainning data set was created by selecting only the variables that is either a mean or a standard deviation
10. The Activity and Subject data was now "merged" with the training data by mutating the training dataset.
11. A data table ("DTT") is then created from this mutated data set.
12. Step 8 to 14 is then repeated for the 'test' data. Using the "test/X_test.txt" and "test/y_test.txt" and "test/subject_test.txt" files. A data table DTest is then created.
13. The DTT and DTest tbales are then combined as per STEP 1 from project requirement.
14. STEP 5 from the project requirement is then completed by averaging each variable and writing the result to a text file. "tidydata.txt"

##Description of the variables in the tidydata.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
https://thoughtfulbloke.wordpress.com/tag/getting-and-cleaning
http://vita.had.co.nz/papers/tidy-data.pdf


