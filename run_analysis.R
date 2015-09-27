run_analysis <- function()
{
	## Read source data; add variable names
	## 4. Appropriately labels the data set with descriptive variable names. 

	features <- read.table("features.txt")

	testset <- read.table("X_test.txt", col.names=features$V2)
	trainset <- read.table("X_train.txt", col.names=features$V2)

	testlabels <- read.table("y_test.txt", col.names="activityID")
	testsubject <- read.table("subject_test.txt", col.names="subjectID")

	trainlabels <- read.table("y_train.txt", col.names="activityID")
	trainsubject <- read.table("subject_train.txt", col.names="subjectID")

	## 1. Merges the training and the test sets to create one data set.

	testlabeled <- cbind(testlabels, testsubject, testset)
	trainlabeled <- cbind(trainlabels, trainsubject, trainset)
	testtrain <- rbind(testlabeled, trainlabeled)

	## 3. Uses descriptive activity names to name the activities in the data set.

	labels <- read.table("activity_labels.txt", col.name=c("activityID", "activity"))
	merged <- merge(labels, testtrain, by = "activityID")

	## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

	keepcols <- c(1,2,3,grep(".std|.mean", names(merged)))  ## Keep subject, activity, and std/mean columns
	merged <- merged[,keepcols]

	## 5. From the data set in step 4, creates a second, independent tidy data set with 
	## the average of each variable for each activity and each subject.

	library(dplyr)
	grouped <- group_by(merged, subjectID, activity)
	summary <- summarize_each(grouped, funs(mean))
	write.table(summary, "summary.txt", row.name=FALSE)

}
