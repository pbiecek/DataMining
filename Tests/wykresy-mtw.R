crime <-   read.csv("http://datasets.flowingdata.com/crimeRatesByState2005.csv",sep=",", header=TRUE)
plot(crime$murder, crime$burglary)
which.max(crime$murder) #outlier
crime2<- crime[-which.max(crime$murder),]
crime2<- crime2[crime2$state != 'United States',]
plot(crime2$murder, crime2$burglary, xlim=c(0,10), ylim=c(0, 1200))
scatter.smooth(crime2$murder, crime2$burglary, xlim=c(0,10), ylim=c(0, 1200))
pairs(crime2[,2:9], panel=panel.smooth)
symbols(crime2$murder, crime2$burglary, circles=crime2$population)
radius <- sqrt( crime2$population/ pi )
symbols(crime2$murder, crime2$burglary, circles=radius)
symbols(crime2$murder, crime2$burglary, circles=radius, inches=0.35,
        fg="white", bg="red", xlab="Murder Rate", ylab="Burglary Rate")
symbols(crime2$murder, crime2$burglary,
        squares=sqrt(crime2$population), inches=0.5)
text(crime2$murder, crime2$burglary, crime2$state, cex=0.5)
birth <- read.csv("http://datasets.flowingdata.com/birth-rate.csv")
stem(birth$X2008)
hist(birth$X2008, breaks=5)
hist(birth$X2008, breaks=20)
summary(birth$X2008)

birth2008 <- birth$X2008[!is.na(birth$X2008)]
d2008 <- density(birth2008)
density.default(x = birth2008)
d2008frame <- data.frame(d2008$x, d2008$y)
write.table(d2008frame, "birthdensity.txt", sep="\t")
plot(d2008)
plot(d2008, type="n")
polygon(d2008, col="#821122", border="#cccccc")

#lattice example
library(lattice)
histogram(birth$X2008, breaks=10)
lines(d2008)
birth_yearly <- read.csv("http://datasets.flowingdata.com/birth-rate-yearly.csv")

histogram(~ rate | year, data=birth_yearly, layout=c(10,5))
summary(birth_yearly)
boxplot(birth_yearly$rate)

birth_yearly.new <- birth_yearly[birth_yearly$rate < 132,]
birth_yearly.new$year <- as.character(birth_yearly.new$year)
h <- histogram(~ rate | year, data=birth_yearly.new, layout=c(10,5))
update(h, index.cond=list(c(41:50, 31:40, 21:30, 11:20, 1:10)))

hotdogs <- read.csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv", sep=",", header=TRUE)
barplot(hotdogs$Dogs.eaten)

barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year)
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col="red",
       border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")

fill_colors <- c()
for ( i in 1:length(hotdogs$Country) ) {
  if (hotdogs$Country[i] == "United States") {
    fill_colors <- c(fill_colors, "#821122")
  } else {
    fill_colors <- c(fill_colors, "#cccccc")
  }
}
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors,
        border=NA, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")
barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, col=fill_colors,
        border=NA, space=0.3, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")

# ggplot2 examples
library(ggplot2) 
library(MASS)

# create factors with value labels 
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) 
mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl")) 

# Kernel density plots for mpg
# grouped by number of gears (indicated by color)
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density")

# Scatterplot of mpg vs. hp for each combination of gears and cylinders
# in each facet, transmittion type is represented by shape and color
qplot(hp, mpg, data=mtcars, shape=am, color=am, 
      facets=gear~cyl, size=I(3),
      xlab="Horsepower", ylab="Miles per Gallon") 

# Separate regressions of mpg on weight for each number of cylinders
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth"), 
      method="lm", formula=y~x, color=cyl, 
      main="Regression of MPG on Weight", 
      xlab="Weight", ylab="Miles per Gallon")

# Boxplots of mpg by number of gears 
# observations (points) are overlayed and jittered
qplot(gear, mpg, data=mtcars, geom=c("boxplot", "jitter"), 
      fill=gear, main="Mileage by Gear Number",
      xlab="", ylab="Miles per Gallon")
# datasets: http://datasets.flowingdata.com
#www.enbis.org

