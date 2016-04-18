#Getting and Cleaning Data Course Project

This file indicates all the variables and summaries calculated, along with units, and any other relevant information.

## Source Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [http://www.youtube.com/watch?v=XOEN9W05_4A

An updated version of this dataset can be found at [http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions]. It includes labels of postural transitions between activities and also the full raw inertial signals instead of the ones pre-processed into windows.

The information about how the experiment conducted and how the original data collected can be found in the zip file [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Introduction for the analysis on the original data

- "x_train.txt", "y_train.txt" and "subject_train.txt" contain information about training data.
- "x_test.txt", "y_test.txt" and "subject_test.txt" contain information about testing data.
- "features.txt" contains names of all measurements.

## Introduction for the code submmited

-download.file() and unzip() functions to download and extract the zip file.
-read.table() function to load "x_train.txt", "y_train", "subject_train" in train directory and "x_test", "y_test", "subject_test" into R.
-rbind() and cbind() functions to merge all train and test data together.

-read.table() function to load "features.txt".
-grep() function to find the indexes with "mean()" and "sd()".
-select all  columns and set the columns name using the selected features name.

-read.table() function to load "activity_labels.txt".
-factor() function with arguments "levels = " and "labels = " to replace the numbers with activity names.

-gsub() function to replace all characters that need to be replaced.

-group_by() and summarise_each() functions in "dplyr" package to calculate all means for each activity and wach subject.

-write_table() to produce the "MeanData.txt" file that contains the tidy data.