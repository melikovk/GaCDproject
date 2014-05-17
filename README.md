GaCDproject
===========

Getting and Cleaning Data Course Project

Script run_analysis.R summarizes user activity data from Human Activity Recognition Using Smartphones Dataset Version 1.0
Script expect tha dataset to be located in the current directory preserving original dataset directory structure (with
test dataset and train dataset located in 'test' and 'train' subfolders respectively). Below is description of the script 

1. Read "features.txt" file with the descriptive names of the measurements
2  Use grep to select the measurements on the mean and standard deviation for each measurement - they have '-mean()' and 
   '-std()' in their name. 
3. Set colClass of all other measurement to 'NULL' to ignore them. 
4. Read test set measurement and add columns with user id and activity code.
5. Read training set measurement and add columns with user id and activity code.
6. Merge test and training data into single data frame. 
7. Relabel activity codes using descriptive names from 'activity_labels.txt' file. 
8. Use ddply from 'plyr' library to summarize data with the average of each variable for each activity and each subject
9. Save resulting tidy data set into the file 
