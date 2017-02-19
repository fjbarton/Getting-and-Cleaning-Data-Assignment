# Getting-and-Cleaning-Data-Assignment
Repository for submission for week 4 assignment for Getting and Cleaning Data course

R code in file run_analysis.R

The following data files are required and are assumed to be in the current working directory:

features.txt - description of measures in X_train.txt and X_test.txt data files
activity_labels.txt - description of activity codes in y_train.txt and y_test.txt

subject_train.txt - ids for subjects of rows in X_train.txt and y_train.txt
X_train.txt - observation data for train dataset
y_train - activity code data for train dataset

The above three files each contains 7352 rows and need to be joined together using cbind() to form the train dataset

subject_test.txt - ids for subjects of rows in X_test.txt and y_test.txt
X_test.txt - observation data for test dataset
y_test - activity code data for test dataset

The above three files each contains 2947 rows and need to be joined together using cbind() to form the test dataset

The train and test data sets should be joined together using rbind()


After running the code in run_analysis.R, the file wk4aggdata.txt will be written to the current working directory


The run_analysis.R file contains the code required to complete the following assignment:

1 Merges the training and the test sets to create one data set.

2 Extracts only the measurements on the mean and standard deviation for each measurement.

3 Uses descriptive activity names to name the activities in the data set

4 Appropriately labels the data set with descriptive variable names.

5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



