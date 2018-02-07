# Solution for Coursera Course Projekt - Getting and Cleaning Data
## Data
This repository cointains the file run_analysis.R which tidys the data stored in ./data in this working directory.
A full description of the data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project which should be unzipped in the folder ./data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Run the Script
1. To run the script first """dplyr""" has to be installed, if not run """install.packages('dplyr')""".
2. Change the working directory to the projects directory.
3. Enter """source('run_analysis.R')"""

## Script
The """run_analysis.R""" script does the following to the data to tidy it:
1. Loads and Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. And saves it into """tidy_data.txt"""

## Tidy Data
The tidy data can be found afterwards in the file """tidy_data.txt""".
A explanation of the data in """tidy_data.txt""" can be found in the """CodeBook.md""" file in this Repo.

