Datafinal= read.csv("C:/Users/SARAH/Desktop/CreditCard1.csv")
head(Datafinal,n=5)
sum(is.na(Datafinal))
summary(Datafinal)
a=median(Datafinal$age)
i=median(Datafinal$income)
s=median(Datafinal$share)
print(a)
print(i)
print(s)
library(ggplot2) #Histogram
ggplot(Datafinal)+geom_histogram(aes(x=age),bins=20,col='purple',fill='orange',linetype="dashed")
ggplot(Datafinal)+geom_histogram(aes(x=income),bins=20,col='lightblue',fill="darkblue",linetype="da
shed")
ggplot(Datafinal)+geom_histogram(aes(x=share),bins=20,col='darkblue',fill='darkgreen',linetype="das
hed")
#Box Plot
ggplot(Datafinal) +aes(x = "", y = age) +geom_boxplot(fill = "#0c4c8a") +theme_minimal()
ggplot(Datafinal) + aes(x = "", y = income) + geom_boxplot(fill ="#0c4c8a")+theme_minimal()
#chi-square test
chisq.test(table(Datafinal$card,Datafinal$owner), correct = FALSE)
summary(table(Datafinal$card,Datafinal$owner))
#Scatter Plot
ggplot(Datafinal,aes(x=factor(card),y=reports))+geom_point(color="Navyblue",shape=10,aes(size=0.5)
)
#Correlation matrix
library(hmsic)
library(corrplot)
mydata<-Datafinal %>%
  select(reports,age,income,share,expenditure,dependents,months,majorcards,active)
mydata.rcorr=rcorr(as.matrix(mydata))
mydata.coeff=mydata.rcorr$r