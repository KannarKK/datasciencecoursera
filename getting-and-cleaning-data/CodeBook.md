#Codebook
This codebook is for the Coursera Getting and Cleaning Data Course Project.

#Raw Data Set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The data set is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Project Tasks
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#My Experiment Details:
Having read the above task requirements and analyzed the structure of data set zip folder, I realized that we don't need the Inertial Signals dataset for our project. Its input of 128 readings per window are irrelevant to any of the tasks of the project. The __original data set was unchanged.__

###Setup Instructions
(also mentioned in codebook) Remember to set the working directory to the folder which contains the run_analysis.R script before its execution. For eg: setwd("D:/git/datasciencecoursera/getting-and-cleaning-data") Download the Data Set (link below) and add it to working directory getting-and-cleaning-data/HARDataset

We need to merge the X_train.txt, y_train.txt and subject_train.txt to get a training data set and similarly for test data set.

```dim(x_train)``` is 7352 x 561

```dim(y_train)``` is 7352 x 1

```dim(subject_train) ``` is 7352 x 1

```dim(x_test)``` is 2947 x 561

```dim(y_test)``` is 2947 x 1

```dim(subject_test)``` is 2947 *1

We need to merge as ( subject_train, y_train, x_train) and similarly for test set. and then merge both files.

Coming to the selection of the columns with only `mean` or `std` measurements, I have not included the columns with `meanFreq` or `Gravitymean`, since these are different varaibles and not mean or standard deviation of the measurements. This leaves us with 66 such features.

I have used data.table for only the last step. The script can run faster if I used data.table from beginning, though.
The final merged data set is of the dimensions - 10299 * 68 (including activity and subject variables).

As mentioned in my comments within the script, I have not melted the data set since the final data set is tidy without melting as discussed in the forum.

The final tidy data set is has 180 observations of 68 variables and has the following columns:
(The complete description of each variable is in feature_info.txt)
 * activity                    : Factor w/ 6 levels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 * subject                     : ID of a person from 1 to 30
 * timeBodyAcc.mean.X          : num  
 * timeBodyAcc.mean.Y          : num  
 * timeBodyAcc.mean.Z          : num  
 * timeBodyAcc.std.X           : num  
 * timeBodyAcc.std.Y           : num  
 * timeBodyAcc.std.Z           : num  
 * timeGravityAcc.mean.X       : num
 * timeGravityAcc.mean.Y       : num  
 * timeGravityAcc.mean.Z       : num  
 * timeGravityAcc.std.X        : num 
 * timeGravityAcc.std.Y        : num  
 * timeGravityAcc.std.Z        : num  
 * timeBodyAccJerk.mean.X      : num  
 * timeBodyAccJerk.mean.Y      : num 
 * timeBodyAccJerk.mean.Z      : num  
 * timeBodyAccJerk.std.X       : num  
 * timeBodyAccJerk.std.Y       : num  
 * timeBodyAccJerk.std.Z       : num  
 * timeBodyGyro.mean.X         : num  
 * timeBodyGyro.mean.Y         : num  
 * timeBodyGyro.mean.Z         : num  
 * timeBodyGyro.std.X          : num  
 * timeBodyGyro.std.Y          : num  
 * timeBodyGyro.std.Z          : num  
 * timeBodyGyroJerk.mean.X     : num  
 * timeBodyGyroJerk.mean.Y     : num  
 * timeBodyGyroJerk.mean.Z     : num  
 * timeBodyGyroJerk.std.X      : num  
 * timeBodyGyroJerk.std.Y      : num  
 * timeBodyGyroJerk.std.Z      : num  
 * timeBodyAccMag.mean         : num  
 * timeBodyAccMag.std          : num  
 * timeGravityAccMag.mean      : num  
 * timeGravityAccMag.std       : num  
 * timeBodyAccJerkMag.mean     : num  
 * timeBodyAccJerkMag.std      : num  
 * timeBodyGyroMag.mean        : num  
 * timeBodyGyroMag.std         : num  
 * timeBodyGyroJerkMag.mean    : num  
 * timeBodyGyroJerkMag.std     : num  
 * freqBodyAcc.mean.X          : num  
 * freqBodyAcc.mean.Y          : num  
 * freqBodyAcc.mean.Z          : num  
 * freqBodyAcc.std.X           : num  
 * freqBodyAcc.std.Y           : num  
 * freqBodyAcc.std.Z           : num  
 * freqBodyAccJerk.mean.X      : num  
 * freqBodyAccJerk.mean.Y      : num  
 * freqBodyAccJerk.mean.Z      : num  
 * freqBodyAccJerk.std.X       : num  
 * freqBodyAccJerk.std.Y       : num  
 * freqBodyAccJerk.std.Z       : num  
 * freqBodyGyro.mean.X         : num  
 * freqBodyGyro.mean.Y         : num  
 * freqBodyGyro.mean.Z         : num  
 * freqBodyGyro.std.X          : num  
 * freqBodyGyro.std.Y          : num  
 * freqBodyGyro.std.Z          : num  
 * freqBodyAccMag.mean         : num  
 * freqBodyAccMag.std          : num  
 * freqBodyBodyAccJerkMag.mean : num  
 * freqBodyBodyAccJerkMag.std  : num  
 * freqBodyBodyGyroMag.mean    : num  
 * freqBodyBodyGyroMag.std     : num  
 * freqBodyBodyGyroJerkMag.mean: num  
 * freqBodyBodyGyroJerkMag.std : num  


