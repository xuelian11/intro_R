# naming a vector
poker_vector <- c(140, -50, 20, -120, 240)
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# calculating sum of vector
total_poker <- sum(poker_vector)

# vector selection: slicing
poker_midweek <- poker_vector[c(2,3,4)]
poker_midweek <- poker_vector[2:5]
mean(poker_midweek)
# vector selection: conditional selection
selection_vector <- poker_vector > 0
poker_winning_days <- poker_vector[selection_vector]
seq(2,3,by=0.5) #?????????0.5???????????????
rep(1:2,times=3) # repeat vector 3 times
rep(1:2,each=3) #repeat each element 3 times
rnorm(3,mean=0,sd=3) 
runif(3,min=0,max=1) 
sample(c("A","B","C"),4,replace=TRUE)

