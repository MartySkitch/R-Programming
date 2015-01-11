#  Quiz 1
wrkDir<-"D:/Skitch/Code/R/R Programming/Quiz 1"
setwd(wrkDir)

# Q. 10 Set elements of verctor to 0 if GT 6
x<-c(3, 5, 1, 10, 12, 6)
x %in% 1:5 # Returns vector of logical
x[x %in% 1:5] <- 0  # logical vector is evaluated and elements that are true are set to 
x

#Q. 11, 12 Column names and first 2 rows
data<-read.csv("hw1_data.csv")
head(data, 2)

#Q. 13 Total number of observations
nrow(data)

#Q. 14 Last 2 rows
tail(data, 2)

#Q. 15 The 47th element of Ozone column
ozone<-data[,"Ozone"]
ozone[47]

#Q. 16  Number of missing Ozone values
length(ozone[is.na(ozone)])

#Q 17  What is the mean of the Ozone
ozone[!is.na(ozone)]  # This returns the array of all NA values
mean(ozone)  # This returns NA
mean(ozone[!is.na(ozone)])  # this is the mean of all NA values

#Q 18  Mean of Solar R when Ozone > 31 and Temp > 90
ozone31<-subset(data, ozone>31 & Temp>90)
mean(ozone31[,"Solar.R"])

#Q 19 Mean of temp for June (Month == 6)
dataJune<-subset(data, Month==6)
mean(dataJune[,"Temp"])

#Q 20. Max Ozone for May (Month == 5)
dataMay<-subset(data, Month==5)
ozoneMay<-dataMay[,"Ozone"]
max(ozoneMay[!is.na(ozoneMay)])