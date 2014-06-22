## The function run_analysis needs as a parameter a directory name to work. The directory name is the name of the unzipped direcotory 'UCI HAR Dataset' from the zip-file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## VAriables
## train_dir is the directory of  the trining-data
## test_dir is the directory of the test data
## testx_data loads the X data from directory test_dir
## trainx_data loads the X data from directory train_dir
## testy_data loads the Y data from the directory test_dir
## trainy_data loads the Y data from the directory train_dir
## ttx_data is the merge x-data from test_dir and train_dir   
## tty_Data is the merge from y-data test_dir and train_dir
## sel is a selector for finding the mean and std-variable-names  
## col_namesxdata are the column names for the x-data
## ydata_asfactor is the y-data as a factor and activities as levels
## tidy_data is the tidy data set


## Workflow
## please have a look to the code - all is described there with comments and explains the workflow
 
