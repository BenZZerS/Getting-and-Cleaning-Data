## Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### How to Use
1. Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip the source into a folder on the local drive.
2. Put `”run.analysis.R”` in the same directory in step 1
3. Use command `setwd()` in R Studio to set current working directory.
4. Run `run.analysis.R` script.
5. The two output files below will generate in the current working directory
  * **1-tidyData.txt** - The tidy data set of UCI HAR Dataset.
  * **2-avgTidydata.txt** - The independent tidy data set with the average of each variable for each activity and each subject.
5. Run the following command in R to read the files.
```
tidyData <- read.table("1-tidyData.txt", head = TRUE)
avgTidydata <- read.table("2-avgTidydata.txt", head = TRUE)
```