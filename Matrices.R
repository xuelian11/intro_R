new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
box_office <- c(new_hope, empire_strikes,return_jedi)
## method 1
star_wars_matrix <- matrix(box_office, nrow=3, byrow=TRUE)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
colnames(star_wars_matrix) <- region
rownames(star_wars_matrix) <- titles 

# method 2
star_wars_matrix2 <- matrix(box_office, nrow = 3
                           , byrow = TRUE
                           ,dimnames = list(c("A New Hope", "The Empire Strikes Back",
                                              "Return of the Jedi"), 
                                           c("US", "non-US")))
# calculating row sum
worldwide_vector <- rowSums(star_wars_matrix)

# add new column to matrix using cbind(metrix, vector)
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)
# calculating column sum
total_revenue_vector <- colSums(all_wars_matrix)

# add rows to matrix using rbind()
#number of columns of matrices must match
matrix2 <- rbind(star_wars_matrix,star_wars_matrix2)

# matrix division
(star_wars_matrix)
ticket_prices_matrix <- matrix(c(5,5,6,6,7,7),nrow=3,
                               byrow=TRUE,
                               dimnames = list(c("A New Hope", 
                                                 "The Empire Strikes Back",
                                                  "Return of the Jedi"),
                                               c("US", "non-US")))
star_wars_matrix/ticket_prices_matrix
