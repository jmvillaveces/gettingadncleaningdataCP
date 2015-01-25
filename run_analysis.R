library(dplyr)

activities <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, text=s, col.names=c("acid","activity"))
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, text=s, col.names=c("id","feature"))

#Create dataset for training data
sbj <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, text=s, col.names=c("subject"))
act <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, text=s, col.names=c("acid"))
trdata <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, text=s, col.names=features$feature)
trdata$subject <- sbj$subject
trdata$acid <- act$acid

#Add activity labels
trdata<- merge(trdata, activities, all=TRUE)

#Create dataset for test data
sbj <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, text=s, col.names=c("subject"))
act <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, text=s, col.names=c("acid"))
tstdata <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, text=s, col.names=features$feature)
tstdata$subject <- sbj$subject
tstdata$acid <- act$acid

#Add activity labels
tstdata<- merge(tstdata, activities, all=TRUE)


#Merge both datasets
dataset <- merge(tstdata, trdata, all=TRUE)

# calculating mean and sd for each feature
mean_sd <- select(dataset, -subject, -acid, -activity) %>% summarise_each(funs(mean, sd))
#save to disk
write.table(mean_sd, file="mean_sd_dataset.txt", row.name=FALSE)

# data set with the average of each variable for each activity and each subject
act_sbj_avg <- select(dataset, -acid)%>% group_by(activity, subject) %>% summarise_each(funs(mean))
#save to disk
write.table(act_sbj_avg, file="mean_by_activity_and_subject_dataset.txt", row.name=FALSE)
