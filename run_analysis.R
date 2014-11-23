## run_analysis.R is a program that
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
##    2a. do step 2 for the test variables during step 1
##    2b. do step 2 for the train variables during step 2
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.

## supporting documents are a code book that describes the variables, the data, and any 
## transformations or work that you performed to clean up the data called CodeBook.md,
## ReadMe.md, and a tidy data textfile

## load the namespace of the packages used within the program
library(dplyr)
library(tidyr)
library (gdata)
library (Hmisc)
library(qdap)
library(data.table)

## STEP 1: Merge the training and the test sets to create one data set.
## First read all the relevant test files (subject_test.txt, X_test.txt and
## Y-test.txt  as they have the same number of observations)
## into subjectstest, testmeasurements and testactivities dataframes
## respectively and cbind them together into testdf data frame
## Second read all the relevant training files (subject_train.txt, X_train.txt
## and Y-train.txt  as they have the same number of observations)
## into subjectstrain, trainmeasurements and trainactivities dataframes
## respectively and cbind them together into traindf data frame
## Lastly, rbind the testdf and traindf together

## Read the MEASUREMENTS from the features.txt file for use to extract data
measurements<-read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE )

## Read the subjects from the subject_test.txt file
subjectstest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read the measurements from the X_test.txt file
testmeasurements<-read.table("./UCI HAR Dataset/test/X_test.txt")

## Read the activities from the Y_test.txt file
testactivities<-read.table("./UCI HAR Dataset/test/Y_test.txt")

## Create dataframe for the 'test' subjects, measurements and activities
## by combining subjectstest,testactivities,testmeasurements
## the subjects and activities are fixed values and therefore in the
## beginning of the dataframe followed by the measured values
testdf<-cbind(subjectstest,testactivities,testmeasurements)

## Read the subjects from the subject_train.txt file
## subjectstrain is table with the fixed values of which subjects were measured 
## for train
subjectstrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read the measurements from the X_train.txt file
trainmeasurements<-read.table("./UCI HAR Dataset/train/X_train.txt")

## Read the activities from the Y_train.txt file
trainactivities<-read.table("./UCI HAR Dataset/train/Y_train.txt")

## Create dataframe for the 'train' subjects, measurements and activities
## by combining subjectstrain,trainactivities,trainmeasurements
## the subjects and activities are fixed values and therefore in the
## beginning of the dataframe followed by the measured values
traindf<-cbind(subjectstrain,trainactivities,trainmeasurements)

## Combine the testdf and the traindf by joining them by rows
totaldata<-rbind(testdf, traindf)

## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
numcols<-length(totaldata)
totaldata<-totaldata[grepl("mean[[:punct:]]+|std[[:punct:]]+",measurements$V2)]

## arrange the table according to subject first, then activity
totaldata<-arrange(totaldata,V1,V1.1)

##Turn the totaldata data.frame into data.table 
totaldatadt<-data.table(totaldata)


## STEP 3. Uses descriptive activity names to name the activities in the data set

## Change the numeric values of the Activity variable into proper labels, as 
## specified in the activitylabels data.frame by substituting the original column

activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activitylabels<-data.table(activitylabels)
totaldatadt$V1.1<-activitylabels[V1==totaldatadt$V1.1,V2]

## STEP 4. Appropriately labels the data set with descriptive variable names. 
## 4a. extract the 'MEAN' and 'STD' measurement names from measurements table
varnames<-grep("mean[[:punct:]]+|std[[:punct:]]+)",measurements$V2, value = TRUE)

## 4b. make the measurements into VALID AND MEANINGFUL COLUMN NAMES for R
varnames<-make.names(varnames,unique = TRUE)
varnames<-gsub("[[:punct:]]","",varnames)
varnames<-gsub("mean","Mean", varnames)
varnames<-gsub("std","Std", varnames)
varnames<-gsub("^t","time",varnames)
varnames<-gsub("^f","freq",varnames)

## 4c.Name the first two columns subject and activity (fixed variables)

setnames(totaldatadt,1:2,c("subject","activity"))

## 4d.Name the rest of the columns which contain the measurements with the new
## variable names coming from the varnames vector

numbercols<- length(totaldatadt)
setnames(totaldatadt,3:numbercols,varnames)

## STEP 5.From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

## The measurements can be considered to be 1 variable, with as values the type of 
## measurement, therefor we will make it a new variable named 'measurements'.

result<-totaldatadt[,lapply(.SD,mean), by = list(subject, activity)]

## Write a textfile to your working directory with the tidydata using 
## row.names = FALSE as per instructions
write.table(result,"tidydataproject.txt",row.names=FALSE)


