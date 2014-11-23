
Assumptions before running the code:
===============================

This code assumes that the respective files used in this program are present in the working directory where this program is run. Make sure therefore that before you run this program you have a directory in your working directory named “UCI HAR Dataset” with all the relevant files in it: features.txt, activity_labels.txt, and 2 directories: test (with files: subject_test.txt, X_test.txt, Y_test.txt) and train (with files: subject_train.txt, X_train.txt, Y_train.txt)
 
Subjects:
======
There were 30 subjects for this data, each given a unique number from 1:30.

Activities:
=======
There were 6 activities for this data analysis as specified in activity_labels.txt (in working directory), but just for the purpose of this exercise, they are walking, walking_upstairs, walking_downstairs, sitting, laying and standing.

Feature Selection 
=============

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAccXYZ and tGyroXYZ. These ‘time’ domain signals (prefix ‘time’) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccXYZ and timeGravityAccXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkXYZ and timeBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAccXYZ, freqBodyAccJerkXYZ, freqBodyGyroXYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the ‘freq’ to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccXYZ
timeGravityAccXYZ
timeBodyAccJerkXYZ
timeBodyGyroXYZ
timeBodyGyroJerkXYZ
timeBodyAccMag
timeGravityAccMag
timeBodyAccJerkMag
timeBodyGyroMag
timeBodyGyroJerkMag
freqBodyAccXYZ
freqBodyAccJerkXYZ
freqBodyGyroXYZ
freqBodyAccMag
freqBodyAccJerkMag
freqBodyGyroMag
freqBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Resulting in a complete list of variables of each feature vector:

"timeBodyAccMeanX"
"timeBodyAccMeanY"
"timeBodyAccMeanZ"
"timeBodyAccStdX"
"timeBodyAccStdY"
"timeBodyAccStdZ"
"timeGravityAccMeanX"
"timeGravityAccMeanY"
"timeGravityAccMeanZ"
"timeGravityAccStdX"
"timeGravityAccStdY"
"timeGravityAccStdZ"
"timeBodyAccJerkMeanX"
"timeBodyAccJerkMeanY"
"timeBodyAccJerkMeanZ"
"timeBodyAccJerkStdX"
"timeBodyAccJerkStdY"
"timeBodyAccJerkStdZ"
"timeBodyGyroMeanX"
"timeBodyGyroMeanY"
"timeBodyGyroMeanZ"
"timeBodyGyroStdX"
"timeBodyGyroStdY"
"timeBodyGyroStdZ"
"timeBodyGyroJerkMeanX"
"timeBodyGyroJerkMeanY"
"timeBodyGyroJerkMeanZ"
"timeBodyGyroJerkStdX"
"timeBodyGyroJerkStdY"
"timeBodyGyroJerkStdZ"
"timeBodyAccMagMean"
"timeBodyAccMagStd"
"timeGravityAccMagMean"
"timeGravityAccMagStd"
"timeBodyAccJerkMagMean"
"timeBodyAccJerkMagStd"
"timeBodyGyroMagMean"
"timeBodyGyroMagStd"
"timeBodyGyroJerkMagMean"
"timeBodyGyroJerkMagStd"
"freqBodyAccMeanX"
"freqBodyAccMeanY"
"freqBodyAccMeanZ"
"freqBodyAccStdX"
"freqBodyAccStdY"
"freqBodyAccStdZ"
"freqBodyAccJerkMeanX"
"freqBodyAccJerkMeanY"
"freqBodyAccJerkMeanZ"
"freqBodyAccJerkStdX"
"freqBodyAccJerkStdY"
"freqBodyAccJerkStdZ"
"freqBodyGyroMeanX"
"freqBodyGyroMeanY"
"freqBodyGyroMeanZ"
"freqBodyGyroStdX"
"freqBodyGyroStdY"
"freqBodyGyroStdZ"
"freqBodyAccMagMean"
"freqBodyAccMagStd"
"freqBodyBodyAccJerkMagMean"
"freqBodyBodyAccJerkMagStd"
"freqBodyBodyGyroMagMean"
"freqBodyBodyGyroMagStd"
"freqBodyBodyGyroJerkMagMean"
"freqBodyBodyGyroJerkMagStd"

Variables used:
==============
During the course of the program I have made use of a few data.frames:
measurements: to store the measurements indicated in the features.txt file
subjectstest: to store the respective subjects whose data was taken (2947 obs. of 1 var.)
testmeasurements: to store the actual measurements taken for the test subjects (2947 obs. of 561 var.)
testactivities: to store the respective activities that the subjects were doing when measurements were taken (2947 obs. of 1 var.)
testdf: data frame to collate the previous 3 data.frames (2947 obs. of 563 var.)
subjectstrain: to store the respective subjects whose data was taken (7352 obs. of 1 var.)
trainmeasurements: to store the actual measurements taken for the train subjects(7352 obs. of 561 var.)
trainactivities: to store the respective activities that the subjects were doing when measurements were taken(7352 obs. of 1 var.)
traindf: data frame to collate the previous 3 data.frames (7352 obs. of 563 var.)
totaldata: to collate a total set of data for both the test and train subjects (10299 obs. of 68 vars.)

totaldatadt: is the same data as in total data but stored in a data.table format for functionality use with certain functions (10299 obs. of 68 vars.)

activitylabels: to store the activities as specified in the activity_labels.txt file (6 obs. of 2 vars)
varnames: to store and manipulate the variable names to make more readable names based on syntax for R (character vector of 66 values)

result: to store the final result which means it stores the averages of each variable for each unique subject/activity combination. (180 observations of 68 variables)

Final Result:
=========

tidydataproject.txt: final tidy data result as the most readable and interpretable format with the data organised first by subject, then by activity and the variables indicated as specified above.

Process:
======
as described in the accompanying readme.md file


> Written with [StackEdit](https://stackedit.io/).