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

#Example 3: Overriding x axis; the name of the axis in the plot won't change unless xlab() is used
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


# ---------- Statistical Transformations
u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               colour=Genre))
u + geom_point()+ geom_smooth(fill=NA)

#Boxplots
u <- ggplot(data = movies, aes(x=Genre, y=AudienceRating,
                               colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_jitter()

#Another way:
#alpha=Transparency
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 


#Same graphic but for critics instead of audience

u <- ggplot(data = movies, aes(x=Genre, y=CriticRating,
                               colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_jitter()

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 

# ---------- Using Facets

v <- ggplot(data = movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") + facet_grid(Genre~., scales="free")

# ---------- Scatterplots
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               colour=Genre))

w + geom_point(size=3) +
  facet_grid(Genre~.)

w + geom_point(size=3) +
  facet_grid(.~Year)

w + geom_point(size=1) +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth()+
  facet_grid(Genre~Year)


# ---------- Coordinates
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth()+
  facet_grid(Genre~Year) + 
  coord_cartesian(ylim=c(0,100))

# ---------- Theme
o <- ggplot(data = movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Black")

# Axis label
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30))

#Thick mark formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

#Legend formatting
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1)
        )

#Title
h +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(colour="Dark Green", size=30),
        axis.title.y = element_text(colour="Red", size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour = "Dark Blue",
                                  size=25,
                                  family = "Courier New")
  )