library(readxl)
install.packages("devtools")
suppressPackageStartupMessages(library(dendextend))
library(dendextend)
airline_data<-read_excel(file.choose(),sheet=2)
airline_data1<-airline_data[,-1]

#######normalize
normalized_data <- scale(airline_data1)
######distance
d <- dist(normalized_data, method = "euclidean")
######distance method
fit <- hclust(d, method="complete")
plot(fit)
#######
fit <- hclust(d, method="ward.D2")
plot(fit)

#######
plot(fit, hang=-1)
groups <- cutree(fit, k=3) # cut tree into 3 clusters
rect.hclust(fit, k=3, border="red")



membership<-as.matrix(groups)

final <- data.frame(airline_data1, membership)


final1 <- final[,c(ncol(final),1:(ncol(final)-1))]

?write.xlsx
2+1
write.csv(final1, file="final.csv")


########3
colMeans(subset(fit, k == 1))

