---
title: "Codebook"
author: "Eugene Terblanche"
date: "2015-10-19"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project creates a subset of the training and testing data that was recorded from the experiment to record activity data for 30 subjects. "This describe how a tidy data set was created"

##Study design and data processing

###Collection of the raw data
The initial raw data was collected from the Accelerometer and gyroscope from subjects (19-48 years) wearing a smartphone (samsung Galaxy SII). Each person performed the following activities:
1. Walking.
2. Walking a flight od stairs.
3. Walking down a flight of stairs.
4. Sitting stationary
5. Laying down

The original data sample was grouped in a training (70%) and a test set (30%). The orginal Signal data is omitted for this project as we are only interested in the measured data. The dataset created by this project is a combination (merged) set of the testing and the training data.

###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
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
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
