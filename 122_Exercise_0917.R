#Econ 122: Exercise 09/17/2020

da = mtcars #make a copy of mtcars data and assign it to a new variable "da"
dim(da) #32 (observations) by 11 (variables)
head(da)

### Data Exploration using Statistics (Five-Number Summary) ###
(out = summary(da$mpg)) #Three quartiles (Q1, Q2(=median), Q3) divides data equally into four equal patrs
#please check how many observations are below Q1 of mpg? between Q1 and Q2? between Q2 and #? greater than Q3?
out[2] #the "out" variable is a "table", which is another way to store data. The 2nd position in "out" is the first quartile (Q1)
q1 = unname(out[2])
q2 = unname(out[3])
q3 = unname(out[5])
q1; q2; q3

da$mpg[da$mpg < q1]
length(da$mpg[da$mpg < q1]) #25% (32 * 0.25) of observations is smaller than q1
da$mpg[da$mpg > q1 & da$mpg < q2]
length(da$mpg[da$mpg > q1 & da$mpg < q2]) ##25% (32 * 0.25) of observations is between q1 & q2
#Examine the number of observations for (between q2 & q3) and (greater than q3) by yourself


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


###Supervised vs. Unsupervised Machine Learning### (Depends on whether there is a "Target" variable)

#clustering of three varieties of Iris (find the patter: Unsupervised Learning)
head(iris)
table(iris[,5])
x11()
plot(iris[,1], iris[,2], col = iris[,5])
