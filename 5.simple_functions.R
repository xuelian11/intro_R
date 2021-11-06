#e.g. 1 
circle = function(r) {
  
  print(paste("area = ", pi * r^2))
  print(paste("circumference = ", 2 * pi * r))
  
}

#e.g. 2
greet0 = function(name, words) {
  
  paste(words, name, sep = ", ")
  
}

#e.g. 3
greet1 = function(name, words = "Hello") { #provide a default argument
  
  paste(words, name, sep = ", ")
  
}


### II. if ... else statement ###

#e.g. 4
x = 3
if (x > 5){
  print(paste(x, "is greater than 5"))
} else {
  print(paste(x, "is not greater than 5"))
} 


#e.g. 5 
Q1 = 8.05; Q2 = 34.69; Q3 = 33.38
Fare = 25
if (Fare > Q3){
  print("High")
} else if (Fare < Q1){
  print("Low")
} else {
  print("Medium")
}


#e.g. 6
compare2a = function(x, y) {
  
  if(x >= y) {
    paste(x, "is no less than", y)
  } else {
    paste(x, "is smaller than", y)
  }
  
}

#e.g. 7
compare2b = function(x, y) {
  
  if(x > y) {
    paste(x, "is greater than", y)
  } else if (x < y) {
    paste(x, "is smaller than", y)
  } else {
    paste(x, "equals", y)
  }
  
}


### III. Use "for" loop for iteration ###

#e.g. 8
add = function(x){ #x is a numeric vector
  n = length(x)
  total = 0
  
  for (i in 1:n){
    total = total + x[i]
  } 
  
  return(total)
}

#e.g. 9
add.even = function(x){ #x is a numeric vector
  n = length(x)
  total = 0
  
  for (i in 1:n){
    if(x[i] %% 2 == 0) 
      total = total + x[i]
  } 
  
  return(total)
}


#e.g. 10
fib = function(n) {
  
  ph = c(1, 1) #ph: short for place holder, you may use "x" or whatever variable name as you see fit
  
  for (i in 3:n) {
    ph[i] = ph[i-1] + ph[i-2]
  }
  return(ph) 
  #print(paste("The", n, "th Fibonacci number is", ph[n]))
}

#e.g. 11
fib02 = function(n) {
  ph = c(1,1)
  for (i in 3:n){
    ph = c(ph, ph[i-1]+ ph[i-2])
  }
  return(ph)
}


# create a function by calling another function
#e.g. 11
golden.ratio = function(n){
  ratio = c()
  x = fib02(n)
  for (i in 1:(n-1)) {
    ratio[i] = x[i+1]/x[i]
  }
  plot(ratio, type = "b")
}



#e.g. 12
da = mtcars
str(da)
da$fe = 0
n = dim(da)[1]
for (i in 1:n){
  
  if (da$cyl[i] == 4) {
    da$fe[i] = "H"
  } else if (da$cyl[i] == 6){
    da$fe[i] = "M"
  } else {
    da$fe[i] = "L"
  }
  
}
da$fe2 = 0
da[da$cyl ==4,]$fe2 ='H'
da[da$cyl ==6,]$fe2 ='M'
da[da$cyl ==8,]$fe2 ='L'

#Nested loop 
#e.g. 13 (9 times 9 multiplication table)

for (i in 2:9){
  for (j in 1:9){
    print(paste(i, "*", j, "=", i*j))
  }
}


#While loop

#e.g. 14
n = 1
while(n <= 10){
  print(n)
  n = n + 1
}

#e.g. 15
n = 1
ph = 0
while(n <= 10){
  
  ph = ph + n
  n = n + 1
  print(ph)
  
}