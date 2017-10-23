#Read in files
library(stringr)
library(dplyr)

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
readLines(con, 1) ## Read the first line of text
readLines(con, 1) ## Read the next line of text
readLines(con, 5) ## Read in the next 5 lines of text close(con)
close(con) ## It's important to close the connection when you are done

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
readLines(con, 1) ## Read the first line of text
readLines(con, 1) ## Read the next line of text
readLines(con, 5) ## Read in the next 5 lines of text close(con)
close(con) ## It's important to close the connection when you are done

con <- file("en_US.twitter_short.txt", "r")
maxLength <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  maxLength <- max(str_length(line), maxLength)
}
print(maxLength)
close(con) ## It's important to close the connection when you are done


con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
maxLengthUStwitter <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  maxLengthUStwitter <- max(str_length(line), maxLengthUStwitter)
}
print(maxLengthUStwitter)
close(con) ## It's important to close the connection when you are done

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.news.txt", "r")
maxLengthUSnews <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  maxLengthUSnews <- max(str_length(line), maxLengthUSnews)
}
print(maxLengthUSnews)
close(con) ## It's important to close the connection when you are done


con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.blogs.txt", "r")
maxLengthUSblogs <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  maxLengthUSblogs <- max(str_length(line), maxLengthUSblogs)
}
print(maxLengthUSblogs)
close(con) ## It's important to close the connection when you are done


## Question 4

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
UStwitterLoveCount <- 0
UStwitterHateCount <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  UStwitterLoveCount <- UStwitterLoveCount + str_detect(line, "love")
  UStwitterHateCount <- UStwitterHateCount + str_detect(line, "hate")
}
print(UStwitterLoveCount)
print(UStwitterHateCount)
close(con)
UStwitterLoveCount/UStwitterHateCount


## Question 5

#biostats
con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  if (str_detect(line, "biostats")){
    print(line)
  }
}
close(con)


## Question 6


con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
countLine <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  if (str_detect(line, "A computer once beat me at chess, but it was no match for me at kickboxing")){
    print(line)
    countLine <- countLine + 1
  }
}
close(con)
print(countLine)

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
countLine <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1)
  if (str_detect(line, "A computer once beat me at chess")){
    print(line)
    countLine <- countLine + 1
  }
}
close(con)
print(countLine)
