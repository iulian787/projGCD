# Readme file
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.  
The goal is to prepare tidy data that can be used for later analysis.  
Requirements:  
 1) a tidy data set as described below
 2) a link to a Github repository with the script for performing the analysis
 3) a code book that describes the variables, the data, and any transformations or work , CodeBook.md. 

One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R does the following: 

 *   Merges the training and the test sets to create one data set.
 *   Extracts only the measurements on the mean and standard deviation for each measurement. 
 *   Uses descriptive activity names to name the activities in the data set
 *   Appropriately labels the data set with descriptive variable names. 

 *   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps:
first download the files, and then unzip them in a folder
 UCI HAR Dataset is the data folder
clone the repo with someting like this:
git clone https://github.com/iulian787/projGCD.git
cd to projGCD folder, then launch rstudio or R

source("run_analysis.R")

it will create results folder, with tidyset2.txt file , saved there 


