---
title: "CodeBook.md"
output: html_document
---

## Working with data
Description of the run_analysis.R process
It is assumed that the data was downloaded and unzipped in a folder, prior to analysis

* Loads library `plyr` and `dplyr`

* Creates results folder
* defines 2 helper functions, one to read a table, and assign given column names, 
 and one to read a train or test complete set
 
* Loads feature data set `features.txt` used for columns names for actual data table

* Loads and appends train dataset using `X_train.txt`, `y_train.txt`, `subject_train.txt`
        * `subject_train` contains the ids for each subject (1..30)
        * `y_train` contains the activity labels (1..6)
        * `X_train` contains the data using the feature data set as columns
* Loads and appends test dataset using `X_test.txt`, `y_test.txt`, `subject_test.txt`
        * `subject_test` contains the ids
        * `y_test` contains the activity labels
        * `X_test` contains the data using the feature data set as columns
* concatenates train and test data
* Rearrange the data using id
* Loading activity labels `activity_labels.txt`
* Changes the data activity row to use the activity labels
* Extracts the `mean`,`std` into tidyset1

* applies ddply to compute means for all variables, using id and activity 
* appends `_mean` to all data columns
* saves the tidy dataset2 into `result/tidyset2.txt`
