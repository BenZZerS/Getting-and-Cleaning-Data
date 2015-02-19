#Getting and Cleaning Data Course Project
#Step 1: Merges the training and the test sets to create one data set.
xTrainDf <- read.table("train/X_train.txt")
xTestDf <- read.table("test/X_test.txt")
xDf <- rbind(xTrainDf, xTestDf)

subjTrainDf <- read.table("train/subject_train.txt")
subjTestDf <- read.table("test/subject_test.txt")
subjDf <- rbind(subjTrainDf, subjTestDf)

yTrainDf <- read.table("train/y_train.txt")
yTestDf <- read.table("test/y_test.txt")
yDf <- rbind(yTrainDf, yTestDf)

remove(xTrainDf, xTestDf, subjTrainDf, subjTestDf, yTrainDf, yTestDf)

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
featureDf <- read.table("features.txt")
measureDf <- grep("mean\\(\\)|std\\(\\)", featureDf[, 2])
xDf <- xDf[, measureDf]
names(xDf) <- featureDf[measureDf, 2]
names(xDf) <- gsub("\\(\\)", "", names(xDf))
names(xDf) <- gsub("-", "", names(xDf))
names(xDf) <- gsub("mean", "Mean", names(xDf))
names(xDf) <- gsub("std", "Std", names(xDf))

#Step 3: Uses descriptive activity names to name the activities in the data set
activDf <- read.table("activity_labels.txt")
activDf[, 2] <- gsub("_", "", activDf[, 2])
activDf[, 2] <- tolower(activDf[, 2])
activDf[2, 2] <- gsub("up", "Up", activDf[2, 2])
activDf[3, 2] <- gsub("down", "Down", activDf[3, 2])
yDf[, 1] <- activDf[yDf[, 1], 2]
names(yDf) <- "activity"

#Step 4: Appropriately labels the data set with descriptive variable names.
names(subjDf) <- "subject"
tidyData <- cbind(subjDf, yDf, xDf)
write.table(tidyData, "1-tidyData.txt" ,row.names=FALSE)

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subjUnique <- sort(unique(subjDf[, 1]))
subjLen <- length(subjUnique)
activLen <- length(activDf[, 1])
colLen <- ncol(tidyData)
avgTidyData <- data.frame(matrix(NA, nrow = (subjLen*activLen), ncol = ncol(tidyData)))
names(avgTidyData) <- names(tidyData)

n <- 1
for(i in 1:subjLen){
    for(j in 1:activLen){
        avgTidyData[n, 1] <- subjUnique[i]
        avgTidyData[n, 2] <- activDf[j, 2]
        avgTidySub <- subset(tidyData, subject == avgTidyData[n, 1] & activity == avgTidyData[n, 2])
        avgTidyData[n, 3:colLen] <- colMeans(avgTidySub[, 3:colLen])
        remove(avgTidySub)
        n <- n+1
    }
}
remove(i, j, n)
write.table(avgTidyData, "2-avgTidydata.txt" ,row.names=FALSE)
