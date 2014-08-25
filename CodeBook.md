##### ABOUT THE ORIGINAL DATA SOURCE

The file "tidyData.txt"" is based on the data originally collected by: Davide Anguita,
Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop
of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person (subject) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity 
at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain.

See below for the description of the original data source from the 
README file provide with the data files.


##### HOW THE ORIGINAL DATA SOURCE WAS PROCESSED

There are two main data groups from the original data source: Test Data and Training Data.  There are three files from the original data source which together represent a data group.  The names of these files begin with the prfixes "x_", "y_", and "subject" followed by the data group ("test" and "train").

The data group "Test Data" involves the files:

- x_test.txt (the data set of measured/derived variables without headings/labels to describe them)
- y_test.txt (a "single column" data file which tells which activity was measured by each row in the data set)
- subject_test.txt (a "single column" data file which tells which subject was measured by each row in the data set)

The data group "Training Data" involves the files (descriptions are the same as above):

- x_train.txt
- y_train.txt
- subject_train.txt
 
In addition to the files that provide the data sets for collected data, there are two files that are used to supply descriptive information to the data sets:

- features.txt (a "single colum" data file which provids the headings/labels which describe the measured/derived variables of the data sets beginning with "x_". Each record in the file corresponds to a variable in the data set and the records are ordered such that the first record corresponds of the file to the first varialbe of the data set, the second record of the file corresponds to the second varialbe of the data set, etc.)
- activity_labels.txt (a file that can be used to link the activity ID #s provided in the "y_" files to descriptions of the activities that were performed by each subject.)

The data set in the file "tidyData.txt" is produced by the following steps: 

1. The Test and Training data sets are combined together in a manner that results in the Training data being appended to the Test data.  In otherwords the first record of the Training data set follows immediately after the last record of the Test data set in the final combined data set.
2. Data for measured/derived variables that are not calculated means or standard deviations are removed from the data set created in step 1.
3. The data set created in step 2 is updated in such a way as to reflect the activities performed and the subject who performed them in each measurement.
4. The mean of each measured/derived variable is calculated for each subject/activity in the data set created in step 3.  In other words, if subject 1 did activity 1 36 times, the 36 resulting measurements are used to calculate the mean for this subject doing this activity.  These means are what is shown in the final data set which is written to the file "tidyData.txt".
5. The headings/labels of the data set created in step 4 are updated to reflect the data represented in the final data set.  The headings created are as follows:
 
- subjectID
- activityName
- meanOfSubjectActivityTimeDomainBodyAcc-mean-X
- meanOfSubjectActivityTimeDomainBodyAcc-mean-Y
- meanOfSubjectActivityTimeDomainBodyAcc-mean-Z
- meanOfSubjectActivityTimeDomainBodyAcc-std-X
- meanOfSubjectActivityTimeDomainBodyAcc-std-Y
- meanOfSubjectActivityTimeDomainBodyAcc-std-Z
- meanOfSubjectActivityTimeDomainGravityAcc-mean-X
- meanOfSubjectActivityTimeDomainGravityAcc-mean-Y
- meanOfSubjectActivityTimeDomainGravityAcc-mean-Z
- meanOfSubjectActivityTimeDomainGravityAcc-std-X
- meanOfSubjectActivityTimeDomainGravityAcc-std-Y
- meanOfSubjectActivityTimeDomainGravityAcc-std-Z
- meanOfSubjectActivityTimeDomainBodyAccJerk-mean-X
- meanOfSubjectActivityTimeDomainBodyAccJerk-mean-Y
- meanOfSubjectActivityTimeDomainBodyAccJerk-mean-Z
- meanOfSubjectActivityTimeDomainBodyAccJerk-std-X
- meanOfSubjectActivityTimeDomainBodyAccJerk-std-Y
- meanOfSubjectActivityTimeDomainBodyAccJerk-std-Z
- meanOfSubjectActivityTimeDomainBodyGyro-mean-X
- meanOfSubjectActivityTimeDomainBodyGyro-mean-Y
- meanOfSubjectActivityTimeDomainBodyGyro-mean-Z
- meanOfSubjectActivityTimeDomainBodyGyro-std-X
- meanOfSubjectActivityTimeDomainBodyGyro-std-Y
- meanOfSubjectActivityTimeDomainBodyGyro-std-Z
- meanOfSubjectActivityTimeDomainBodyGyroJerk-mean-X
- meanOfSubjectActivityTimeDomainBodyGyroJerk-mean-Y
- meanOfSubjectActivityTimeDomainBodyGyroJerk-mean-Z
- meanOfSubjectActivityTimeDomainBodyGyroJerk-std-X
- meanOfSubjectActivityTimeDomainBodyGyroJerk-std-Y
- meanOfSubjectActivityTimeDomainBodyGyroJerk-std-Z
- meanOfSubjectActivityTimeDomainBodyAccMag-mean
- meanOfSubjectActivityTimeDomainBodyAccMag-std
- meanOfSubjectActivityTimeDomainGravityAccMag-mean
- meanOfSubjectActivityTimeDomainGravityAccMag-std
- meanOfSubjectActivityTimeDomainBodyAccJerkMag-mean
- meanOfSubjectActivityTimeDomainBodyAccJerkMag-std
- meanOfSubjectActivityTimeDomainBodyGyroMag-mean
- meanOfSubjectActivityTimeDomainBodyGyroMag-std
- meanOfSubjectActivityTimeDomainBodyGyroJerkMag-mean
- meanOfSubjectActivityTimeDomainBodyGyroJerkMag-std
- meanOfSubjectActivityFrequencyDomainBodyAcc-mean-X
- meanOfSubjectActivityFrequencyDomainBodyAcc-mean-Y
- meanOfSubjectActivityFrequencyDomainBodyAcc-mean-Z
- meanOfSubjectActivityFrequencyDomainBodyAcc-std-X
- meanOfSubjectActivityFrequencyDomainBodyAcc-std-Y
- meanOfSubjectActivityFrequencyDomainBodyAcc-std-Z
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-mean-X
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-mean-Y
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-mean-Z
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-std-X
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-std-Y
- meanOfSubjectActivityFrequencyDomainBodyAccJerk-std-Z
- meanOfSubjectActivityFrequencyDomainBodyGyro-mean-X
- meanOfSubjectActivityFrequencyDomainBodyGyro-mean-Y
- meanOfSubjectActivityFrequencyDomainBodyGyro-mean-Z
- meanOfSubjectActivityFrequencyDomainBodyGyro-std-X
- meanOfSubjectActivityFrequencyDomainBodyGyro-std-Y
- meanOfSubjectActivityFrequencyDomainBodyGyro-std-Z
- meanOfSubjectActivityFrequencyDomainBodyAccMag-mean
- meanOfSubjectActivityFrequencyDomainBodyAccMag-std
- meanOfSubjectActivityFrequencyDomainBodyAccJerkMag-mean
- meanOfSubjectActivityFrequencyDomainBodyAccJerkMag-std
- meanOfSubjectActivityFrequencyDomainBodyGyroMag-mean
- meanOfSubjectActivityFrequencyDomainBodyGyroMag-std
- meanOfSubjectActivityFrequencyDomainBodyGyroJerkMag-mean
- meanOfSubjectActivityFrequencyDomainBodyGyroJerkMag-std

These headings are derived from the measured/derived variables (called features) of the original data source and are detailed in the file "features_info.txt".  Here is how the original featues are described:

```
Feature Selection 
=================
```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

##### README NOTES FROM ORIGINAL DATA SOURCE
```
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
```
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

```
For each record it is provided:
======================================
```
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

```
The dataset includes the following files:
=========================================
```
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

```
Notes: 
======
```
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

```
License:
========
```
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
