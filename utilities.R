v1 = c(1.1,-7.1,5.4,-2.7)
v2 = c(-3.6,4.1,5.8,-8.0)
mean(c(sum(round(abs(v1))),sum(round(abs(v2)))))
sort(rep(seq(8,2,by=-2),times = 2))
sort(c(8,6,4,2,8,6,4,2),decreasing=TRUE)
is.list(v1)
li = as.list(v1)
is.list(li)
#unlist(li)
append(li,rev(li))
# regular expression
animals <- c("cat","mouse","impala","ant","kiwi")
grepl(pattern = "a",x=animals) # whether character contain "a"
grepl(pattern = "^a",x=animals) # whether character start with "a"
grepl(pattern = "a$",x=animals) # whether character end with "a"
sub(pattern = "a",replacement="o",x=animals)# will not replace the second "a" in "impala"
gsub(pattern = "a",replacement="o",x=animals) #will replace all the a
gsub(pattern="a|i",replacement="_",x=animals) # all "a" and "i" will be replaced

emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")
# Use grepl() to match for .edu addresses more robustly
grepl(pattern="@.*\\.edu$",x=emails)
# Use grep() to match for .edu addresses more robustly, save result to hits
hits = grep(pattern = "@.*\\.edu$",x=emails)
emails[hits]
#You can use them to match any character between the at-sign and the ".edu" 
#portion of an email address
#\\.edu$, to match the ".edu" part of the email at the end of the string. 
#The \\ part escapes the dot: 
#it tells R that you want to use the . as an actual character.

#.*: A usual suspect! It can be read as "any character that is matched zero or more times".
#\\s: Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
#[0-9]+: Match the numbers 0 to 9, at least once (+).
#([0-9]+): The parentheses are used to make parts of the matching string available to define the replacement. 
#The \\1 in the replacement argument of sub() gets set to the string that is captured by the regular expression [0-9]+.

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

# Time and Date
today = Sys.Date()
now = Sys.time()
my_date = as.Date("1971-04-05")
my_date1 = as.Date("1971-14-05", format = "%Y-%d-%m")
my_date + 1
my_date1 - my_date
#POSIXct objects on the other hand, 
#store the number of seconds since the 1st of January in 1970.


# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 = as.POSIXct(str2,format = "%Y-%m-%d %H:%M:%S")

# Convert times to formatted strings
format(time1,"%M")
format(time2,"%I:%M %p")
vec = c(2,3,8,26,32)
diff(vec) # differences between two consecutive elements
