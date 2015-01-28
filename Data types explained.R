# Vector
x<-1:100
head(x)
# Filter the vector
filter<-x[x > 50]
head(filter)

# data frame
# Use the built-in data frame
head(mtcars)

# What is the displacement of a Datson 710 have
mtcars[3,3]
mtcars["Datsun 710", "disp"]

# All the weights
mtcars$wt

# What is the class of wt?
class(mtcars$wt)

# Lets only look at a subset of the data say heavy cars
heavyCars<-subset(mtcars, wt>5.0)
heavyCars

# Lets create our own data frame
df = data.frame(id=NA, date=NA, wt=NA)
df[1,] <- c(1, "2015-01-01", 175)
df[2,] <- c(2, "2015-01-02", 174)
df[3,] <- c(3, "2015-01-05", 173)
df[4,] <- c(4, "2015-01-08", 173)
df[5,] <- c(5, "2015-01-12", 175)
df
# Lets look at a single row
df[3,]

#Lets look at all the dates
df[,2]
df[,"date"]
