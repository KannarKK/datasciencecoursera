#Getting and Cleaning Data Course Project


##Background:
----------
Data Scientist is the sexiest job of this century. Wearable Computing, one of the areas of data science offers a lot of opportunities to look at Fitbit, Nike and Adidas wearable devices beyond their sale numbers and analyze the potential data generated through activity tracking and sports to draw out exciting insights. These insights can help both consumers as well as making efficient businesses with distinct competitive advantages. Therefore the data-driven approach to these devices' business creates an exciting area of data science called as Wearable Computing. (see http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)



The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A video of the the experiment is https://www.youtube.com/watch?v=XOEN9W05_4A 

Bootstrapping Instructions:
---------------------------
Remember to set the working directory to the folder which contains the run_analysis.R script before its execution.
setwd("D:/git/datasciencecoursera/getting-and-cleaning-data")

Download the Data Set (link below) and add it to working directory  getting-and-cleaning-data/


Process:
-------
> dim(x_train)
[1] 7352  561
> dim(y_train)
[1] 7352    1
> dim(subject_train)
[1] 7352    1
---------------------
> dim(x_test)
[1] 2947  561
> dim(y_test)
[1] 2947    1
> dim(subject_test)
[1] 2947    1


=> We need to merge as ( subject_train, y_train, x_train) and similarly for test set. and then merge both files.
hardata <- rbind(x_train, x_test)
> dim(hardata)
[1] 10299   563




