TidyDataProject
===============

This repo contains the Project for the Getting and Cleaning Data course of the Data Science Specialization on coursera.

run_analysis.R is a program that
1.Merges the training and the test sets to create one data set which are present in the directory UCI HAR Dataset.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
2a. do step 2 for the test variables during step 1
2b. do step 2 for the train variables during step 2
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

supporting documents:
Code book: Description of the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md
ReadMe.md: which is this file
Tidy data textfile:  “tidydataproject.txt”

run_analysis.R will load the namespace of the packages used within the program
library(dplyr)
library(tidyr)
library (gdata)
library (Hmisc)
library(qdap)
library(data.table)

STEP 1: Merge the training and the test sets to create one data set.
1A. Read all the relevant test files (subject_test.txt, X_test.txt and Y-test.txt  as they have the same number of observations) into subjectstest, testmeasurements and testactivities dataframes respectively and cbind them together into testdf data frame. This is done in several steps:

Read the MEASUREMENTS from the features.txt file for use to extract data (as you will need this data to extract the mean and std columns)
Read the subjects from the subject_test.txt file
Read the measurements from the X_test.txt file
Read the activities from the Y_test.txt file
Create dataframe for the 'test' subjects, measurements and activities by combining subjectstest,testactivities,testmeasurements the subjects and activities are fixed values and therefore in the beginning of the dataframe followed by the measured values


1B. Read all the relevant training files (subject_train.txt, X_train.txt and Y-train.txt  as they have the same number of observations)
into subjectstrain, trainmeasurements and trainactivities dataframes respectively and cbind them together into traindf data frame

Read the subjects from the subject_train.txt file subjectstrain is table with the fixed values of which subjects were measured for train
Read the measurements from the X_train.txt file
Read the activities from the Y_train.txt file
Create dataframe for the 'train' subjects, measurements and activities by combining subjectstrain,trainactivities,trainmeasurements the subjects and activities are fixed values and therefore in the beginning of the dataframe followed by the measured values

1C Lastly, rbind the testdf and traindf together into a data.frame total data


STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement, is incorporated into the steps 1A and 1B when reading in the measurents for test and train respectively.

Turn the totaldata data.frame into data.table to make functionality of the file better.


STEP 3. Uses descriptive activity names to name the activities in the data set

Change the numeric values of the Activity variable into proper labels, as specified in the activitylabels data.frame by  substituting the original column values with the ones in activity labels according to their cross-referencing

STEP 4. Appropriately labels the data set with descriptive variable names. 
4a. extract the 'MEAN' and 'STD' measurement names from measurements table

4b. make the measurements into VALID AND MEANINGFUL COLUMN NAMES for R
by looking for unique names, taking out any punctuations, using caps for the first letter of each meaningful word or abbreviation, and substituting t and f for time and frequency respectively

4c.Name the first two columns subject and activity (fixed variables) using the setnames() function

4d.Name the rest of the columns which contain the measurements with the new variable names coming from the varnames vector


STEP 5.From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

I took every measurement mean/std to be a different variable as they indicate something completely different me. Therefore resulting in a wide format.

Write a textfile to your working directory with the tidydata using row.names = FALSE as per instructions, so the textile is in the right format which would be uniform for assignment evaluation purposes.

The output of this textfile can be viewed in tidydataproject.txt.

