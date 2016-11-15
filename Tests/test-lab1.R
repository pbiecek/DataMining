transactions <- read.table("allegro-api-transactions.csv",sep=",",header=TRUE,fill=TRUE)
nrow(transactions)
unique(transactions$main_category)
dict <- read.table("allegro-categories-eng.txt",sep=";",header=TRUE,fill=TRUE)
trans <- merge(transactions,dict,by=c("main_category"))
library(vioplot)
vioplot(trans$it_seller_rating[trans$main_category=="Antyki i Sztuka"],
        trans$it_seller_rating[trans$main_category=="Dla Dzieci"])

# knn factor