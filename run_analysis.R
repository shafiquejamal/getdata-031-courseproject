library(dplyr)

####################################################################################
#
# Part 1: Merges the training and the test sets to create one data set.
#
####################################################################################

# Load the variable names
features <- read.table('features.txt')
variable_names <- as.character(features[,2])

# Assemble test data set
test_data_without_activities <- read.table('X_test.txt', col.names = variable.names)
test_activities <- read.table('Y_test.txt', col.names = c("activity"))
test_data <- bind_cols(test_activities, test_data_without_activities)

# Assemble training data set
train_data_without_activities <- read.table('X_train.txt', col.names = variable.names)
train_activities <- read.table('Y_train.txt', col.names = c("activity"))
train_data <- bind_cols(train_activities, train_data_without_activities)

# Join testing and training set
full_data <- bind_rows(test_data, train_data)

####################################################################################
#
# Part 2: Extracts only the measurements on the mean and standard deviation for each 
#           measurement. 
#
####################################################################################

means_sds <- select(full_data, activity, contains("mean"), contains("std"))

####################################################################################
#
# Part 3: Uses descriptive activity names to name the activities in the data set 
#       
####################################################################################

# read in the activities file into a dataframe, then merge it into the existing 
#   dataframe
activities <- read.table('activity_labels.txt')
names(activities) <- c("activity_number", "activity_name")
names(means_sds)[names(means_sds)=="activity"] <- "activity_number"
merged <- merge(means_sds, activities, 'activity_number', 'activity_number')
names(merged)[is.na(names(merged))] <- "activity_name"

####################################################################################
#
# Part 4: Appropriately labels the data set with descriptive variable names. 
#       
####################################################################################

# Done - I did this while reading in the data.
# I think the variable names are fine as is. But, I will change Acc to Acceleration,
#   Gyro to Gyroscope, and get rid of double-dots
names(merged) <- sub("Gyro", "Gyroscope", names(means_sds))
names(merged) <- sub("Acc", "Acceleration", names(means_sds))
names(merged) <- sub("\\.\\.\\.", ".", names(means_sds))
names(merged) <- sub("\\.\\.$", "", names(means_sds))
names(merged) <- sub("\\.\\.", ".", names(means_sds))
names(merged) <- sub("\\.$", "", names(means_sds))
names(merged) <- sub("^t", "time", names(means_sds))
names(merged) <- sub("^f", "freq", names(means_sds))
names(merged) <- sub("BodyBody", "Body", names(means_sds))
names(merged) <- sub("angle.tBody", "angle.timeBody", names(means_sds))

