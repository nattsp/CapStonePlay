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

copySampleOfText2 <- function(pathf, lengthf, flipsf){
    sampleSize <- sum(flipsf)
    sampleData <- data.frame(
        textNumber = numeric(sampleSize)
        , text = character(sampleSize)
        , stringsAsFactors = FALSE)
    con <- file(pathf, "rb")
    j = 1
    for (i in 1:lengthf){
        oneLine <- readLines(con, n = 1)
        if (flipsf[i] == 1){
            sampleData[j, 1] <- i
            sampleData[j, 2] <- oneLine
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
save(sampleData3, file = "..\\..\\Data\\en_US.twitterSample3.RData")

df_source <- DataframeSource(sampleData)
dr_corpusSampleData <- VCorpus(df_source)
sampleData3 <- as_tibble(sampleData)
names(sampleData)[1] <- "text"

flipsRow <- as.data.frame(flips)
flipsRow$RowCount <- 1:nrow(flipsRow)
rowCount <- filter(flipsRow, flips == 1)

copySampleOfText2 <- function(pathf, lengthf, flipsf)
sampleDataWithRow <- copySampleOfText2(filePath, totalNumLines, flips)
sampleDataWithRowTibble <- as_tibble(sampleDataWithRow)
save(sampleDataWithRowTibble, file = "..\\..\\Data\\sampleDataWithRowTibble.RData")


load(file = "..\\..\\Data\\sampleDataWithRowTibble.RData")

nrow(sampleDataWithRowTibble)

# I too around 10 percent of the twitter data as a sample to begin working with
# This was 236,438 rows
# I decided to use this number of documents from the other sets
totalNumLinesNews <- filter(filesDF, grepl('news', filePath))$numLines
filePath <- filter(filesDF, grepl('news', filePath))$filePath
sampleSize <- 236438
flips_news <- rbinom(totalNumLinesNews, size = 1, prob = sampleSize/totalNumLinesNews)


sampleNews <- copySampleOfText2(filePath, totalNumLinesNews, flips_news)
sampleNewsT <- as.tibble(sampleNews)
sampleNewsT
save(sampleNewsT, file = "..\\..\\Data\\sampleNewsT.RData")
nrow(sampleNewsT)

#Sample blogs

totalNumLinesBlogs <- filter(filesDF, grepl('blogs', filePath))$numLines
filePath <- filter(filesDF, grepl('blogs', filePath))$filePath
flips_blogs <- rbinom(totalNumLinesBlogs, size = 1, prob = sampleSize/totalNumLinesBlogs)

sampleblogs <- copySampleOfText2(filePath, totalNumLinesBlogs, flips_blogs)
nrow(sampleblogs)
sampleBlogsT <- as.tibble(sampleblogs)
save(sampleBlogsT, file = "..\\..\\Data\\sampleBlogsT.RData")
