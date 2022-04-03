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


# ---------- Plotting with layers
#The plot is assigned to an object
p <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=BudgetMillions)) 

#Point
p + geom_point()

#Lines
# This doesn't really make any sense
#p+ geom_line()

#Multiple layers
# This doesn't really make any sense either
#p + geom_line() + geom_point()


# ---------- Overriding aesthetics

q <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, 
                               colour=Genre, size=BudgetMillions)) 

#add geom layer
q + geom_point()

#Overriding aes

# === This is mapping
#Example 1: CriticRating overrides Budget
q+ geom_point(aes(size=CriticRating))

#Example 2: CriticRating overrides Genre in colour
q+ geom_point(aes(color=BudgetMillions))

#Although the variables get overriden, the original object is never modified; so q remains the same
q+ geom_point()

#Example 3: Overrding x axis; the name of the axis in the plot won't change unless xlab() is used
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")
# ===

# === This is setting
#Example 4: Reducing line size
q + geom_line(size=1) + geom_point() # This still doesn't make any sense, but at least looks better


# ---------- HJistograms and Density Charts
s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)                                   

#Add colour
s + geom_histogram(binwidth = 10, aes(fill=Genre))

#Add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

#Density charts are sometimes useful
s + geom_density(aes(fill=Genre), position="stack") #This is hard to explain when presenting this

# ---------- Starting Layer Tips

t <- ggplot(data = movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10, fill="White", colour="Blue")

#Another way
t <- ggplot(data = movies)
t + geom_histogram(binwidth=10, 
                   aes (x=AudienceRating), 
                   fill="White", colour="Blue")

t + geom_histogram(binwidth=10, 
                   aes (x=CriticRating), 
                   fill="White", colour="Blue")
