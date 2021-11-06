#factors or category
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
(factor_sex_vector <- factor(sex_vector))

# factors can be nominal like "male","female" or 
#ordered (ordinal) like "low","high"
#nominal factor
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector) 
# the output will in alphabetical order
#ordinal factor
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, 
                                    order = TRUE, 
                                    levels = c("Low", "Medium", "High"))
# summarizing a factor
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
summary(survey_vector)
summary(factor_survey_vector)

# summary of ordered factor and comparing between elements
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector,ordered=TRUE,
                              levels=c("slow", "medium", "fast"))
summary(factor_speed_vector)
factor_speed_vector[2]>factor_speed_vector[5]
