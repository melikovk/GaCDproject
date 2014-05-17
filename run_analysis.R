# setwd('~/coursera/GettingAndCleaningData/UCI HAR Dataset')
library('plyr')
# Read features description and sort them in ascending column order
features<-read.table('features.txt', colClasses=c('integer','character'))
features<-features[order(features[1]), 2]
# Set all column classes of data to numeric
colclasses<-rep('numeric', length(features))
# Set all column classes that do not contain "-mean(" or "-std(" to NULL to ignore them
colclasses[-grep("-(mean|std)\\(",features)]<-'NULL'
# Remove brackets from feature names
features<-gsub('\\(\\)', '',features)
# Read test dataset
testdata<-read.table('./test/X_test.txt', colClasses=colclasses, col.names=features)
testdata$userid<-read.table('./test/subject_test.txt', colClasses=c('integer'))[,1]
testdata$activity<-read.table('./test/y_test.txt', colClasses=c('integer'))[,1]
# Read train dataset
traindata<-read.table('./train/X_train.txt', colClasses=colclasses, col.names=features)
traindata$userid<-read.table('./train/subject_train.txt', colClasses=c('integer'))[,1]
traindata$activity<-read.table('./train/y_train.txt', colClasses=c('integer'))[,1]
# merge datasets
data<-rbind(testdata,traindata)
rm(testdata, traindata)
# Read activities and sort in ascending id order
activities<-read.table('activity_labels.txt', colClasses=c('integer','character'))
activities<-activities[order(activities[1]),2]
# Convert activities column into factor and assign descriptive names
data$activity<-factor(data$activity)
levels(data$activity)<-activities
# Create tidy dataset with the average of each variable for each activity and each subject. 
tidydata<-ddply(data, .(userid, activity), numcolwise(mean))
# Save tidy dataset
write.table(tidydata, 'tidyUCIHARdata.txt', row.names=FALSE)
# write.table(colnames(tidydata), 'CodeBook.MD', col.names=FALSE, quote=FALSE)
