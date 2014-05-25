setwd("~/Miscellaneous/Coursera/Getting-And-Cleaning-Data/Course-Project")

###############################################################################
#                   0. DOWNLOAD AND UNZIP DATA                                #
###############################################################################
# Download zip file
zipFileName <- "samsung-galaxy-s-accelerometer-data.zip"
zipFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(zipFileURL, destfile=zipFileName)

# unzip(zipFileName)
#------------------------------------------------------------------------------
# Get data_dir directly by from list contents of zip file
data_dir <- unlist(strsplit(unzip(zipFileName, list=TRUE)[1, 1], '/'))[1]
###############################################################################




###############################################################################
#                   1. MERGE TRAINING AND TEST DATA SETS                      #
###############################################################################
# FUNCTION: readfwf
#=============================================================================
readfwf <- function(fwf_file, fixedwidth, ncols){
#=============================================================================
  # Function to read a fixed-width-format file
  # This function uses the LaF package as the read.fwf 
  # function is too slow on a large file :(
  # Used guidelines from LaF manual at
  # http://cran.r-project.org/web/packages/LaF/vignettes/LaF-manual.pdf
  # Inputs:
  # fwf_filename: fixed-width-format filename
  # fixedwidth: number of fixed-width characters per entry
  # ncols: total number of columns in file
  # Outputs:
  # data: dataframe of data from fwf_file 
  #       with dummy column names X1, X2, ... etc
  
  library(LaF)
  
  # Define column types and width of data in each column
  coltypes <- rep("double", ncols)
  colwidths <- rep(fixedwidth, ncols)
  
  # Generate dummy column names, replace with desired column names later
  colnames <- paste0(rep("X", ncols), unlist(lapply(seq(ncols), toString)))  
  
  data_laf <- laf_open_fwf(filename = fwf_file, 
                           column_types = coltypes, 
                           column_names = colnames, 
                           column_widths = colwidths)
  
  data <- as.data.frame(data_laf[, ])
  
  return (data)
}
#=============================================================================

#------------------------------------------------------------------------------
# Merge X data from test and train sets
#------------------------------------------------------------------------------
x_file <- c()
x_file[1] <- paste0(data_dir,"/train","/X_train",".txt")
x_file[2] <- paste0(data_dir,"/test","/X_test",".txt")

x_ncols <- 561
x_fixedwidth <- 16

data_x <- rbind(readfwf(x_file[1], x_fixedwidth, x_ncols),
                readfwf(x_file[2], x_fixedwidth, x_ncols))
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Merge Y data from test and train sets
#------------------------------------------------------------------------------
y_file <- c()
y_file[1] <- paste0(data_dir,"/train","/y_train",".txt")
y_file[2] <- paste0(data_dir,"/test","/y_test",".txt")

data_y <- rbind(read.csv(y_file[1], header=FALSE),
                read.csv(y_file[2], header=FALSE))

colnames(data_y) <- "ActivityNumber"
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Merge Subject data from test and train sets
#------------------------------------------------------------------------------
s_file <- c()
s_file[1] <- paste0(data_dir,"/train","/subject_train",".txt")
s_file[2] <- paste0(data_dir,"/test","/subject_test",".txt")

data_s <- rbind(read.csv(s_file[1], header=FALSE),
                read.csv(s_file[2], header=FALSE))

colnames(data_s) <- "Subject"
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# Merge ALL data from test and train sets
#------------------------------------------------------------------------------
data <- cbind(data_x, data_s, data_y)
###############################################################################




###############################################################################
#                     2. ASSIGN ACTIVITY LABELS                               #
###############################################################################
activity_labels <- read.table(paste0(data_dir, "/", "activity_labels.txt"), 
                              header=FALSE, sep=" ")
colnames(activity_labels) <- c("Number", "Activity")

data$Activity <- activity_labels$Activity[data$ActivityNumber]




###############################################################################
#                     3. APPROPRIATELY LABEL DATA                             #
###############################################################################

# Data labels are in the features.txt file
x_labels <- read.table(paste0(data_dir, "/", "features.txt"), header=FALSE)[2]
x_labels <- as.list(x_labels)

# Clean up labels (remove special characters etc.)
x_labels <- sapply(x_labels, gsub, pattern="angle\\(", replacement="angle_")
x_labels <- sapply(x_labels, gsub, pattern="-|,", replacement="_")
x_labels <- sapply(x_labels, gsub, pattern="\\(|\\)", replacement="")
names(x_labels) <-NULL

# Get locations of mean and std labels
loc_mean <- grep("mean", x_labels, ignore.case=FALSE)
loc_std <- grep("std", x_labels, ignore.case=FALSE)
# Combine mean and std locations
loc_stat <- sort(c(loc_mean, loc_std))

# Apply labels to data
colnames(data)[1:x_ncols] <- x_labels
###############################################################################




###############################################################################
#                     4. EXTRACT ONLY MEAN AND STD MEASUREMENTS               #
###############################################################################
data_stat <- data[, c(loc_stat, x_ncols+1, x_ncols+3)]




###############################################################################
#                     5. CREATE TIDY DATA SET                                 #
###############################################################################
# Tidy data set := Average of each variable for each activity and each subject

library(plyr)
data_tidy <- ddply(data_stat, c("Subject", "Activity"), numcolwise(mean))

# Export data set to csv file to upload on course website
out_file <- "tidy-data-samsung-galaxy-s-accelerometer-summary.txt"
write.csv(data_tidy, out_file, row.names=FALSE)
