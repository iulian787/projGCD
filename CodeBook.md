---
title: "CodeBook.md"
output: html_document
---

## Working with data
It is assumed that the data was downloaded and unzipped in a folder, prior to analysis  
This code needs to be in a folder parallel to UCI folder (at the same level) 

Description of the run_analysis.R process:  

* Loads library `plyr` and `dplyr`
* Creates results folder
* defines 2 helper functions, one to read a table, and assign given column names, 
 and one to read a train or test complete set
* Loads feature data set `features.txt` used for columns names for actual data table

* Loads and appends train dataset using `X_train.txt`, `y_train.txt`, `subject_train.txt`  
    + `subject_train` contains the ids for each subject (1..30)  
    + `y_train` contains the activity labels (1..6)  
    + `X_train` contains the data using the feature data set as columns 
* Loads and appends test dataset using `X_test.txt`, `y_test.txt`, `subject_test.txt` 
    + `subject_test` contains the ids
    + `y_test` contains the activity labels
    + `X_test` contains the data using the feature data set as columns
* concatenates train and test data
* Rearrange the data using id
* Loading activity labels `activity_labels.txt`
* Changes the data activity row to use the activity labels
* Extracts the `mean`,`std` into tidyset1

* applies ddply to compute means for all variables, using id and activity 
* appends `_mean` to all data columns names
* saves the tidy dataset2 into `results/tidyset2.txt`

The tidyset2 will contain 180 rows, for 30 subjects and 6 activities each, and one
header row.  
There are 81 columns, first for id of the subject and second for the activity.  
The rest of 79 columns contain the mean of all variables that contain std or mean
in their original feature name.  

The names of the variables are formed by appending
"_mean" to the original names  
There are no changes to the units, compared to the original feature files.  
Because the features are normalized, they are all a-dimensional, and all 
values are between [-1, 1]. All the means calculated by this exercise will
be between 1 and -1.   

 [1] "id"                                  
 [2] "activity"                            
 [3] "tBodyAcc.std...X_mean"               
 [4] "tBodyAcc.std...Y_mean"               
 [5] "tBodyAcc.std...Z_mean"               
 [6] "tGravityAcc.std...X_mean"            
 [7] "tGravityAcc.std...Y_mean"            
 [8] "tGravityAcc.std...Z_mean"            
 [9] "tBodyAccJerk.std...X_mean"           
[10] "tBodyAccJerk.std...Y_mean"           
[11] "tBodyAccJerk.std...Z_mean"           
[12] "tBodyGyro.std...X_mean"              
[13] "tBodyGyro.std...Y_mean"              
[14] "tBodyGyro.std...Z_mean"              
[15] "tBodyGyroJerk.std...X_mean"          
[16] "tBodyGyroJerk.std...Y_mean"          
[17] "tBodyGyroJerk.std...Z_mean"          
[18] "tBodyAccMag.std.._mean"              
[19] "tGravityAccMag.std.._mean"           
[20] "tBodyAccJerkMag.std.._mean"          
[21] "tBodyGyroMag.std.._mean"             
[22] "tBodyGyroJerkMag.std.._mean"         
[23] "fBodyAcc.std...X_mean"               
[24] "fBodyAcc.std...Y_mean"               
[25] "fBodyAcc.std...Z_mean"               
[26] "fBodyAccJerk.std...X_mean"           
[27] "fBodyAccJerk.std...Y_mean"           
[28] "fBodyAccJerk.std...Z_mean"           
[29] "fBodyGyro.std...X_mean"              
[30] "fBodyGyro.std...Y_mean"              
[31] "fBodyGyro.std...Z_mean"              
[32] "fBodyAccMag.std.._mean"              
[33] "fBodyBodyAccJerkMag.std.._mean"      
[34] "fBodyBodyGyroMag.std.._mean"         
[35] "fBodyBodyGyroJerkMag.std.._mean"     
[36] "tBodyAcc.mean...X_mean"              
[37] "tBodyAcc.mean...Y_mean"              
[38] "tBodyAcc.mean...Z_mean"              
[39] "tGravityAcc.mean...X_mean"           
[40] "tGravityAcc.mean...Y_mean"           
[41] "tGravityAcc.mean...Z_mean"           
[42] "tBodyAccJerk.mean...X_mean"          
[43] "tBodyAccJerk.mean...Y_mean"          
[44] "tBodyAccJerk.mean...Z_mean"          
[45] "tBodyGyro.mean...X_mean"             
[46] "tBodyGyro.mean...Y_mean"             
[47] "tBodyGyro.mean...Z_mean"             
[48] "tBodyGyroJerk.mean...X_mean"         
[49] "tBodyGyroJerk.mean...Y_mean"         
[50] "tBodyGyroJerk.mean...Z_mean"         
[51] "tBodyAccMag.mean.._mean"             
[52] "tGravityAccMag.mean.._mean"          
[53] "tBodyAccJerkMag.mean.._mean"         
[54] "tBodyGyroMag.mean.._mean"            
[55] "tBodyGyroJerkMag.mean.._mean"        
[56] "fBodyAcc.mean...X_mean"              
[57] "fBodyAcc.mean...Y_mean"              
[58] "fBodyAcc.mean...Z_mean"              
[59] "fBodyAcc.meanFreq...X_mean"          
[60] "fBodyAcc.meanFreq...Y_mean"          
[61] "fBodyAcc.meanFreq...Z_mean"          
[62] "fBodyAccJerk.mean...X_mean"          
[63] "fBodyAccJerk.mean...Y_mean"          
[64] "fBodyAccJerk.mean...Z_mean"          
[65] "fBodyAccJerk.meanFreq...X_mean"      
[66] "fBodyAccJerk.meanFreq...Y_mean"      
[67] "fBodyAccJerk.meanFreq...Z_mean"      
[68] "fBodyGyro.mean...X_mean"             
[69] "fBodyGyro.mean...Y_mean"             
[70] "fBodyGyro.mean...Z_mean"             
[71] "fBodyGyro.meanFreq...X_mean"         
[72] "fBodyGyro.meanFreq...Y_mean"         
[73] "fBodyGyro.meanFreq...Z_mean"         
[74] "fBodyAccMag.mean.._mean"             
[75] "fBodyAccMag.meanFreq.._mean"         
[76] "fBodyBodyAccJerkMag.mean.._mean"     
[77] "fBodyBodyAccJerkMag.meanFreq.._mean"  
[78] "fBodyBodyGyroMag.mean.._mean"        
[79] "fBodyBodyGyroMag.meanFreq.._mean"    
[80] "fBodyBodyGyroJerkMag.mean.._mean"    
[81] "fBodyBodyGyroJerkMag.meanFreq.._mean"
