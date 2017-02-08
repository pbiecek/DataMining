install.package('PogromcyDanych')
library(PogromcyDanych)

setLang()


data("skiJumps2013")

tab1<-table(skiJumps2013$jumpSpeed)
tab2<-table(skiJumps2013$jumpDistance)
tab3<-table(skiJumps2013$compCountry)
tab4<-table(skiJumps2013$jumperCountry)
tab5<-table(skiJumps2013$jumperDateOfBirth)

ggplot()
housing <- read.csv("allegro-api-transactions.csv")
allegrotable <- read.table("allegro-api-transactions.csv", header=TRUE, sep=";")

library(data.table)fread
