#Code book

##Transformations

1. The 'activity_labels.txt' file was loaded and stored in activities
2. The 'features.txt' file was loaded and stored in features
3. The 'subject_train.txt' file was loaded and stored in sbj with column name "subject"
4. The 'y_train.txt' file was loaded and stored in sbj with column name "acid"
5. The 'X_train.txt' file was loaded and stored in trdata with the features as column names
6. The columns subject and acid where agreated to the dataframe
7. Steps 3 to 6 are repeated for the test dataset and the resulting dataframe is stored in tstdata
8. The testing and training dataframes are merged
9. A new dataframe is creating holding the values for the means of each feature by using dplyr select and summarise_each
10. The dataframe is then saved to the file "mean_sd_dataset.txt"
11. An aditional dataframe is created and to storethe average of each variable for each activity and each subject using group_by, select and summarise_each
10. The dataframe is then saved to the file "mean_by_activity_and_subject_dataset.txt"

## Data
The data used was collected from the accelerometers from the Samsung Galaxy S smartphone. The relevant files are:

- 'README.txt': contains information about the dataset
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Libraries
Only one library was used:

dplyr (http://cran.r-project.org/web/packages/dplyr/index.html)
