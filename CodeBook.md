---
title: "CodeBook.md"
author: "KirbyArinder"
date: "Sunday, December 21, 2014"
output: html_document
---

Except for one, the variable names in the file that results from this script are
built out of elemental components that, in combination, describe what the variable measures.  As
such, it's easier to describe the elemental components first, and then simply list
the combinations that were actually used in the final output file.  The meanings
of the variables should then be clear.  

The one variable name not built out of the elemental components below is 'SubAct'.  SubAct
is the concatenation of a numerical subject identifier and a numerical activity 
identifier.  There were thirty subjects; the numerical subject identifiers ranged
from 1-30.  The numerical activity identifiers corresponded to the following
activities, as described in the documentation from which this file was derived:  

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


Thus, an observation corresponding to the case in which subject 1 was 
sitting down would have the SubAct value 1_4.  All subjects completed all activities; 
thus, there were 180 unique SubAct values.

(Of course, SubAct can be considered a result of two more primitive variables.  But
this does not disqualify it from being a variable itself, any more than "arm position"
cannot be a variable because it is derivable from "elbow position" and "shoulder 
position."  SubAct can be derived from subject number and activity number, but 
the reverse is also true; which one is more "primitive" is a matter of perspective.
For ease of coding, I have chosen to adopt the perspective that SubAct should be
primitive in this case.)  

All other variable names in use in the file that results from this script were built
from elemental components, as described above.  The elemental components of 
the variables are described below.  All material between triple asterisks -- *** --
is a quotation from the features_info documentation from the original data.  

***
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

***

Thus, any actual variable name can be constructed from whether it is a time-domain or Fourier-transform variable, the physical phenomenon
it measures, the axis, if any, of movement, and the type of information it presents (mean, interquartile range, signal entropy, etc.) about
the physical phenomenon it measures. 

There are 561 combinations of the above factors in use in the source data.  Of those, the eighty presenting mean and standard deviation -- 
including mean frequency -- about the physical phenomena with which they are concerned are presented.  Variables whose physical phenomenon was
itself a mean -- e.g., tBodyAccMean -- were not included; it was assumed based on phrasing that the assignment wanted only means of underlying measurements,
not underlying measurements that were themselves means.   

The eighty variable names actually used in this output file are as follows:  
 
SubAct
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-meanFreq()
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()

All variables except SubAct are normalized with a minimum of -1 and a maximum of 1.  SubAct is nominal data.  

In order to produce the final data set with the above variables, it was first necessary to bind together the
information from the  
subject_test and subject_train files, the X_test and x_train files, and the y_test and y_train files.  The
merged subject files then contained all observations of subject identifiers, in order; the merged y files contained all
observations of 
activity identifiers, in order; and the merged x files contained all other observations, in order.  The
x and y files were concatenated to produce what would become the SubAcc column.  

The merged x files were subsetted such that only those columns corresponding to a mean or standard 
deviation of the underlying measurement were retained
