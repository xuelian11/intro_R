linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
avg_sum = mean(linkedin+facebook)
avg_sum_trimmed =mean(linkedin+facebook, trim=0.2) 
# trim: the fraction of observations to be trimmed from each end of x 
#before the mean is calculated

linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)
print(mean(linkedin))
print(mean(linkedin,na.rm=TRUE)) 
# need to remove missing values before calculating mean,else the mean is NA

# function inside function
mean(abs(linkedin-facebook),na.rm=TRUE)

increment <- function(x, inc = 1) {
  x <- x + inc
  x
}
count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count, 2)

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum=TRUE) {
  count <- 0
  
  for (v in views) {
    count = count+interpret(v)
  }
  
  if (return_sum) {
    return(count)
  } else {
    return (NULL)
  }
}

interpret_all(linkedin)
interpret_all(facebook)