###################### histogram plot, box plots, line plot etc  ######################
#Case 1: Fuel Efficiency
rm(list=ls())
help(mtcars)
da = mtcars
head(da)
summary(da$mpg)
x11()
hist(da$mpg, main = "Fuel Efficiency using MPG \n (Histogram)", 
     xlab = "Mileage per Gallon", cex.main = 0.9)
x11()
boxplot(da$mpg ~ da$cyl, main = "Fuel Efficiency using MPG \n 
        (Comparative Boxplot)", xlab = "No. of Cylinders", 
        ylab = "MPG", cex.main = 0.9)
x11()
plot(da$disp, da$mpg, main="Mileage vs. Displacement", 
     xlab="Displacement", ylab="MPG", pch=16, col="blue")
text(da$disp, da$mpg, row.names(da), cex=0.6, pos=1, col="red")
model = lm(da$mpg ~ da$disp)
model$coef
abline(model, col = "purple", lwd = 2)
text(300, 25, "Linear Regression Model \n MPG = 29.60 - 0.04*Disp.", cex = 0.9)


#Case 2: Gender Identification
rm(list=ls())
da = read.csv("StudentSurvey.csv")
head(da)
dim(da)
da$ht = scale(da$Height)
da$wt = scale(da$Weight)
x11()
plot(da[da$Gender=="M",]$wt, da[da$Gender=="M",]$ht, pch = 17, col = "black", xlab='',ylab='')
points(da[da$Gender=="F",]$wt, da[da$Gender=="F",]$ht, pch = 16, col = "red")
title(main="Height and Weight \n (Male vs. Female)", xlab="Weight", ylab="Height")
legend("topright", c("Male","Feale"), col = c("black", "red"), pch = c(17, 16)) 


da = mtcars
x11()
par(mfrow= c(1, 2))
barplot(table(da$cyl))
barplot(table(da$am))
rm(list=ls())
da = read.csv("polity.csv", header = T)
head(da)
da$Dem = ifelse(da$P4 > 7, 1, 0) #vectorized "if else" command
da$Corrupt = ifelse(da$CI < 4, "Yes", "No")
da$pGDPt = da$pGDP/1000 #pGDP in "t"housands

write.csv(da, "poiltynew.csv", row.names = F) #output (export) the data 

#(1) Scatterplot
#What is the relationship between CI and P4?
x11()  #create an independent window; alternatively, you may use windows()
plot(da$CI, da$P4, xlab = "Corruption Index", ylab = "Polity", main = "Polity vs. Corrsuption")


#(2) Pairs plot pairwise relationship between each column
x11()
pairs(da[,2:4])
x11()
pairs(mtcars[,c(1,2,6)])

#(3) Line plots
meanCI = tapply(da$CI, da$P4, mean)
Polity = -10:10
x11()
plot(Polity, meanCI, type = "p", main = "Average Corruption at each level of Polity", cex.main = 0.9)
?plot
x11()
plot(Polity, meanCI, type = "l", main = "Average Corruption at each level of Polity", cex.main = 0.9)
x11()
plot(Polity, meanCI, type = "o", main = "Average Corruption at each level of Polity", cex.main = 0.9)
x11()
plot(Polity, meanCI, type = "b", main = "Average Corruption at each level of Polity", cex.main = 0.9)


#(4) Boxplot
x11()
boxplot(da[,7], main = "Distribution of per capita GDP") 
which(da$pGDP == min(da$pGDP)) # find the position of the poorest country

x11()
boxplot(da$CI~da$P4, main = "Distribution of corruption at each level of polity", cex.main = 0.95, 
        xlab = "Polity", ylab = "Corruption Index") 
x11()
plot(da$P4, da$pGDP)
x11()
boxplot(da$CI~ cut(da$P4,quantile(da$P4)), 
        xlab = "Polity", ylab = "Corruption Index") 


#(5) Histogram & Density Plot
x11()
hist(da$pGDP, main = "Histogram of per capita GDP")
x11()
plot(density(da$pGDP), main = "Density plot of per capita GDP")


#(6) Barplot
da$P4c = cut(da$P4,quantile(da$P4))
da$P4c = factor(da$P4c, labels = c("Strong Autocracy", "Mild Autocracy", "Democracy",
                                   "Full Democracy"))
out = table(da$P4c, da$Corrupt)
out1 = round(prop.table(out, 1), 2)
color = c("Red", "yellow", "green", "blue")
x11()
barplot(out1, beside = T, col = color, main = "Segmented Bar Chart")
legend("topleft", legend = rownames(out), fill = color)


#(7) Pie Chart
CIbreaks = cut(da$CI, c(0, 3.3, 6.6, 10))                     
CIcounts = tapply(da$CI, CIbreaks, length)        
names(CIcounts) = c("High", "Medium", "Low")
x11()
pie(CIcounts, col = c("red","yellow","green"), 
    main = "Corruption")


#(8) Mosaic plot
out = table(da$Dem, da$Corrupt)
out
x11()
mosaicplot(out, shade = T, main = "Democrary vs. Corruption", 
           xlab = "Democracy (P4>7 => 1)", ylab = "Corruption")

