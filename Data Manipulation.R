if (!file.exists("Data")){
        dir.create("Data")
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./Data/File1_ACS.csv")
dat_File1 <- read.csv("./Data/File1_ACS.csv")

## Q1:
sum(dat_File1$VAL[!is.na(dat_File1$VAL)] == 24)
## ANSWER: 53

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "./Data/File2_NGA.xlsx")
library(readxl)
LETTERS[15]
dat <- read_xlsx("./Data/File2_NGA.xlsx", range = "G18:O23")

## Q2:
sum(dat$Zip*dat$Ext,na.rm=T)
## ANSWER: 36534720

library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = T)
rt <- xmlRoot(doc)
rt[[1]][[1]]
my_zips <- xpathSApply(rt, "//zipcode", xmlValue)
my_neigborhood <- as.factor(xpathSApply(rt, "//neighborhood", xmlValue))
summary(my_neigborhood)
str(my_neigborhood)
table(my_neigborhood)

## Q3:
sum(my_zips == "21231")
## ANSWER: 127
