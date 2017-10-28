##*************************************
## Investigate files
##
##*************************************

library(R.utils)
library(stringr)
library(dplyr)
library(tidyverse)
library(tm)
library(stringi)

## Investigate short files first
con <- file("en_US.twitter_short.txt", "rb")
number_lines <- 0
maxLength <- 0
while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  #line <- readLines(con, 1)
  if (str_detect(oneLine, [aeiou])) print("has vowel")
  print(oneLine)
  print(length(oneLine))
  maxLength <- max(length(oneLine), maxLength)
  number_lines <- number_lines + 1
  print(number_lines)
}
print(maxLength)
close(con)

printAndCount <- function(oneLine, maxLength){
  if (str_detect(oneLine, "^.*[\\W)]+$")) {
    #print("has no letter")
    print(oneLine)
  }
  maxLength <- max(str_length(oneLine), maxLength)
  return(maxLength)
}

## Investigate short files first
con <- file("en_US.twitter_short.txt", "rb")
number_lines <- countLines(con)
close(con)
con <- file("en_US.twitter_short.txt", "rb")
#number_lines <- 0
maxLength <- 0
twitter_short <- data.frame(matrix(nrow = number_lines, ncol = 1))

oneLine <- readLines(con, n=1)
oneLine
for (i in 1:number_lines) {
  oneLine <- readLines(con, n = 1)
  twitter_short[i, 1] <- oneLine
  print(oneLine)
  print(i)
}

while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) { 
  #print(number_lines <- number_lines +1)
  maxLength <- printAndCount(oneLine, maxLength)
}
print(maxLength)
close(con)


### countNumLines

countNumLines <- function(path) {
    con <- file(path, "rb")
    number_lines <- countLines(con)
    close(con)
    return(number_lines)
}

countNumLinesAllFiles <- function(filesDFf) {
    n <- length(filesDFf$filePath)
    numLinesListf <- vector("list", n)
    for (i in 1:n){
        path <- filesDF$filePath[i]
        print(path)
        numLinesListf[i] <- countNumLines(path)
    }
    return(unlist(numLinesListf, recursive = FALSE))
    #return(numLinesListf)
}

countRowLength <- function(pathf, lengthf) {
  conf <- file(pathf, "rb")
  maxLengthf <- 0
  for (i in 1:lengthf){
    linefun <- readLines(conf, n = 1)
    linelength <- str_length(linefun)
    if (linelength > maxLength){
      print(i)
      print(maxLength <- linelength)
      print(linefun)
    }
  }
  close(conf)
  return(maxLength)
}

rowLengthLinesAllFiles <- function(filesDFf) {
  n <- length(filesDFf$filePath)
  lengthLinesListf <- vector("list", n)
  for (i in 1:n){
    path <- filesDF$filePath[i]
    numLinesf <- filesDF$numLines[i]
    print(path)
    lengthLinesListf[i] <- countRowLength(path, numLinesf)
  }
  return(unlist(lengthLinesListf, recursive = FALSE))
}


filesDF <- data.frame(filePath = c(
  "..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt"
  ,"..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.news.txt"
  ,"..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.blogs.txt"
)
, stringsAsFactors = FALSE
)

numLinesList <- countNumLinesAllFiles(filesDF)
filesDF <- bind_cols(filesDF, numLines = numLinesList)

#### Count length of lines

#countRowLength("en_US.twitter_short.txt", 11)
#countRowLength("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\en_US.twitter.txt", 2360148)

lengthLinesList <- rowLengthLinesAllFiles(filesDF)
filesDF <- bind_cols(filesDF, longestLength = lengthLinesList)

save(filesDF, file = "..\\..\\Data\\filesDF.RData")
