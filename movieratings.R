#Check if the working directory is correct
getwd()

#Importing DataSet
#stringsAsFactors is set to TRUE for easier clasification and understanding of the dataset
movies <- read.csv("data\\Movie-Ratings.csv", stringsAsFactors = TRUE)

#Top rows
head(movies)

#Changing column names for easier interaction
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)

#Checking the structure of the dataset for initial analysis
str(movies)

#Summary of the dataset 
summary(movies)

#Is better for "Year" to be categorical so is possible to group by year, color by year, etc
movies$Year <- factor(movies$Year)
str(movies)

# ---------- Aesthetics
#Importing ggplot2 library
library(ggplot2)

#aes() function is for setting aesthetics
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating))

#Addding geometry
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()


#Adding colour
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre)) + 
  geom_point()

#Adding size
ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                          colour=Genre, size=BudgetMillions)) + 
  geom_point()

