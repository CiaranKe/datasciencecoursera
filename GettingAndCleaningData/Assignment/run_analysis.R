library(dplyr)
library(tidyr)

X_TEST <- 'UCI HAR Dataset/test/X_test.txt'
X_TRAIN <- 'UCI HAR Dataset/train/X_train.txt'
Y_TEST <- 'UCI HAR Dataset/test/Y_test.txt'
Y_TRAIN <- 'UCI HAR Dataset/train/Y_train.txt'
SUB_TEST <- 'UCI HAR Dataset/test/subject_test.txt'
SUB_TRAIN <- 'UCI HAR Dataset/train/subject_train.txt'
FEATURES <- 'UCI HAR Dataset/features.txt'
ACTIVITY_LABELS <- 'UCI HAR Dataset/activity_labels.txt'

CHAR <- 'character'
ACTIVITY_ID <- 'ActivityID'
ACTIVITY_NAME <- 'Activity'
FEATURE_ID <- 'FeatureId'
FEATURE_NAME <- 'Feature'
SUBJECT_NAME <- 'Subject'
EXPRESION_COLS <- '(mean)|(std)|(Subject)'
EXPRESION_BRACES <- '\\(|\\)'
NOTHING <- ''


run_analysis <- function(write.file=FALSE, file.name='TidyData.csv' ) {
        #main function combines the traininng and test datasets returns a
        #tidy dataset
        #saves dataset to file or returns dataset based on user input.
        
        #get the datasets and merge them
        data <- mergeDataSets(combineDataSet(X_TEST,X_TRAIN),
                              combineDataSet(Y_TEST,Y_TRAIN),
                              combineDataSet(SUB_TEST,SUB_TRAIN))
        #combine the data and feature labels for the datasets
        data <- setDataLabels(data, getFeatureLabels()$Feature)
        #limit the columns in the dataset to the mean and Std Variations
        data <- limitCols(data)
        # rename the columns to with appropriate names.
        data <- labelActivities(data)
        # return a dataset containing the mean of the mean/std dev variables
        # by activity and subject.
        data <- summarise_each(group_by(data, Activity,Subject), funs(mean))
        if(write.file){
                write.table(data, file=file.name, sep = ',', row.names=F)
        }
        else{
                return(data)
        }
}

 
mergeDataSets <- function(data, labels, subjects) {
        # combine the X, Y and subject datasets
        mergedData <- cbind(cbind(data, subjects), labels)
        return (mergedData)
}

combineDataSet <- function(test_in, train_in){
        #Get the Training and test data sets and merge them
        test <- read.table(test_in, header = FALSE)
        train <- read.table(train_in, header = FALSE)        
        combined <- rbind(test, train)
        rm(test)
        rm(train)
        return (combined)
}


getFeatureLabels <- function (){
        #read in the current list of features from file
        features <- read.table(FEATURES, colClasses = c(CHAR), col.names = 
                                       c(FEATURE_ID, FEATURE_NAME))
        #add our subject and activityid column names
        features <- rbind(rbind(features, c(562, SUBJECT_NAME)), 
                          c(563, ACTIVITY_ID))
        return (features)
}

getActivityLabels <- function (){
        #read in the list of activities from disk
        activityLabels <- read.table(ACTIVITY_LABELS, col.names = 
                                             c(ACTIVITY_ID, ACTIVITY_NAME))
        #return them
        return (activityLabels)
}

setDataLabels <- function(data, labels) {
        #apply the column (feature) names to the merged dataset
        names(data) <- labels
        return (data)
}

limitCols <- function(data) {
        #Limit data columns to Mean and Standard deviation 
        
        #get the list of columns we are interested in        
        selectedCols <- grepl(EXPRESION_COLS, names(data))
        #add the activity labels to the dataset
        data <- inner_join(data, getActivityLabels(), by=ACTIVITY_ID)
        #remove the uneeded columns
        data <- data[,selectedCols]
        return (data)
}

labelActivities <- function(data) {
        #tidy up the column names
        names(data) <- gsub(EXPRESION_BRACES, NOTHING, names(data))
        names(data) <- gsub('^t', 'Time', names(data))
        names(data) <- gsub('^f', 'Frequency', names(data))
        names(data) <- gsub('Acc', 'Acceleration', names(data))
        names(data) <- gsub('GyroJerk', 'AngularAcceleration', names(data))
        names(data) <- gsub('Gyro', 'AngularSpeed', names(data))
        names(data) <- gsub('Mag', 'Magnitude', names(data))
        names(data) <- gsub('-mean', 'Mean', names(data))
        names(data) <- gsub('-std', 'StandardDeviation', names(data))
        names(data) <- gsub('Freq-', 'Frequency-', names(data))
        names(data) <- gsub('Freq$', 'Frequency', names(data))
        names(data) <- gsub('-', NOTHING, names(data))
        return (data)
}