# logical operation
# compare each element pair in the two vector
c(TRUE,TRUE,FALSE) & c(TRUE,FALSE,FALSE)
#only compare the first element in each vector
c(TRUE,TRUE,FALSE) && c(TRUE,FALSE,FALSE)

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
# last element in linkedin
last <- tail(linkedin, 1)

x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))
#Build a logical vector, TRUE if value in second is extreme: extremes
second = c(132,1,5,26,12,233,245)
extremes = second > 25 |second < 5
sum(extremes)

# if & else if 
n=2500
if (n <10) {
  if (n < 5) {
    result = "extra small"
  } else {
    result = "small"
  }
} else if (n <100) {
  result = "medium"
} else {
  result = "large"
}
print(result)

i=3
(3*i)%%8 
