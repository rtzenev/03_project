# merge training and test subjects
subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
subject_train <-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_all <- rbind(subject_test, subject_train) # append/merge subject train and test data


# merge training and test data sets
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
x_all <- rbind(x_test, x_train)

# merge label IDs of training and test sets
y_test <-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
y_train <-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
y_all <- rbind(y_test, y_train) # append/merge label train and test data

act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE) #read activity lables
names(act_labels)[names(act_labels)=="V2"] <- "activity" #change variable name from V2 to 'activity' for the activity labels

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
cnames <- as.character(features[,2]) #read the feature names to become column names in the combined data set
colnames(x_all) <- cnames #chnage the names of the columns in the combined data set with the actual feature names 
mean_std_col <- which(as.logical(features[,3])) #find all variables which are either averages or standard deviations
x_all_subset <- x_all[mean_std_col] #subset the combined data set with mean_std_col

x_all_subset$subject = subject_all$V1 # add column with the subject IDs
x_all_subset$act_id = y_all$V1 # add column with the activity IDs

x_all_subset <- merge(x_all_subset, act_labels, by.x="act_id", by.y="V1") #merge activity IDs with activity labels
x_all_subset$act_id <- NULL #remove column with activity ID, table contains now the activity label column

x_all_subset$subject <- as.factor(x_all_subset$subject)

library(dplyr)
x_final<-group_by(x_all_subset, subject, activity) %>% summarise_each(c("mean")) #group by subject and activity and take the mean  
x_final<-data.frame(x_final) #convert back to data frame

#write.table(x_final, file="x_final_tidy_set.txt", row.names=FALSE)