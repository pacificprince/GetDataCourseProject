 
## README

The R script `run_analysis.R` creates a tidy data set using the measurement data obtained from various Samsung Galaxy S smartphone accelerometers (original raw data is here [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). 


The raw data is from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The code is divided into the following sections,

1 DOWNLOAD AND UNZIP DATA: Downloads and unzips raw data  
2 MERGE TRAINING AND TEST DATA SETS: The raw data is divided into training and test data sets. These are merged.  
3 ASSIGN ACTIVITY LABELS: Labels are assigned to each activity  
4 APPROPRIATELY LABEL DATA:Labels are assigned to each measured/processed feature  
5 EXTRACT ONLY MEAN AND STD MEASUREMENTS: Mean and standard deviation calculations of measurements are extracted  
6 CREATE TIDY DATA SET: A data set with the average of each variable for each activity and each subject is created  .

See the CodeBook.md file that accompanies this project for more details on the transformation of variables.
