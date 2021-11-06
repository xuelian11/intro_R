
################### Basics ###################

da = read.csv("titanic_122.csv", header = T)
head(da)
?head #use "?" to get more info about head function
dim(da) #check the dimension of the data file (expressed as No. of rows by No. of columns)


#(A) Data Type: numeric, character, logic
name = c("Alice", "Bill", "Chloe", "David", "Ethan")
age = c(19, 20, 22, 19, 21)
gender = c("F", "M", "F", "M", "M")
smoke = c(F, F, T, F, T) #F: FALSE; T:TRUE datatype = logical
smoke1 = c("F", "F", "T", "F", "T")
# c() means concatenate

#(B) Data Structure: vector, data.frame, matrix, list
da1 = data.frame(name, age, gender, smoke)
da1
da1[2,]
da1[,2]
da1[2,2]
da1[2,2] = 18 

add = function(x, y) { 
  
  return(x + y)
  
}

add(x = 5, y = 8) 

da2 = list(name, age, gender, smoke, add)
da2
da2[[1]]
da2[[1]][1]
da2[[5]]
da2[[5]](5, 3)

da3 = matrix(1:9, nrow = 3, ncol = 3)
da3
da3[1,]
da3[,2]
da3[1,2]


#(C) R Operators: 
#(1) Arithmetic: "+", "-", "*", "/", "^", "%%", "%/%"

10^3 #"^" is equivalent to "**"
10 %% 3
10 %/% 3


#(2) Relational: ">", "<", ">=", "<=", "!=", "=="
5 > 3
5 >= 5
x = 5; y = 3
x > y
x >= x


#(3) Logical: "&" (and), "|" (or), "!" (not)
set.seed(111)
a = sample(1:10, 10, replace = T) 
a[a > 3 & a < 6] #3<a<6
a[a < 3 | a > 6] # a<3 or a>6
a[ !(a  > 3) ] # a <= 3


da1[da1$age > 19 & da1$gender == "F",] # don't forget the ","

#(4) Assignment: "=", "<-"


#(D) Functions
#e.g. 1 Compute the size of a circle

area_circle = function(r) {
  
  print(pi * r^2)
  
}


#e.g. 2 Temperature conversion
CtoF = function(x){
  val = 32 + (9/5) * x
  print(paste("Today's temperature is", val, "degrees Fahrenheit."))
}

CtoF2 = function(x){
  
  val = 32 + (9/5) * x
  
  #return(val)
  
  #Alternatively, you may be want to be more specific by printing out
  # paste join parts together 
  print(paste("Today's temperature is", x, "degrees Celsius or", val, 
              "degrees Fahrenheit."))
  
}

FtoC = function(x){
  val = (x - 32) * (5/9)
  print(paste("Today's temperature is", val, "degrees Celsius."))
}
rm(list=ls()) 

################### data types ###################
# 1.Categorical variable

phone = c("Android", "iPhone", "Blackberry", "NoSmart", "NoCell")
number = c(458, 437, 141, 924, 293)
data = data.frame(phone, number)
x11()
barplot(number, names.arg = phone, main = "Bar Chart of Cell Phone Usage")
x11()
pie(number, labels = phone, main="Pie Chart of Cell Phone Usage")

 
smoker = read.csv(file="smoker.csv",header = T)
summary(smoker)
str(smoker)
table(smoker$Smoke)
table(smoker$SES)
# convert character to factor
smoker$Smoke = factor(smoker$Smoke)
# factor with a sequenced order
smoker$SES = factor(smoker$SES, levels=c("Low","Middle","High"))
table(smoker$SES)
# interaction between two categorical variable
#frequency matrix
outcome = table(smoker$Smoke,smoker$SES)
# percentage of frequency number/overall number
prop.table(outcome)
prop.table(outcome,1) # for each row, the columns sum to 1
prop.table(outcome,2) # for each column,the row sum to 1
x11()
barplot(outcome, col=c("red", "purple", "darkblue"),
        main = "Segmented Bar Chart", 
        legend = rownames(outcome))


#2 Quantitative Variable 

rm(list = ls())
da = read.csv("MammalLongevity.csv", header = T)
x11()
dotchart(da$Longevity,main="Longevity of 40 Mammals", xlab="Longevity")

x11()
colors = c("red", "orange", "yellow", "green", "blue", "pink", "cyan", "violet") 
hist(da$Longevity, main="Longevity of 40 Mammals", 
     xlab="Longevity", 
     breaks = 8, col= colors) 
rm(list=ls())
da = read.csv("StudentSurvey.csv", header = T)
names(da)

x11()
par(mfrow = c(1, 3)) # three figures in one row
hist(da$Pulse, xlab = "Pulse")
hist(da$Exercise, xlab = "Exercise")
hist(da$Piercings, xlab = "Piercings")

rm(list = ls())
da = read.csv("MammalLongevity.csv", header = T)
boxplot(da$Longevity,main="Longevity of 40 Mammals", ylab = "years")
boxplot(da$Longevity,main="Longevity of 40 Mammals", xlab = "years", horizontal = T)
rm(list=ls())
x <- c(2,5,1,3,8,2,0,6,3,1)
y <- c(65,69,64,75,90,75,49,77,74,58)

# plot scatterplot and the regression line
mod1 <- lm(y ~ x)
plot(x, y, xlim=c(-2,10), ylim=c(40,100),main="Regresson Line and Residuals", ylab = "score", xlab = "hours")
abline(mod1, lwd=2)
# Don't worry about the rest of the code, focus on the above three lines of statements

# calculate residuals and predicted values
res <- signif(residuals(mod1), 5)
pre <- predict(mod1)

# plot distances between points and the regression line
segments(x, y, x, pre, col="red")

# add labels (res values) to points
library(calibrate)
textxy(x, y, res, cx=0.7)
text(6, 60, "Y = 57.701 + 3.838*X", col = "red")


################### Basic statistics ###################
#make a copy of mtcars data and assign it to a new variable "da"
da = mtcars
dim(da) #32 (observations) by 11 (variables)
head(da)

### Data Exploration using Statistics ###
(out = summary(da$mpg)) #Three quartiles (Q1, Q2(=median), Q3) divides data equally into four equal patrs


#the "out" variable is a "table", which is another way to store data. The 2nd position in "out" is the first quartile (Q1)
out[2] 
q1 = unname(out[2])
q2 = unname(out[3])
q3 = unname(out[5])
q1; q2; q3

da$mpg[da$mpg < q1]
length(da$mpg[da$mpg < q1]) 
da$mpg[da$mpg > q1 & da$mpg < q2]
length(da$mpg[da$mpg > q1 & da$mpg < q2]) 

### Data Exploration using Figures ###
x11()
hist(da$mpg)
x11()
boxplot(da$mpg)


### Create new Variables in a Data Frame ###
da$FE = 0
#divide the car into two groups; "H" for fuel efficient car and "L" otherwise
out[4]
da[da$mpg > out[4],]$FE = "High"
da[da$mpg <= out[4],]$FE = "Low"

da$FE2 = 0
#Categorize FE2 to three level, "H", if mpg > Q3, "M": Q1 < mpg < Q3, "L": if mpg < Q1
da[da$mpg > out[5],]$FE2 = "H"
da[da$mpg >= out[2] & da$mpg <= out[5],]$FE2 = "M"
da[da$mpg < out[2],]$FE2 = "L"

#Alternatively,
da$FE3 = "H" #use the "H" as the initial level for all cars
da[da$mpg >= out[2] & da$mpg <= out[5],]$FE3 = "M"
da[da$mpg < out[2],]$FE3 = "L"


############### simple simulation###################
game = function(n){

out = c() #initiate a blank vector to store the outcomes
for (i in 1:n) { #for loop to do the iterations (i.e. play games n times)
  
  out[i] = sample(1:6, 1, prob = c(0.1, 0.15, 0.3, 0.2, 0.15, 0.1))  
}
tt = table(out) #create a frequency table to see how the outcomes are distributed
names(tt) = paste("#", names(tt), sep = "")
a = sum(tt[1:3])
b = sum(tt[4:6])
print(tt) 
x11()
barplot(tt)
print(paste("The overall frequency of (1,2,3) is", a, 
            "; the overall frequency of (4,5,6) is", b, 
            "so player A wins $", a-b)) #the n must be large to have such result

}

#Sampling Distributions
rm(list=ls())
da = read.csv("StatisticsPhD.csv", header = T)
head(da)
dim(da)
phd = da[,3]
N = length(phd)
(avgphd = mean(phd)) #population mean 
(varphd = sum((phd - avgphd)^2)/N) #population variance
(sdphd = sqrt(varphd)) #population standard deviation

smp1 = sample(phd, 10) #take a sample of size 10 from the population
(avgsmp1 = mean(smp1)) #compute the sample mean

set.seed(123)
avg10 = rep(0, 1000) 
#create a vector to store the sample averages; currently the elements are all zeros

for (i in 1:1000){ 
  avg10[i] = mean(sample(phd, 10, replace = T))
}
mean(avg10); var(avg10); sd(avg10)
x11()
hist(avg10, breaks = 20, freq = F, main = "Sampling Distribution of Average PhD", 
     xlab = "# of PhD (mean = 53.26, standard error = 11.69)")
#remove "freq = F", the vertical measure becomes a frequency measure, i.e., number of counts in the category
xfit = seq(min(avg10), max(avg10), length = 1000)
yfit = dnorm(xfit, mean = mean(avg10), sd = sd(avg10))
lines(xfit, yfit, col = "red")

rm(avg10)
set.seed(12012020)
avg10 = rep(0, 1000)
for (i in 1:1000){
  avg10[i] = mean(sample(phd, 10, replace = T))
}

avg100 = rep(0, 1000)
for (i in 1:1000){
  avg100[i] = mean(sample(phd, 100, replace = T))
}

avg1000 = rep(0, 1000)
for (i in 1:1000){
  avg1000[i] = mean(sample(phd, 1000, replace = T))
}

mean(avg10); var(avg10)
mean(avg100); var(avg100)
mean(avg1000); var(avg1000)

x11()
par(mfrow = c(3,1))
hist(avg10, main="Sampling Distribution of the Sample Mean", xlab="# of PhD", breaks=20, xlim = c(30, 75))
hist(avg100, breaks = 20, xlim = c(30, 75))
hist(avg1000, breaks = 20, xlim = c(30, 75))


#Constructing Bootstrap Confidence Intervals
rm(list=ls())
da = read.csv("CommuteAtlanta.csv", header = T)
head(da)
dim(da)
time = da$Time #the original sample of commute time
mean(time); var(time); sd(time)

set.seed(12012020)
avg = rep(0, 1000)
for (i in 1:1000){
  avg[i] = mean(sample(time, 500, replace = T))
}
x11()
hist(avg ,main="Sampling Distribution using Bootstrap", xlab="# Commute time", breaks=20)

mean(avg); var(avg); sd(avg)

cutoff = quantile(avg, c(0.005, 0.05, 0.95, 0.995)) #quantile function for finding the "percentile"
x11()
hist(avg ,freq = F, main="Sampling Distribution using Bootstrap", xlab="# Commute time", breaks=20, ylim =c(0, 0.5))
xfit = seq(min(avg), max(avg), length = 1000)
yfit = dnorm(xfit, mean = mean(avg), sd = sd(avg))
lines(xfit, yfit, col = "purple")
abline(v = cutoff[1], col = "blue", lty = "dotted")
abline(v = cutoff[2], col = "red", lty = "dotted")
abline(v = cutoff[3], col = "red", lty = "dotted")
abline(v = cutoff[4], col = "blue", lty = "dotted")


