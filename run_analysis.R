run_analysis <- function(directory)
{
	##direcotry is the name of the directory pointing to 'UCI HAR Dataset' where the data for the project is located 
	if(file.exists(directory)) 
		{	
			result <- paste(directory,"/result",sep="")
			dir.create(result)
		}
	
	## directory of test data set
	test_dir <- paste(directory,"/test",sep="")	
	## directory of train data set
	train_dir <- paste(directory,"/train",sep="")	
	## read data in tables
	testx_data <- read.table(paste(test_dir,"/X_test.txt",sep=""))
	trainx_data <- read.table(paste(train_dir,"/X_train.txt",sep=""))
	testy_data <- read.table(paste(test_dir,"/Y_test.txt",sep=""))
	trainy_data <- read.table(paste(train_dir,"/Y_train.txt",sep=""))
	test_subject <- read.table(paste(test_dir,"/subject_test.txt",sep=""))
	train_subject <- read.table(paste(train_dir,"/subject_train.txt",sep=""))
	
	## Task 1: merge data together
	ttx_data <- merge(testx_data,trainx_data,all=TRUE)
	tty_data <- rbind(testy_data,trainy_data)
	subject_data <- merge(test_subject,train_subject,all=TRUE)
	
	## Task 2: only measurements on mean and standard deviation
	sel <- grepl('mean|std',names(ttx_data))
	ttx_data <- ttx_data[sel]
	
	## Task 4: label data set with variable names
	col_namesxdata <- read.csv(file=paste(directory,"/features.txt",sep=""),sep=" ",header=FALSE)
	colnames(ttx_data) <- col_namesxdata[,2]	
	
	## Task 3: use activity names for activities 
	ydata_asfactor <- as.factor(tty_data[,1])
	## read activity labels as vector
	activities <- as.vector(read.csv(file=paste(directory,"/activity_labels.txt",sep=""),sep=" ",header=FALSE)[,2])
	## assign levels to Y data
	levels(ydata_asfactor) <- activities
	
	## build tidy data set
	tidy_data <- cbind(ydata_asfactor,subject_data,ttx_data)
	## set first and second column names 
	names(tidy_data)[1] <- paste("activities")
	names(tidy_data)[2] <- paste("subject")

}
