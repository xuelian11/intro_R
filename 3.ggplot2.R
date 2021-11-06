
library(ggplot2)
library(GGally)
library(gridExtra)
plt <- ggplot(da, aes(x = scale(da$Height), y = scale(da$Weight), 
                      colour = da$Gender)) +
  geom_point()
x11()
plt


#ggplot(<Data>) + <GEOM_FUNCTION>(mapping(aes(<MAPPINGS>)) or
#ggplot(<Data>, mapping(aes(<MAPPINGS>) + <GEOM_FUNCTION>()
#(1) Scatterplot

# aes(): aesthetics parameters 
x11()  #create an independent window; alternatively, you may use windows()
ggplot(da) + geom_point(aes(x= CI, y = P4)) + ggtitle("Polity vs. Corrutpion") +
  labs(x = "Corruption Index", y = "Polity")

x11()
ggplot(da) + geom_point(aes(x= CI, y = P4, col = SOL)) + ggtitle("Polity vs. Corrutpion among Countries \n with various Standard of Living") +
  labs(x = "Corruption Index", y = "Polity") #change col to shape.
# cannot map continuous variable to "col"

x11()
ggplot(da) + geom_point(aes(x= CI, y = P4, size = pGDP)) + ggtitle("Polity vs. Corrutpion among Countries \n with various pGDP") +
  labs(x = "Corruption Index", y = "Polity") #change col to shape.
#pGDP is continuous but R cannot plot all the values with different sizes.

#The old way 
plot(da$CI, da$P4, xlab = "Corruption Index", ylab = "Polity", main = "Polity vs. Corrsuption")


#(2) Pairs plot
x11()
ggpairs(da[,2:4]) #From GGally package
# plots on the diagonal is the distribution of each variable 
#The old way: 
pairs(da[,2:4])


#(3) Line plots
meanCI = tapply(da$CI, da$P4, mean)
Polity = -10:10
da1 = data.frame(Polity, meanCI)
#grid.arrange(plot1, plot2, nrow=1, ncol=2); similar to par(mfrow = c(no1, no2,))
#x11()
p1 = ggplot(da1) + geom_line(mapping = aes(x = Polity, y = meanCI)) +
  ggtitle("Average Corruption at each level of Polity")

p2 = ggplot(da1, mapping = aes(x = Polity, y = meanCI)) + geom_line() +
  geom_point() + ggtitle("Average Corruption at each level of Polity")

x11()
grid.arrange(p1, p2, nrow=2, ncol=1) #From gridExtra package

#The old way
x11()
plot(Polity, meanCI, type = "p", main = "Average Corruption at each level of Polity", cex.main = 0.9)
x11()
plot(Polity, meanCI, type = "l", main = "Average Corruption at each level of Polity", cex.main = 0.9)
x11()
plot(Polity, meanCI, type = "o", main = "Average Corruption at each level of Polity", cex.main = 0.9)
x11()
plot(Polity, meanCI, type = "b", main = "Average Corruption at each level of Polity", cex.main = 0.9)


#(4) Boxplot
x11()
ggplot(da, mapping = aes(x=factor(0), y = pGDP)) + geom_boxplot() +
  ggtitle("Distribution of per capita GDP") + xlab("")
# no mapping on the x axis

x11()
ggplot(da, mapping = aes(x=factor(SOL), y = pGDP)) + geom_boxplot() +
  ggtitle("Distribution of per capita GDP") + xlab("")

x11()
ggplot(da, mapping = aes(x=factor(P4), y = CI)) + geom_boxplot() +
  ggtitle("Distribution of corruption at each level of polity") + xlab("Polity") + ylab("Corruption")

x11()
ggplot(da, mapping = aes(x = cut(P4,quantile(P4),include.lowest = T), y = CI)) + geom_boxplot() +
  ggtitle("Distribution of corruption at each level of polity") + xlab("Polity with four levels") + 
  ylab("Corruption")

#The old way
x11()
boxplot(da[,7], main = "Distribution of per capita GDP") 
x11()
boxplot(da$CI~da$P4, main = "Distribution of corruption at each level of polity", cex.main = 0.95,
        xlab = "Polity", ylab = "Corruption Index") 
x11()
boxplot(da$CI~ cut(da$P4,quantile(da$P4)), xlab = "Polity", ylab = "Corruption Index") 


#(5) Histogram & Density Plot
x11()
ggplot(da, aes(x = pGDP)) + geom_histogram() + ggtitle("Histogram of per capita GDP")

x11()
ggplot(da, aes(x = pGDP)) + geom_density() + ggtitle("Histogram of per capita GDP")

#The old way
x11()
hist(da$pGDP, main = "Histogram of per capita GDP")
x11()
plot(density(da$pGDP), main = "Density plot of per capita GDP")


#(6) Barplot
da$P4c = cut(da$P4,quantile(da$P4),include.lowest = T)
da$P4c = factor(da$P4c, labels = c("Strong Autocracy", "Mild Autocracy", "Democracy",
                                   "Full Democracy"))
x11()
ggplot(da, aes(x = Corrupt, fill = P4c)) +
  geom_bar(position = "dodge")+ggtitle("Segmented bar chart")+ 
  theme(plot.title = element_text(hjust = 0.5)) 
#code to move title in the middle, left: hjust =0, right: hjust=1

#The old way
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
CIcounts = as.numeric(CIcounts) 
Group = c("High", "Medium", "Low")
da2 = data.frame(Group, CIcounts)
bp<- ggplot(da2, aes(x="", y = CIcounts, fill = Group))+
  geom_bar(width = 1, stat = "identity")
x11()
bp + coord_polar("y", start=0) + ggtitle("Corruption")

#The old way
CIbreaks = cut(da$CI, c(0, 3.3, 6.6, 10))                     
CIcounts = tapply(da$CI, CIbreaks, length)        
names(CIcounts) = c("High", "Medium", "Low")
x11()
pie(CIcounts, col = c("red","yellow","green"), main = "Corruption")


#(8) Mosaic plot


#The old way
out = table(da$Dem, da$Corrupt)
out
x11()
mosaicplot(out, shade = T, main = "Democrary vs. Corruption", xlab = "Democracy (P4>7 => 1)", ylab = "Corruption")