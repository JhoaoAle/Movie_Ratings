#Check if the working directory is correct
getwd()

#Importing DataSet
movies <- read.csv("data\\Movie-Ratings.csv")

#Top rows
head(movies)

#Changing column names for easier interaction
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudicenceRating", "Budget(Millions)", "Year")
head(movies)