library(readr)
crime_data<-read.csv(file.choose())
###EDA
###murder
hist(crime_data$Murder)
boxplot(crime_data$Murder)
shapiro.test(crime_data$Murder)
###RAPE
hist(crime_data$Rape)
boxplot(crime_data$Rape)
shapiro.test(crime_data$Rape)
###assault
hist(crime_data$Assault)
boxplot(crime_data$Assault)
shapiro.test(crime_data$Assault)
###urban pop
hist(crime_data$Assault)
boxplot(crime_data$Assault)
shapiro.test(crime_data$Assault)



###normalizing the data
normalized_data <- scale(crime_data[,2:5]) #excluding the university name columnbefore normalizing
d <- dist(normalized_data, method = "euclidean") # distance matrix
fit <- hclust(d, method="complete")

plot(fit) # display dendrogram
plot(fit, hang=-1)
plot(fit, crime_data$Murder,hang=-1)
plot(fit, crime_data$Assault,hang=-1)
plot(fit, crime_data$UrbanPop,hang=-1)
plot(fit, crime_data$Rape,hang=-1)

groups <- cutree(fit, k=2) # cut tree into 3 clusters


rect.hclust(fit, k=2, border="red")

########providing membership
membership<-as.matrix(groups)

final <- data.frame(crime_data, membership)

final1 <- final[,c(ncol(final),1:(ncol(final)-1))]



write.csv(final1, file="final.csv")

getwd()
