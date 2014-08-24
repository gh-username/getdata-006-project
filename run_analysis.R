# This script retrieves and processes raw data files and outputs a "tidy" data set
# in the form of a single, comma-delimitted text file.  Specifically, 
# the script does the following:
#         
#         1. Downloads a zipped archive of files from a URL.
#         2. Unzips the archived files into a directory called "data".
#         3. Removes files that are not required for the final data set.
#         4. Reads the data files containing the names of the measured/derived variables (referred to as "features" in the original data files).
#            These will be assigned to the data set as the column names.
#         5. Reads the data files that contain the activities peformmed during the data collection process.
#            These will be assigned to the records so that each record shows what activity was performmed.
#         6. Selects only measured/derived variables that are calculated means or standard deviations.
#         7. Combines training and test data files.
#         8. Calculates the means of each variable from the original data set across by subject for each activity.


## Set working directory.
ifelse(tolower(getwd())!="f:/education/coursera data science jhu/03 getting and cleaning data/data/",
               setwd("f:/education/coursera data science jhu/03 getting and cleaning data/data/"), getwd())

## Download zipped data files from website.
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"dataset.zip")

## Unzip the files to /data directory, then delete files that aren't needed.
unzip("dataset.zip", junkpaths=TRUE, exdir="./data")
setwd("./data")
file.remove(c(grep("^body|^total",list.files(),value=TRUE)))

## Create variables for each file.
fileFeatures<-"./features.txt"
fileActivityLabels<-"./activity_labels.txt"

fileTrainSet<-"./X_train.txt"
fileTrainActivity<-"./y_train.txt"
fileTrainSubject<-"./subject_train.txt"

fileTestSet<-"./X_test.txt"
fileTestActivity<-"./y_test.txt"
fileTestSubject<-"./subject_test.txt"

## Create a table for features and assign column names.
tblFeatures<-read.table(fileFeatures, stringsAsFactors=FALSE)
colnames(tblFeatures)<-c('featureID','featureName')

## Create table for activities and assign column names.
tblActivityLabels<-read.table(fileActivityLabels, stringsAsFactors=FALSE)
colnames(tblActivityLabels)<-c('activityID','activityName')

## Create tables for Training data set.
tblTrainSet<-read.table(fileTrainSet)
tblTrainActivity<-read.table(fileTrainActivity, stringsAsFactors=FALSE)
tblTrainSubject<-read.table(fileTrainSubject, stringsAsFactors=FALSE)

## Set column names for Training data set.
colnames(tblTrainSet)<-tblFeatures$featureName
colnames(tblTrainActivity)<-c('activityID')
colnames(tblTrainSubject)<-c('subjectID')

## Create subset of Training data set with only mean and std features.
ssTrainSet<-subset(tblTrainSet,select=c(grep("mean|std",names(tblTrainSet))))
ssTrainSet<-ssTrainSet[,-grep("Freq",names(ssTrainSet))]

## Add descriptive activity column to Training activity table.
library(sqldf)
tblTrainActivity<-sqldf('select a.activityID, b.activityName from tblTrainActivity a, tblActivityLabels b where a.activityID = b.activityID')

## Combine subject, activity and Training sets.
cbTrainSet<-cbind(tblTrainSubject, tblTrainActivity$activityName, ssTrainSet)
colnames(cbTrainSet)[2]<-"activityName"

## Create tables for Test data set.
tblTestSet<-read.table(fileTestSet)
tblTestActivity<-read.table(fileTestActivity, stringsAsFactors=FALSE)
tblTestSubject<-read.table(fileTestSubject, stringsAsFactors=FALSE)

## Set column names for Test data set.
colnames(tblTestSet)<-tblFeatures$featureName
colnames(tblTestActivity)<-c('activityID')
colnames(tblTestSubject)<-c('subjectID')

## Create subset of Test data set with only mean and std features.
ssTestSet<-subset(tblTestSet,select=c(grep("mean|std",names(tblTestSet))))
ssTestSet<-ssTestSet[,-grep("Freq",names(ssTestSet))]

## Add descriptive activity column to Test Activity table.
tblTestActivity<-sqldf('select a.activityID, b.activityName from tblTestActivity a, tblActivityLabels b where a.activityID = b.activityID')

## Combine subject, activity and Test sets.
cbTestSet<-cbind(tblTestSubject, tblTestActivity$activityName, ssTestSet)
colnames(cbTestSet)[2]<-"activityName"

## Create combined data set by combining all records of Training and Test data sets.
tblTrainTestSet<-rbind(cbTestSet,cbTrainSet)

## Remove "()" characters from column names of combined data set.
colnames(tblTrainTestSet)<-gsub("()","",names(tblTrainTestSet),fixed=TRUE)

## Create tidy data set with means of each feature (measured variable) for each subject/activity combination.
tidyDf<-aggregate.data.frame(tblTrainTestSet[,3:68],tblTrainTestSet[,1:2],mean)
tdNames<-names(tidyDf)
colnames(tidyDf)<-vapply(tdNames,nameChange,"",USE.NAMES=FALSE)

## write the tidy data set to a comma-delimitted text file.
write.csv(tidyDf, "tidyData.txt", row.names=FALSE)


## FUNCTIONS ##

nameChange<-function(oldName){
        newName<-""
        baseNew<-"meanOfSubjectActivity"
        if(tolower(oldName) %in% c("subjectid","activityname")){newName<-oldName}else{
                if(substr(oldName,1,1) == "t"){
                        domName<-"TimeDomain"
                        newName<-substr(oldName,2,nchar(oldName))
                        newName<-paste(baseNew,domName,newName,sep="")
                }else{
                        domName<-"FrequencyDomain"
                        newName<-substr(oldName,2,nchar(oldName))
                        newName<-paste(baseNew,domName,newName,sep="")
                }
        }
        return(newName)
}


## Used for Testing only ##
# head(tidyDf[,1:6])
# tail(tidyDf[,1:6])
# nrow(tidyDf)
# ncol(tidyDf)
# names(tidyDf)
# 
# str(tblTrainTestSet)
# summary(tblTrainTestSet)
# print(object.size(tblTrainTestSet),units="Mb")
# tblTrainTestSet[order(tblTrainTestSet$subjectID,tblTrainTestSet$activityName),1:4][1:20,]
# 
# testdf<-tblTestSet[1:5,1:5]
# testsu<-head(tblTestSubject,5)
# head(testsu)
# subset(testdf,select=c(grep("mean|std",names(testdf))))
# 
# head(tblTrainSet,20)
# names(tblTrainSet)
# ncol(tblTrainSet)
# ncol(ssTrainSet)
# head(tblTrainSubject,5)
# nrow(tblTrainSubject)
# 
# head(tblTestSet,20)
# names(tblTestSet)
# nrow(tblTestSet)
# 
# head(tblFeatures,5)
# 
# head(tblTrainActivity,5)
# nrow(tblTrainActivity)
# 
# tblActivityLabels
# tblFeatures$featureName
