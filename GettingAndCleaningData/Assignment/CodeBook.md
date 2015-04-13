#Code Book

##Raw Data 
The raw data used in this project was obtained from the [UCI Machine Learning repository](http://archive.ics.uci.edu/ml/); The data set was taken from the [Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The dataset was built using experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) whilst wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using the devices' embedded accelerometer and gyroscope, the experiment a captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The original dataset was then randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 


The original dataset provided the following information for each observation: 

* Triaxial acceleration from the accelerometer.
* Estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* An activity label.
* An identifier of the subject was observed.

The files containing this information were as follows:

* features.txt: A list of all the variables measured in the experiment.
* activity_labels.txt: A list of activities and repsective IDs
* train/X_train.txt: The training dataset (observations).
* train/y_train.txt: Training labels.
* train/subject_train.txt: Identifier for each subject for which the observations were obtained, in the training dataset.
* test/X_test.txt: The test dataset (observations).
* test/y_test.txt: Test labels.
* test/subject_test.txt: Identifier for each subject for which the observations were obtained, in the training dataset.

##Data transformation

The following steps are performed by the `run_analysis.R` script to merge and transform the orginal datasets:

1. The observations contained in `train/X_train.txt` and `test/X_test.txt` are merged (by row) into a single dataset.
2. The labels contained in `train/y_train.txt` and `test/y_test.txt` are merged (by row) into a single set of labels.
3. the subject identifiers in `train/subject_train.txt` and `test/subject_test.txt` are merged (by row) into a single set of subject identifiers.
4. The three datasets listed in steps `1-3` are merged (by column) to provide a single dataset
5. The variables contained in `features.txt` are loaded and applied to the  single dataset (`Step 4`) as column names.
6. The columns for the comined dataset are filtered to exclude any variable that is not one of: a Mean value, a Standard Deviation value, The subject identifier. This is done using a regular expression (`mean|std|Subject`).
7. The feaures (column names) in the transformed dataset are renamed using the following rules:
  * Braces were removed: (`'\\(|\\)' -> ''`)
  * `t` at the begining of a line was replaced with `Time`: (`'^t' -> 'Time'`)
  * `f` at the begining of a line was replaced with `Frequency`: (`'^f' -> 'Frequency'`)
  * `Acc` was replaced with `Acceleration`: (`'Acc' -> 'Acceleration'`)
  * `GyroJerk` was replaced with `AngularAcceleration`: (`'' -> ''`)
  * `Gyro` was replaced with `AngularSpeed`: (`'Gyro' -> 'AngularSpeed'`)
  * `Mag` was replaced with `Magnitude`: (`'Mag' -> 'Magnitude'`)
  * `-mean` was replaced with `Mean`: (`'-mean' -> 'Mean'`)
  * `-std` was replaced with `StandardDeviation`: (`'-std' -> 'StandardDeviation'`)
  * `Freq-` was replaced with `Frequency-`: (`'Freq-' -> 'Frequency-'`)
  * `Freq` at the end of a line was replaced with `Frequency`: (`'Freq$' -> 'Frequency'`)
  * All occurances of a dash `-` were removed: (`'-' -> ''`)

##Tidied Data

The table below describes the tidied dataset.

| Column                   | Description                                                                  |   |
|--------------------------|------------------------------------------------------------------------------|---|
| Activity                 | The activity performed, as defined in `activity_labels.txt`                  |   |
| Subject                  | The id of the subject from which the observation was obtained                |   |
| Features [Columns 3 - 81]| The combined value from the test and training datasets                       |   |

For columns 3 - 81 in the tidied data set, these columns contain the mean or the standard deviations from the original data sets.  As per the rules defined above (`Step 7`), were a feature was listed in the orginal dataset as `tBodyAcc-mean()-X` it would appear as `TimeBodyAccelerationMeanX` in the tidied data.