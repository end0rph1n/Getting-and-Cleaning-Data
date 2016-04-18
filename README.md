#A. Getting and Cleaning Data Course Project

##1.Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

#B. Accelerometer Data sources

##1.One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


#C. Scripts

##1. README.md: is the present file

##2. run_analysis.R: an R script  that Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##3. CodeBook.md: a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

##4. MeanData.txt: a tidy data that can be used for later analysis and contains the mean of each measurement for each activity and each subject.

#D. How all the scripts work and how they are connected

-download.file() and unzip() functions to download the zip file and extract it. 

-setwd() to set the working directory.

-read.table() function to load "x_train.txt", "y_train", "subject_train" in train directory and "x_test", "y_test", "subject_test" into R.

-rbind() and cbind() functions to merge all train and test data into one table.

-read.table()  function to load "features.txt" into R.

-grep() function to find the indexes with mean() and sd().

-read.table() function to load "activity_labels.txt" into R.

-factor() function with arguments "levels = " and "labels = " to replace the numbers to activity names.

-gsub() function to replace all characters that need to be replaced.

-group_by() and summarise_each() functions in "dplyr" package to calculate all means for each activity and wach subject.

-write_table() to produce the "MeanData.txt" file that contains the tidy data.