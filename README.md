# UCI data

## run_analysis() function

The run_analysis() function processes the UCI data in the following order:

1. Read the data.
2. Label the data set using the feature list, as well as labeling activityID and subjectID columns.
3. Merges the training and test data sets, along with labels.
4. Applies descriptive activity names to the data set, from the activity labels file.
5. Extracts the columns containing the mean and standard deviation for each measurement.
6. Creates a summary data set with the average of each variable (mean/std) for each activity and each subject.

## Summary file output

The summary file contains, for each combination of subject and activity:

* The subject ID
* The activity and ID
* The average for (a) the means, and (b) the standard deviations for all of the readings for that subject for one activity, on X, Y, and Z axes where appropriate.
* Features are normalized and bounded within [-1,1].


