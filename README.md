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
