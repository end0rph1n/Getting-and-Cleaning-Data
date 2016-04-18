
##1. Merges the training and the test sets to create one data set.

## step1: download zip file.

if(!file.exists("./")) dir.create("./")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "c:/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

## step2: unzip zip file and extract to directory that has the same name as the file.

filezipped <- unzip("getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", exdir = "c:/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset")

## step3: setting working directory now to have shorter datapaths in the future

setwd("c:/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset/UCI HAR Dataset")

## step4: load data

train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

## step5: merge train data and test data

trainData <- cbind(train.subject, train.y, train.x)
testData <- cbind(test.subject, test.y, test.x)
mergedData <- rbind(trainData, testData)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

## step1: read feature name
featureName <- read.table("./features.txt", stringsAsFactors = FALSE)[,2]

## step2: extract mean and standard deviation of each measurements

featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featureName)
finalData <- mergedData[, c(1, 2, featureIndex+2)]
colnames(finalData) <- c("subject", "activity", featureName[featureIndex])

## 3. Uses descriptive activity names to name the activities in the data set

## step1: read activity data

activityName <- read.table("./activity_labels.txt")

## step2: replace 1 to 6 with activities

finalData$activity <- factor(finalData$activity, levels = activityName[,1], labels = activityName[,2])

## 4. Appropriately labels the data set with descriptive variable names.

names(finalData) <- gsub("\\()", "", names(finalData))
names(finalData) <- gsub("^t", "Time", names(finalData))
names(finalData) <- gsub("^f", "Frequence", names(finalData))
names(finalData) <- gsub("-mean", "Mean", names(finalData))
names(finalData) <- gsub("-std", "StdDev", names(finalData))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
groupData <- finalData %>%
group_by(subject, activity) %>%
summarise_each(funs(mean))

write.table(groupData, "./MeanData.txt", row.names = FALSE)



