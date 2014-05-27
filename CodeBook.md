## CodeBook

This document describes the variables in the file `tidy-data-samsung-galaxy-s-accelerometer-summary.csv` (also see the README file that accompanies this project for more details). The data is proccessed from the raw data using the following steps:

#### DOWNLOAD AND UNZIP DATA 
Data is assumed to be downloaded in the file `samsung-galaxy-s-accelerometer-data.zip` and is unzipped in the current/working directory. (Code to download a zip copy and unzip its contents have been commented out but can be used if necessary).

#### MERGE TRAINING AND TEST DATA SETS 
Variables of interest are `X`, `Subject` and `Y`. Each variable consists of train and test data sets. The training and test datasets are merged in this section. 

The `X` datasets are in fixed-width-format (FWF) files. On my machine (running Windows 7 and R Studio Version 0.97.551) the `read.fwf` function is too slow. So the `LaF` library ([http://cran.r-project.org/web/packages/LaF/vignettes/LaF-manual.pdf](http://cran.r-project.org/web/packages/LaF/vignettes/LaF-manual.pdf)) is used to read the large `X` data sets. A custom function `readfwf` is written for this purpose which takes the *file name*, *fixed-width characters* and the *total number of columns in file* as arguments. 

The `subject` and `y` data sets are pretty straight forward to read as they consist of only a single column of data. The training and test data sets for each variable (`X`, `subject` and `y`) are merged and combined into one dataframe, using `cbind`, called `data`. The `subject` and `y` columns are assigned **Subject** and **ActivityNumber** column names.

#### ASSIGN ACTIVITY LABELS  
A new column, `Activity` is added to `data` which contains activity labels corresponding to the numeric values in the `y` (ActivityNumber) column. The activity names are loaded from the `activity_labels.txt` file.  

#### APPROPRIATELY LABEL DATA
The labels for the `X` dataset are available in the `features.txt` file. The column names are loaded from this file and following replacements made 

* **(** and **)** characters are removed
* **-** is replaced with **_**

The column names are then applied to all the `X` data in the `data` dataframe.

Locations of the mean and standard deviation columns are obtained by searching (using `grep`) through all column names containing `mean` or `std`. For this exercise, this implies that all the means and standard deviation data are considered (regardless whether the data is measured directly (for e.g. most of the time domain signals) or derived (for e.g. most of the frequency domain signals)).

#### EXTRACT ONLY MEAN AND STD MEASUREMENTS
The **mean** and **standard deviation** columns are extracted from `data` into a new dataframe called `data_stat` using the column values obtained in the previous section.

#### CREATE TIDY DATA SET 
A tidy dataframe, `data_tidy`, is created containing the average of each variable for each activity and each subject from the `data_stat` dataframe.


## VARIABLES
Variable names in the file are in `bold` followed by their definition/description.

### Subject
----
- DESCRIPTION: ID of Subject from which accelerometer data is obtained in current study        
- VALUES: 1-30

### Activity
----
- DESCRIPTION: Activity for which corresponding accelerometer data is obtained 
- VALUES:   
	- `LAYING`  
	- `SITTING`   
	- `STANDING`   
	- `WALKING`   
	- `WALKING_DOWNSTAIRS`   
	- `WALKING_UPSTAIRS`  
	
### FEATURES  
----
This is a list of features corresponding to the accelerometer data. For more information of the features, see the `features_info.txt` file in [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Also, see the corresponding `features.txt` file for all the data that was collected during the trials. The prefix `t` in the variables below indicate that they are in the time domain while the `f` indicate the frequency domain (frequency domain data is obtained from the time domain data using a Fourier Transform (FFT)). Only the mean and standard deviation variables, for the test and training data sets, were extracted from the original data file. These were merged with the corresponding `Subject` and `Activity` parameters.  

Each feature below represents the **average of the original corresponding variable** for each activity and each subject.

               
##### tBodyAcc_mean_X              
##### tBodyAcc_mean_Y               
##### tBodyAcc_mean_Z               
##### tBodyAcc_std_X               
##### tBodyAcc_std_Y                
##### tBodyAcc_std_Z                
##### tGravityAcc_mean_X           
##### tGravityAcc_mean_Y            
##### tGravityAcc_mean_Z            
##### tGravityAcc_std_X            
##### tGravityAcc_std_Y             
##### tGravityAcc_std_Z             
##### tBodyAccJerk_mean_X          
##### tBodyAccJerk_mean_Y           
##### tBodyAccJerk_mean_Z           
##### tBodyAccJerk_std_X           
##### tBodyAccJerk_std_Y            
##### tBodyAccJerk_std_Z            
##### tBodyGyro_mean_X             
##### tBodyGyro_mean_Y              
##### tBodyGyro_mean_Z              
##### tBodyGyro_std_X              
##### tBodyGyro_std_Y               
##### tBodyGyro_std_Z               
##### tBodyGyroJerk_mean_X         
##### tBodyGyroJerk_mean_Y          
##### tBodyGyroJerk_mean_Z          
##### tBodyGyroJerk_std_X          
##### tBodyGyroJerk_std_Y           
##### tBodyGyroJerk_std_Z           
##### tBodyAccMag_mean             
##### tBodyAccMag_std               
##### tGravityAccMag_mean           
##### tGravityAccMag_std           
##### tBodyAccJerkMag_mean          
##### tBodyAccJerkMag_std           
##### tBodyGyroMag_mean            
##### tBodyGyroMag_std              
##### tBodyGyroJerkMag_mean         
##### tBodyGyroJerkMag_std         
##### fBodyAcc_mean_X               
##### fBodyAcc_mean_Y               
##### fBodyAcc_mean_Z              
##### fBodyAcc_std_X                
##### fBodyAcc_std_Y                
##### fBodyAcc_std_Z               
##### fBodyAcc_meanFreq_X           
##### fBodyAcc_meanFreq_Y           
##### fBodyAcc_meanFreq_Z          
##### fBodyAccJerk_mean_X           
##### fBodyAccJerk_mean_Y           
##### fBodyAccJerk_mean_Z          
##### fBodyAccJerk_std_X            
##### fBodyAccJerk_std_Y            
##### fBodyAccJerk_std_Z           
##### fBodyAccJerk_meanFreq_X       
##### fBodyAccJerk_meanFreq_Y       
##### fBodyAccJerk_meanFreq_Z      
##### fBodyGyro_mean_X              
##### fBodyGyro_mean_Y              
##### fBodyGyro_mean_Z             
##### fBodyGyro_std_X               
##### fBodyGyro_std_Y               
##### fBodyGyro_std_Z              
##### fBodyGyro_meanFreq_X          
##### fBodyGyro_meanFreq_Y          
##### fBodyGyro_meanFreq_Z         
##### fBodyAccMag_mean              
##### fBodyAccMag_std               
##### fBodyAccMag_meanFreq         
##### fBodyBodyAccJerkMag_mean      
##### fBodyBodyAccJerkMag_std       
##### fBodyBodyAccJerkMag_meanFreq 
##### fBodyBodyGyroMag_mean         
##### fBodyBodyGyroMag_std          
##### fBodyBodyGyroMag_meanFreq    
##### fBodyBodyGyroJerkMag_mean     
##### fBodyBodyGyroJerkMag_std      
##### fBodyBodyGyroJerkMag_meanFreq
