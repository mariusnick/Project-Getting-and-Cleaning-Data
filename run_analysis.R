# 1.Merges the training and the test sets to create one data set.
setwd("~/R/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train")
data<-read.table("X_train.txt")
act<-read.table("y_train.txt")
subject<-read.table("subject_train.txt")
data<-cbind(data,subject)
data<-cbind(data,act)
setwd("~/R/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
data_test<-read.table("X_test.txt")
act_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
data_test<-cbind(data_test,subject_test)
data_test<-cbind(data_test,act_test)
data<-rbind(data,data_test)
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
setwd("~/R/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
features<-read.table("features.txt")
name_sel<-(grep("std|mean",features$V2))
data_sel<-data[,name_sel]
#3. Uses descriptive activity names to name the activities in the data set data_sel
data_sel<-cbind(data_sel,data[,562:563])
colnames(data_sel)<-features$V2[name_sel]
colnames(data_sel)<-c(as.character(features$V2[name_sel]),"subject","activity")
#4.Appropriately labels the data set with descriptive variable names
act_labels<-read.table("activity_labels.txt")
data_sel$activity<-ifelse((data_sel$activity==1),as.character(act_labels[1,2]),data_sel$activity)
data_sel$activity<-ifelse((data_sel$activity==2),as.character(act_labels[2,2]),data_sel$activity)
data_sel$activity<-ifelse((data_sel$activity==3),as.character(act_labels[3,2]),data_sel$activity)
data_sel$activity<-ifelse((data_sel$activity==4),as.character(act_labels[4,2]),data_sel$activity)
data_sel$activity<-ifelse((data_sel$activity==5),as.character(act_labels[5,2]),data_sel$activity)
data_sel$activity<-ifelse((data_sel$activity==6),as.character(act_labels[6,2]),data_sel$activity)
#5. From the data set data_sel, creates a second, independent tidy data set, data_sel_mean, with the average of each variable for each activity and each subject
combine<-paste(data_sel$subject,",",data_sel$activity)
i<-0
data_sel_mean<-array(dim=c(180,79))
for(i in 1:79){data_sel_mean[,i]<-tapply(data_sel[,i],combine,mean)}
colnames(data_sel_mean)<-features$V2[name_sel]
#recompose vector for activity and subjects in the order that is in date_sel_mean
activity1<-c("LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS")
activity1<-rep(activity1,30)
subject1<-c(rep(1,6),rep(10,6),rep(11,6),rep(12,6),rep(13,6),rep(14,6),rep(15,6),rep(16,6),rep(17,6),rep(18,6),rep(19,6))
subject1<-c(subject1,rep(2,6),rep(20,6),rep(21,6),rep(22,6),rep(23,6),rep(24,6),rep(25,6),rep(26,6),rep(27,6),rep(28,6),rep(29,6))
subject1<-c(subject1,rep(3,6),rep(30,6),rep(4,6),rep(5,6),rep(6,6),rep(7,6),rep(8,6),rep(9,6))
data_sel_mean<-cbind(data_sel_mean,subject1,activity1)






