rm(list=ls())

library(dplyr)

# Load data
x_train <- read.table('data/train/X_train.txt')
y_train <- read.table('data/train/y_train.txt', col.names = c("activity"))
subject_train <- read.table('data/train/subject_train.txt', col.names = c("subject"))

x_test <- read.table('data/test/X_test.txt')
y_test <- read.table('data/test/y_test.txt', col.names = c("activity"))
subject_test <- read.table('data/test/subject_test.txt', col.names = c("subject"))

feature_names <- read.table('data/features.txt', col.names = c("id", "fnames"))
activity_labels <- read.table('data/activity_labels.txt', col.names = c("id", "label"), stringsAsFactors=TRUE)

# 1. Merges the training and the test sets to create one data set.
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

colnames(x_data) <- feature_names$fnames

data <- x_data
data$activity <- y_data$activity
data$subject <- subject_data$subject

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
data <- data[,grepl("(mean\\(\\)|std\\(\\)|activity|subject)", colnames(data))]

# 3. Uses descriptive activity names to name the activities in the data set
data$activity <- sapply(data$activity, function(x){activity_labels$label[x]})

# 4. Appropriately labels the data set with descriptive variable names.
# Done in step 1

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.
tidy_data <- data %>%
  group_by(activity, subject) %>%
  summarize_all(funs(mean(., na.rm=TRUE)))
             
write.table(tidy_data, 'tidy_data.txt', row.names=FALSE)
