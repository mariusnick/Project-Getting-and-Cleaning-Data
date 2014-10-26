Project-Getting-and-Cleaning-Data
=================================
Description   run_analysis.r  

It is  use  only one script. Data set must be unpacked in  directory R

1.Merges the training and the test sets to create one data set.
  Read from files data set for train and set for  subject and activity It is add to data set subject and activity 
  Merge data set for train with data set for test 
Extracts only the measurements on the mean and standard deviation for each measurement.
   Are selected names that contain words in their name mean and std in vector name_sel
   This list is applied to the data set and obtain a data set that contains columns that contain only the mean and std.
Uses descriptive activity names to name the activities in the data set. 
 For each activity using function "ifelese", for replace number with labels.       
Appropriately labels the data set with descriptive variable names 
“ Colnames” function is used to give the column labels.  
Variables given the name  of features and the last two columns named “subject” and “activity”.
 From the data set data_sel, creates a second, independent tidy data set, data_sel_mean, with the average of each variable for each activity. 
  Use the function “for” (to scroll through columns) and function “tapply” to  calculate  mean by subject and activity.

