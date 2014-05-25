 
## README

The R script `run_analysis.R` creates a tidy data set using the measurement data obtained from various Samsung Galaxy S smartphone accelerometers (original raw data is here [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). The code is divided into the following sections,


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