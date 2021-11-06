cities = c("New York","Paris","London","Tokyo","Rio de Janeiro","Cape Town")
lapply(cities,nchar) # return a list
unlist(lapply(cities,nchar))  # convert list to vector

oil_prices = list(2.3,2.4,2.1,2.2,2.4,2.3)
multiply = function(x,factor) {
  x*factor
}
times3 = lapply(oil_prices,multiply,factor=3)
unlist(times3)
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split_math <- strsplit(pioneers,split=":")
split_low <- lapply(split_math,tolower) 
#tolower: function to convert uppercase letter to lowercase
#lapply and anonymous function
triple <- function(x) {3*x}
# anonymous function
finction(x) {3*x}
# use anonymous function inside lapply()
lapple(list(1,2,3),function(x) {3*x})

first_and_last <- function(name){
  name = gsub(" ","",name)
  letters = strsplit(name,split="")[[1]]
  c(first = min(letters),last=max(letters))
}
first_and_last("New York")
# sapply()
sapply(cities, first_and_last)
temp = list(c(3,7,9,6,-1),c(6,9,12,13,5),c(4,8,3,-1,-3),
            c(1,4,7,2,-2),c(5,7,9,4,2),c(-3,5,8,9,4),c(3,6,9,4,1))
# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}
# Apply extremes() over temp with sapply()
sapply(temp,extremes)
# Apply extremes() over temp with lapply()
lapply(temp,extremes)

print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp,print_info)

# Apply print_info() over temp using lapply()
lapply(temp,print_info)

# vapply()
vapply(cities, first_and_last, character(2))
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}
vapply(temp, basics, numeric(4)) # numeric(3) will cause error
vapply(temp, max,numeric(1))
vapply(temp, function(x, y) { mean(x) > y }, y = 5,logical(1))

# tapply()
da = mtcars
tapply(da$mpg, da$cyl, mean)
tapply(da$mpg, da$cyl, summary)