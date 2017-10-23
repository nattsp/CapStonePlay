#Read in files
library(stringr)
library(dplyr)
library(tidyverse)
library(readr)

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

con <- file("en_US.twitter_short.txt", "rb")
number_lines <- 0
maxLength <- 0
while (length(oneLine <- read_lines(con)) > 0) {
  #line <- readLines(con, 1)
  print(oneLine)
  maxLength <- max(str_length(line), maxLength)
  number_lines <- number_lines + 1
}
print(maxLength)
print(number_lines)
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

## Question 3 again

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.blogs.txt", "rb")
maxLengthUSblogs <- 0
numberLines <- 0
while (length(oneLine <- read_lines(con)) > 0) {
  #line <- read_lines(con, 1)
  maxLengthUSblogs <- max(str_length(oneLine), maxLengthUSblogs)
  numberLines <- numberLines + 1
}
print(maxLengthUSblogs)
print(numberLines)
close(con) ## It's important to close the connection when you are done

con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.news.txt", "rb")
maxLengthUSnews <- 0
numberLines <- 0
while (length(oneLine <- read_lines(con)) > 0) {
  #line <- readLines(con, 1)
  maxLengthUSnews <- max(str_length(oneLine), maxLengthUSnews)
}
print(maxLengthUSnews)
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
countQuote <- 0
countLine <- 0
while (length(oneLine <- readLines(con, n = 1, skipNul = TRUE, warn = FALSE)) > 0) {
  line <- readLines(con, 1, skipNul = TRUE)
  countLine <- countLine + 1
  if (str_detect(line, "A computer once beat me at chess, but it was no match for me at kickboxing")){
    print(line)
    countQuote <- countQuote + 1
  }
}
close(con)
print(countQuote)
print(countLine)


con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
countLine <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  line <- readLines(con, 1, skipNul = TRUE)
  if (str_detect(line, "A computer once beat me at chess")){
    print(line)
    countLine <- countLine + 1
  }
}
close(con)
print(countLine)


con <- file("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", "r")
countQuote <- 0
countLine <- 0
while (length(oneLine <- readLines(con, n = 1, skipNul = TRUE, warn = FALSE)) > 0) {
  line <- readLines(con, 1, skipNul = TRUE)
  countLine <- countLine + 1
  if (str_detect(line, "A computer once beat me at chess, but it was no match for me at kickboxing")){
    print(line)
    countQuote <- countQuote + 1
  }
}
close(con)
print(countQuote)
print(countLine)
