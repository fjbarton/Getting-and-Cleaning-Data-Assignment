library(dplyr)

# assumes all required data files are in the current working directory

# load features for use as variable names so can extract mean and std in step 2 
features <- read.table("features.txt")

# load activity labels for use as descriptive activity names in step 3
activity_labels <- read.table("activity_labels.txt")

# load and piece together the train data
subject_train <- read.table("subject_train.txt")
names(subject_train) <- ("subject")

X_train <- read.table("X_train.txt")
names(X_train) <- features[,2]

y_train <- read.table("y_train.txt")
names(y_train) <- ("activitycode")

train_data <- cbind(y_train,subject_train,X_train)

subject_test <- read.table("subject_test.txt")
names(subject_test) <- ("subject")

X_test <- read.table("X_test.txt")
names(X_test) <- features[,2]

y_test <- read.table("y_test.txt")
names(y_test) <- ("activitycode")

test_data <- cbind(y_test,subject_test,X_test)

all_data <- rbind(train_data,test_data)

# step 2
# remove invalid characters from variabe names or get errors in select statement
names(all_data) <- make.names(names=names(all_data), unique=TRUE, allow_ = TRUE)
all_data2 <- select(all_data,activitycode,subject,grep(("mean|std"),names(all_data)))

# step3
# name activity_labels variabes so merge column matches y_data variable
# to simplify merge command and ensure meaningful variable names
names(activity_labels) <- (c("activitycode","activitylabel"))
# do the merge and then strip out the activity code now we have the label
all_data3 <- merge(activity_labels,all_data2) %>%
        select(-activitycode)

# step4 - strip out fullstops from variable names and put them all in lower case
names(all_data3) <- tolower(gsub("\\.","",names(all_data3)))

# step 5 - generate aggregate data
all_data_agg <- aggregate(all_data3,by=list(all_data3$activitylabel,all_data3$subject),mean)
# strip out activitylabel and subject and rename group 1 and 2 and order by them
all_data_agg2 <- select(all_data_agg,-activitylabel,-subject) %>%
        rename(activitylabel=Group.1,subject=Group.2) %>%
        arrange(activitylabel,subject)
# write data to file withour line numbers
write.table(all_data_agg2,"wk4aggdata.txt",row.names=FALSE)
