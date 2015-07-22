if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

library("data.table")
library("reshape2")



## FEATURES

# Read Features file
features <- read.table("./UCI HAR Dataset/features.txt")[,2]


## 2. Extract only the measurements on the mean and standard deviation for each measurement.
## FEATURES
extract_features <- grepl("mean|std", features)


## TESTS FILES

# Read Tests files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features
X_test = X_test[,extract_features]


## ACTIVITY_LABELS

# Read Activity_Labels file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)


## TRAINNING FILES

# Read Train files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features
X_train = X_train[,extract_features]
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)


## Merges the training and the test sets to create one data set.
data = rbind(test_data, train_data)

## Appropriately labels the data set with descriptive variable names. 
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)



write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)
