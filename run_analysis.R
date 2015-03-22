library(plyr)
library(dplyr)
# work in a folder parallel to  UCI HAR Dataset 
data_path <- "../UCI HAR Dataset"
res_folder <- "results"
if(!file.exists(res_folder)){
  print("Creating result folder")
  dir.create(res_folder)
}
##reads a table from the file and applies given col names (optional argument)
loadTable <- function (filename, cols = NULL){
  f <- paste(data_path,"/", filename, sep="")
  print(paste("Getting table:", f))
  tbl <- data.frame()
  
  if(is.null(cols)){
    tbl <- read.table(f, stringsAsFactors=FALSE, sep="")
  } else {
    tbl <- read.table(f, stringsAsFactors=FALSE, sep="", col.names= cols)
  }
  tbl
}

##Reads and creates a complete set 
## datatype can be test or train
completeSet <- function(datatype, features){
  
  print(paste("Getting data", datatype))
  subj_file <- paste(datatype,"/","subject_",datatype,".txt",sep="")
  subject_data <- loadTable(subj_file, "id") # give name "id"
  
  y_data_file <- paste(datatype,"/","y_",datatype,".txt",sep="")
  y_data <- loadTable(y_data_file, "activity") # give name activity
  
  x_data_file <- paste(datatype,"/","X_",datatype,".txt",sep="")
  x_data <- loadTable(x_data_file, features) # the name of columns are passed from feature file
  
  # combine all data for a set
  return (cbind(subject_data,y_data,x_data))
}

#features used for col names when creating train and test data sets
features <- loadTable("features.txt")
# extract the second column, will be used for names of columns of sets (train or test)
features=features[,2]

## Load the complete sets
train <- completeSet("train",features)
test <- completeSet("test",features)

## 1. Merges the training and the test sets to create one data set
# merge datasets
data <- rbind(train, test)

# rearrange the data using id
data <- arrange(data, id)
activity_labels <- loadTable("activity_labels.txt")

# replace the activity integer (1..6) with the name of activity
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

# capture the columns that have std or mean in the name, using grep
# columns 1 and 2 contain id and activity name
columnsOfInterest=c(1,2, grep("std", colnames(data)), grep("mean", colnames(data)))
tidyset1 <- data[,columnsOfInterest]

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidyset2 <- ddply(tidyset1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# Adds "_mean" to colnames
colnames(tidyset2)[-c(1:2)] <- paste(colnames(tidyset2)[-c(1:2)], "_mean", sep="")

# Save tidy dataset2 into results folder
print(paste("Saving data", "tidyset2"))
file1 <- paste(res_folder, "/", "tidyset2.txt" ,sep="")
write.table(tidyset2,file1, row.names=FALSE)



