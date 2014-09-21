list.files()

#Read TRAIN data
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')
subject_train <- read.table('train/subject_train.txt')

#Read TEST Data
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
subject_test <- read.table('test/subject_test.txt')

#READ and rename COL NAMES from 'features.txt' 
feature_colnames <- read.table('features.txt')
colnames(x_train) <- feature_colnames$V2
colnames(x_test) <- feature_colnames$V2

#BIND TEST and TRAIN DATA 
x_full <- rbind(x_train, x_test)
y_full <- rbind(y_train, y_test)
subject_full <- rbind(subject_train, subject_test)

# Select measurements of MEAN and STD x_full 
mean_grep <- grep('mean', x= feature_colnames$V2, ignore.case = TRUE)
std_grep <- grep('std', x= feature_colnames$V2, ignore.case = TRUE)
combined_grep <- c(mean_grep, std_grep)
x_mean_std <- x_full[,combined_grep]

# Add Subject ID's and Activity ID to the dataset
full_data <- cbind(subject_full, y_full,x_mean_std)

# Rename cols for Subject ID
colnames(full_data)[2] <- 'Activity'
colnames(full_data)[1] <- 'Subject_ID'

# Replace Activity ID's with descriptive activity names
full_data$Activity[full_data$Activity == 1] <- 'WALKING'
full_data$Activity[full_data$Activity == 2] <- 'WALKING_UPSTAIRS'
full_data$Activity[full_data$Activity == 3] <- 'WALKING_DOWNSTAIRS'
full_data$Activity[full_data$Activity == 4] <- 'SITTING'
full_data$Activity[full_data$Activity == 5] <- 'STANDING'
full_data$Activity[full_data$Activity == 6] <- 'LAYING'

# Create a 'tidy_dataset' with the calculated means for each 
# variable by activity and subject
tidy_dataset <- ddply(full_data, .(full_data$Subject_ID,full_data$Activity),
                       numcolwise(mean))

#Write 'tidy dataset' to a .txt file 
write.table(tidy_dataset, file = 'tidy_dataset.txt', row.names = FALSE)

