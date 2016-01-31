#There are five tasks in completing this course project. 
# I have used data.table only in the last task, to reduce group_by complexity.
# Of course, I could have used data.set for all tasks. 

#Assumptions made:
#1. The working directory structure is as described in README.md. 
#  1a. The data set is within a folder HARDataset within the current working directory.
#2. The data set is tidy upon grouping by activity and subject. This is discussed in the forum
# The result dataset of this script creates a 180 row set with 68 variables which is tidy.
# It can be further melted but it will make the dataset long. Since the course forum has made
# it clear that it is not necessary, this script skips the melt procedure.

#Task 1 - Merge the training and test data sets
#Get the feature list which will serve as the column names
features <- read.table("HARDataset/features.txt", header=FALSE)
featurelist <- features[,2]
#Load the training set input data and set the column names to the features
x_train <- read.table("HARDataset/train/X_train.txt", header=FALSE)
colnames(x_train) <- featurelist
#Load the output data (1-6 for different type of activity)
y_train <- read.table("HARDataset/train/y_train.txt", header=FALSE)
#Load the corresponding subject data
subject_train <- read.table("HARDataset/train/subject_train.txt", header=FALSE)
colnames(y_train) <- "y"
colnames(subject_train) <- "subject"
#Combine all three datasets to form training data set
train <- cbind(subject_train, y_train, x_train)

#Repeat the same procedure for test data set
x_test <- read.table("HARDataset/test/X_test.txt", header=FALSE)
colnames(x_test) <- featurelist
y_test <- read.table("HARDataset/test/y_test.txt", header=FALSE)
subject_test <- read.table("HARDataset/test/subject_test.txt", header=FALSE)
colnames(y_test) <- "y"
colnames(subject_test) <- "subject"
test <- cbind(subject_test, y_test, x_test)
#Merge train and test dataset to get a data frame of 10299 * 563 dimension
hardata <- rbind(train, test)

#Task 2 - Extract only the measurements on the mean and standard deviation for each measurement.
#As per discussion forum, meanFreq or gravityMean is to be ignored. only mean() or std() to be considered.
#Filter featurelist for these names
f2 <- c("subject", "y", grep("(-mean\\(\\))|(-std\\(\\))",featurelist, value=TRUE))  #68 columns
hard2 <- hardata[,f2]  #10299 x 68 columns

#Task 3 - Uses descriptive activity names to name the activities in the data set
#this is basically a lookup for the activity value to its activity name
activitylabel <- read.table("HARDataset/activity_labels.txt", header=FALSE)
colnames(activitylabel) <- c("activity_code", "activity_name")
hard2$y <- activitylabel[hard2$y,2]
#Now that we have replaced activity value (1-6) to its name, rename column
names(hard2)[names(hard2)=="y"] <- "activity"

#Task 4 - Appropriately labels the data set with descriptive variable names.
#we need to clean up the names to not contain '-', remove '()' and replace 't' as time and 'f' as freq
names(hard2) <- gsub("-",".", names(hard2))
names(hard2) <- gsub("\\(|\\)","", names(hard2))
names(hard2) <- gsub("^t","time", names(hard2))
names(hard2) <- gsub("^f","freq", names(hard2))

#Task 5 - create a second, independent tidy data set with the average of each variable 
#for each activity and each subject.
library(data.table)
#Convert to data.table for easier grouping and averaging.
harddt<- data.table(hard2)
#index and arrange dataset in the order of activity and subject
setkey(harddt, activity, subject)
#.SD means rest of the columns i.e apart from the ones specified by the 'by' operator
tidydt <- harddt[, lapply(.SD, mean), by = .(activity, subject)]

#output tidy data set to file for submission
write.table(tidydt, file = "tidydataset.txt",row.names=FALSE)