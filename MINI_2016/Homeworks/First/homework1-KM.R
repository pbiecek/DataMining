#Klaudia Magda

#homework

install.package('PogromcyDanych')
install.package('knitr')
library(PogromcyDanych)
library(knitr)
library(dplyr)


setLang()


dat<-data("skiJumps2013")

tab_speed<-table(skiJumps2013$jumpSpeed)
tab_distance<-table(skiJumps2013$jumpDistance)
tab_country<-table(skiJumps2013$compCountry)
tab_jumpcountry<-table(skiJumps2013$jumperCountry)
tab_dateofbirth<-table(skiJumps2013$jumperDateOfBirth)


barplot(tab_speed)
barplot(tab_distance)
barplot(tab_country)
barplot(tab_jumpcountry)
barplot(tab_dateofbirth)

ggplot(dat, aes(x = CPI, y = HDI, size = HDI.Rank)) + geom_point()

#knitr
#install.packages("knitr")

#
library(ggplot2)

hist(skiJumps2013$speed)
boxplot(skiJumps2013$compCountry, horizontal = TRUE)


#Computer classes

#1. Read file
mydata = read.table("allegro-categories-eng.txt", header=TRUE, sep=";")
mydata
allegrotable <- read.table("allegro-api-transactions.csv", header=TRUE, sep=";")
allegrotable
#2 
mergedata = merge(mydata, allegrotable)
mergedata
#3 Numerical and graphical representation

tab_price<-table(allegrotable$price)
tab_price
tab_standard<-table(allegrotable$it_is_allegro_standard)
tab_standard
tab_brandzone<-table(skiJumps2013$it_is_brand_zone)
tab_brandzone
tab_seller<-table(skiJumps2013$it_seller_rating)
tab_seller
tab_date<-table(skiJumps2013$date)
tab_date


date

#library(data.table)fread
