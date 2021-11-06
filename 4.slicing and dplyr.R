#Part I
#1.1
rm(list=ls()) 

a = "I major in economics."
b = "After graduation,"
c = "I want to pursue a job as a Data Scientist."

nchar(a) #count the number of characters

whole = paste(a, b, c) #put characters together with space
whole

x = "case"
y = c(1, 2, 3, 4, 5)
(item = paste(x, y, sep = ""))
# first copy single element in x and paste with every element in y
#try => sep = "_"; separated by the underscore "_" symbol

suit = c("Spade", "Heart","Diamond","Club")
rank = c(2:10,"J","Q","K","A")
(Spade = paste(suit[1],rank,sep="_"))

#1.2 Print out character
print(a, quote = F)
print(whole, quote = F)
noquote(a)
cat(a) # see difference with print()
cat(a, b, c)

#1.3 extract or replace strings
substr(a, start = 12, stop = 20)
substr(a, start = 1, stop = 3) 


#Part II Data Management

#2.1 Subset using Index
rm(list=ls())
da = read.csv("StudentSurvey.csv", header = T)
da0 = da[da$Gender=="F" & da$Weight > 120 & da$Smoke == "Yes",] 
# donot forget ","
d1 = da[da$Year == "FirstYear" & da$Smoke == "Yes",]
d2 = da[da$Exercise > 10 & da$Siblings > 4,]
d3 = da[da$Gender == "M" & da$Weight > mean(da$Weight),]
out = table(da$Gender,da$Exercise)
typeof(da$Year)
da$Year1 = factor(da$Year, levels = c("FirstYear","Sophomore","Junior","Senior"))
d3 = da[order(da$Year1),]
table(da$Year)
table(da$Year1)


d4 = da[,c(3,4,5)] #or "3:5" without quotes
d5 = da[, -(2:17)] # drop columns

da$BMI = 703 * da$Weight/(da$Height)^2


#2.2 Using the dplyr package
#(a) filter
#(b) arrange
#(c) mutate
#(d) arrange
#(e) summarize

#(a) filter
rm(list=ls())
library(dplyr)
da = read.csv("StudentSurvey.csv", header = T)
f1 = filter(da, Year == "FirstYear", Smoke == "Yes")
dim(f1)
#Compare the results of f2 to f3. What is the difference?
f2 = filter(da, Exercise > 10 | Siblings > 4) # or
dim(f2)
f3 = filter(da, Exercise > 10 , Siblings > 4) # and
dim(f3)
f4 = filter(da, Piercings %in% 2:4) # belong to
dim(f4)

#(b) arrange
a1 = arrange(da, Year) # sort data based on "Year" column ascending in character
a2 = arrange(da, desc(Year)) #"Year" column descending in letters of character
da$Year1 = factor(da$Year, levels = c("FirstYear","Sophomore","Junior","Senior"))
a3 = arrange(da, Year1)
a4 = arrange(da,Year,Gender)
a5 = arrange(da,Year,Gender,Smole) # sort data based on different levels

#(c) select
s1 = select(da, c("Year", "Smoke")) #use names
s2 = select(da, c(3,4,5)) #use indices
s3 = select(da, -(2:17)) #use exclusion symbol "-"

#helper functions that are used with "select": "starts_with", "ends_with",
#"contains", "everything(), etc.
s4 = select(da, ends_with("AT")) #columns name that ends with "AT"
s5 = rename(da, When = Year) #change variable name from "Year" to "When"
s6 = select(da, Pulse, Piercings, everything()) 
#move the selected columns to the beginning


#(d) mutate
m1 = mutate(da, BMI = 703 * Weight/(Height)^2) # adding a new column
m2 = transmute(da, BMI = 703 * Weight/(Height)^2) # only keep the newly created column
m3 = transmute(da, log_SAT = log(SAT)) # natural logarithmic transformation


#(e) summarize
su1 = summarize(da, average.SAT = mean(SAT, na.rm = T)) # na.rm: remove missing value
byYear = group_by(da, Year1) # group da by year
su2 = summarize(byYear, average.SAT = mean(SAT, na.rm = T)) # calculate mean value in each year
su3 = summarize(byYear, average.GPA = mean(GPA, na.rm = T))

byGender = group_by(da,Gender) # group da by gender
su4 = summarize(byGender, average.GPA = mean(GPA,na.rm=T)) # calculate mean value in each gender

byYearGender = group_by(da,Year,Gender)
su5 = summarize(byYearGender, average.GPA = mean(GPA,na.rm=T))
##The "pipe" operator

#(1) select Male, find their average GPA by Year
out = da %>% filter(Gender == "M") %>% group_by(Year1) %>% 
  summarize(average.SAT = mean(GPA, na.rm = T))

#(2) practice: select female, who either smoke or don't smoke, 
#and find their respective average SAT
#Think about the ordering of using %>%
out2 = da%>%filter(Gender == "F") %>% group_by(Smoke) %>% 
  summarize(average.SAT = mean(SAT,na.rm=T))
