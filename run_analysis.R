#This is going to be the course project for Getting and Cleaning Data

#This first part just reads the files from your working directory.  

subject_test <- read.table("subject_test.txt", stringsAsFactors = FALSE) #2947 rows 1 col (24 subjects)
subject_train <- read.table("subject_train.txt", stringsAsFactors = FALSE) #7352 rows (30 subjects)
x_test <- read.table("X_test.txt", stringsAsFactors = FALSE) #2947 rows 561 columns
x_train <- read.table("X_train.txt", stringsAsFactors = FALSE) #7352 rows 561 columns
y_test <- read.table("y_test.txt", stringsAsFactors = FALSE) #2947 rows 1 column
y_train <- read.table("y_train.txt", stringsAsFactors = FALSE) #7352 rows 1 columns
features <- read.table("features.txt", stringsAsFactors = FALSE) #561 rows 2 columns -- names of x columns

#This pulls out the column names from features and assigns them to a vector for renaming use later.  

colnames <- as.vector(features$V2) #a vector with 561 names, to attach to the joined x set.  

#This next bit joins and renames the x sets into xfull 

xfull <- rbind(x_test, x_train) #10299 rows 561 columns
names(xfull) <- colnames #renames all the columns with what they are.  Useful for subsetting later

#This next bit joins and renames the y sets into yfull, which will be the column of activities

yfull <- rbind(y_test, y_train) #10299 rows 1 column
names(yfull) <- c("Activity") #renames this single column Activity, useful for joining later

#This next bit joins and renames the subject sets into subjectfull, which will be the column of subjects

subjectfull <- rbind(subject_test, subject_train) #10299 rows 1 column
names(subjectfull) <- c("Subject") #rename as above

#Now it's time to cbind!

subact <- cbind(subjectfull, yfull) #Sticks together subject and activity
subactcon <- mutate(subact, SubAct = paste(Subject, Activity, sep = "_")) #concatenates a subject-activity combo

wholeset <- cbind(subactcon, xfull) #10299 rows, 564 cols -- this is everything so far.  

#Now we subset, and create a useful dataset with only the requested information.  

meancols <- wholeset[, grepl("mean()", names (wholeset))] #10299r/46c -- subsets out means
stdcols <- wholeset[, grepl("std()", names (wholeset))] #10299r/33c -- subsets out stds
cononly <- (select(subactcon, SubAct)) #10299r/1c -- this subsets out just the SubAct column

tinyset <- cbind(cononly, meancols, stdcols) #Here's the set with just means/stds, identified by sub-act combo

#This next bit takes the means by group of the columns in tinyset, per assignment

assignmentmeans = ddply(tinyset, .(SubAct), colwise(mean))

#If you wanted to also produce the output file requested, you'd do

#write.table(assignmentmeans, file = "courseprojdata.txt", row.names=FALSE)

#But I just did that in the r console.  
