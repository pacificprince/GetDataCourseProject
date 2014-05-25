## CodeBook

This document describes the variables in the file `tidy-data-samsung-galaxy-s-accelerometer-summary.csv`. For details on how this file was processed using the raw data please see the `README.md` file that accompanies this project.

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