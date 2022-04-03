#Check if the working directory is correct
getwd()

#Importing DataSet
#stringsAsFactors is set to TRUE for easier clasification and understanding of the dataset
movies <- read.csv("data\\Movie-Ratings.csv", stringsAsFactors = TRUE)

#Top rows
head(movies)

#Changing column names for easier interaction
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudicenceRating", "Budget(Millions)", "Year")
head(movies)

#Checking the structure of the dataset for initial analysis
str(movies)

#Summary of the dataset 
summary(movies)

#Is better for "Year" to be categorical so is possible to group by year, color by year, etc
movies$Year <- factor(movies$Year)
str(movies)