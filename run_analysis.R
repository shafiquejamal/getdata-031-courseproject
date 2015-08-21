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
test_data_without_ids <- read.table('X_test.txt', col.names = variable.names)
test_ids <- read.table('Y_test.txt', col.names = c("id"))
test_data <- bind_cols(test_ids, test_data_without_ids)

# Assemble training data set
train_data_without_ids <- read.table('X_train.txt', col.names = variable.names)
train_ids <- read.table('Y_train.txt', col.names = c("id"))
train_data <- bind_cols(train_ids, train_data_without_ids)

# Join testing and training set
full_data <- bind_rows(test_data, train_data)

####################################################################################
#
# Part 2: Extracts only the measurements on the mean and standard deviation for each 
#           measurement. 
#
####################################################################################

means_sds <- select(full_data, id, contains("mean"), contains("std"))

