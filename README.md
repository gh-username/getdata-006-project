getdata-006-project
===================

course project repo


 This script retrieves and processes raw data files and outputs a "tidy" data set
 in the form of a single, comma-delimitted text file.  Specifically, 
 the script does the following:
         
         1. Downloads a zipped archive of files from a URL.
         2. Unzips the archived files into a directory called "data".
         3. Removes files that are not required for the final data set.
         4. Reads the data files containing the names of the measured/derived variables (referred to as "features" in the original data files).
            These will be assigned to the data set as the column names.
         5. Reads the data files that contain the activities peformmed during the data collection process.
            These will be assigned to the records so that each record shows what activity was performmed.
         6. Selects only measured/derived variables that are calculated means or standard deviations.
         7. Combines training and test data files.
         8. Calculates the means of each variable from the original data set across by subject for each activity.
