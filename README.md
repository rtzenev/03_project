# Getting and Cleaning Data course project

1. Combine/merge data sets without any preliminary manipulations using RBIND
  * x_train and x_test to become **x_all**
  * y_train and y_test to become **y_all**
  * subject_test and subject_train to become **subject_all**
  
2. Prepare features.txt to be used in R
  * In excel replace non R friendly characters with '.' Example **tBodyAcc-arCoeff()-X,1** becomes **tBodyAcc.arCoeff().X.1**
  * In excel indicate in an additional column if the feature value is relevant for further analysis e.g. the value contains 'mean' or 'std'
  * load feature data set in R. It contains the modified feature value names and additional logical variable indicating relevant columns
  
3. Subset the combined x_all data set
  * replace ALL the column names of x_all with ALL the feature names
  * determine with WHICH the columns that are RELEVANT
  * subset x_all by keping only the relevant columns and obtain x_all_subset
  
4. Add new columns to x_all_subset
  * column 'subject' with subject IDs taken from subject_all data set
  * column 'act_id' with activity IDs taken from y_all data set

5. Replace activity IDs with activity labels
  * merge x_all_subset with act_labels ( read from activity_labels.txt) based on activity ID
  * remove the column 'act_id' since the set now has the activity label column ( SITTING, WALKING.....)

6. Prepare the final tidy set
  * group x_all_subset simultaneously by activity and subject (using dplyr package)
  * summarize each group by mean (using dplyr package)
  * convert back to data frame 
  
et VOILA !
  
  
