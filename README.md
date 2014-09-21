Cleaning_Data_Course-Project
============================

1. Files ‘X_train’, ‘Y_train’ and ‘subject_train’ were read into R and given similar data frame names. 

2. Files ‘X_test’, ‘Y_test’ and ‘subject_test’ were read into R

3. the features.txt file was read in and list of features extracted and then use label the column names in the x_train and x_test data sets.

4. data frame with similar dimensions were bound together (bind, rbind), i.e. x_train with x_test and subject_train with subject_test. 

5. Select measurements of MEAN and STD in combined data (x_full) 
   
6. Add Subject ID's and Activity ID to the dataset

7. Rename cols for Subject ID

8. Replace Activity ID's with descriptive activity names

9. Create a 'tidy_dataset' with the calculated means for each 

10. Write 'tidy dataset.’txt to a .txt file 


** to Read 'tidy dataset.txt’ back into R run the following code. (courtesy of David Hood FAQ) 

 data <- read.table(‘tidy_data.txt’, header = TRUE) 
    View(data)



