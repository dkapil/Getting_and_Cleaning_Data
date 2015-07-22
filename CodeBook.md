# run_analysis.R CodeBook

## Human Activity Recognition Using Smartphones Data Set 

UCI website:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Direct link to data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


<table border=1 cellpadding=6>
	<tr>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Data Set Characteristics:&nbsp;&nbsp;</b></p></td>
		<td><p class="normal">Multivariate, Time-Series</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Number of Instances:</b></p></td>
		<td><p class="normal">10299</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Area:</b></p></td>
		<td><p class="normal">Computer</p></td>
	</tr>

	<tr>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Attribute Characteristics:</b></p></td>
		<td><p class="normal">N/A</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Number of Attributes:</b></p></td>
		<td><p class="normal">561</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Date Donated</b></p></td>
		<td><p class="normal">2012-12-10</p></td>
	</tr>
	<tr>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Associated Tasks:</b></p></td>
		<td><p class="normal">Classification, Clustering</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Missing Values?</b></p></td>
		<td><p class="normal">N/A</p></td>
		<td bgcolor="#DDEEFF"><p class="normal"><b>Number of Web Hits:</b></p></td>
		<td><p class="normal">203745</p></td>
	</tr>
	<!--
	<tr>
		
		<td bgcolor="#DDEEFF"><p class="normal"><b>Highest Percentage Achieved:&nbsp;&nbsp;</b></p></td>
		<td><p class="normal">N/A</p></td>
	</tr>
	-->
</table>

Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


# Processing data

1 Merges the training and the test sets to create one data set.

2 Extracts only the measurements on the mean and standard deviation for each measurement. 

3 Uses descriptive activity names to name the activities in the data set.

4 Appropriately labels the data set with descriptive variable names. 

5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# run_analysis.R steps

1 Require reshapre2 and data.table libraries.

2 Load both test and train data and features and activity labels.

3 Extract the mean and standard deviation, column names and data.

4 Process the data.

5 Merge data set.

6 Generate a tidy_data.txt file.


# Variables 

Packages: 
	data.table
	reshape2

Tables: 
	features: data from UCI HAR Dataset/features.txt
	extract_features: mean and standard deviation for each measurement of features
	X_test: data from UCI HAR Dataset/test/X_test.txt
	y_test: data from UCI HAR Dataset/test/y_test.txt
	subject_test: data from UCI HAR Dataset/test/subject_test.txt
	test_data: merge tables subject_test, y_test, X_test
	activity_labels: data from UCI HAR Dataset/activity_labels.txt
	X_train: data from UCI HAR Dataset/train/X_train.txt
	y_train: data from UCI HAR Dataset/train/y_train.txt
	subject_train: data from UCI HAR Dataset/train/subject_train.txt
	train_data: merge tables subject_train, y_train, X_train
	data: merge tables test_data, train_data
	
	
	
	
	
	
	
	
	
	
	
	



