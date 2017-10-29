library(dplyr)
library(R.utils)
library(stringr)
library(dplyr)
library(tidyverse)
library(tm)
library(stringi)
set.seed(3736)
rbinom(n = 1, size = 1, prob = 0.1)

sampleTextIntoDataframe <- function(pathf, lengthf) {
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

##  Basic read
con <- file("en_US.twitter_short.txt", "rb")
text <- data.frame(read_lines(con))
close(con)
df_source <- DataframeSource(text)
dr_corpus <- VCorpus(df_source)
writeLines(as.character(dr_corpus[[10]]))



### Sample reading

copySampleOfText <- function(pathf, lengthf, flipsf){
    sampleData <- data_frame(text = vector("list", length = sum(flipsf)))
    con <- file(pathf, "rb")
    j = 1
    for (i in 1:lengthf){
        oneLine <- readLines(con, n = 1)
        if (flipsf[i] == 1){
            sampleData[j, 1] <- oneLine
            j <- j+1
        }
    }
    close(con)
    return(sampleData) #returns a tibble
}

## 10% of US twitter entries
set.seed(3736)
theta <- 0.1 # around 10% of cases
totalNumLines <- filter(filesDF, grepl('twitter', filePath))$numLines # number of lines

flips <- rbinom(totalNumLines, size = 1, prob = theta)
sampleData <- data.frame(matrix(nrow = sum(flips), ncol = 1))
con <- file(filter(filesDF, grepl('twitter', filePath))$filePath, "rb")

j = 1
for (i in 1:totalNumLines){
    oneLine <- readLines(con, n = 1)
    if (flips[i] == 1){
        sampleData[j, 1] <- oneLine
        j <- j+1
    }
}
close(con)

save(sampleData, file = "..\\..\\Data\\en_US.twitterSample.RData")

# Same using a function

filePath <- filter(filesDF, grepl('twitter', filePath))$filePath
sampleData2 <- copySampleOfText(filePath, totalNumLines, flips)
save(sampleData2, file = "..\\..\\Data\\en_US.twitterSample2.RData")

df_source <- DataframeSource(sampleData)
dr_corpusSampleData <- VCorpus(df_source)
sampleData3 <- as_tibble(sampleData)
names(sampleData)[1] <- "text"
