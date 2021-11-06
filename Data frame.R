# data frame in R
day = c("Mon","Tue","Wed","Thu","Fri")
Wk1 = c(10,12,6,12,1)
Wk2 = c(11,17,16,10,4)
Wk3 = c(17,13,13,18,5)
Wk4 = c(12,7,13,13,2)
da = data.frame(day,Wk2,Wk2,Wk3,Wk4)

# constructing a data frame
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type,diameter, rotation, rings)

# subset of data frame
subset(planets_df,diameter<1)
# check data type of data frame (numerical, loical, character)
str(planets_df)

# selection of data frame
planets_df[1:5, "diameter"]

# sorting data frame
positions <-  order(planets_df$diameter)
planets_df[positions,]