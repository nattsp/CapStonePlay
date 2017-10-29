## Cleaning

library(SnowballC)
library(dplyr)
library(tidyverse)
library(tidytext)
library(stringr)

## Stopwords

data(stop_words)
swearWords <- data.frame(word = c(
    "bitches"
    ,"fuck"
    ,"slut"
    ,"sex"
    ,"cunt"
    ,"tits"
    ,"cocksucker"))

removeDigits <-  function(x){
    str_replace(x, '\\d', '')
}

#sampleDataWithRowTibble[grepl('[0-9]', sampleDataWithRowTibble$text), 2]
SampleDatatidy <- sampleDataWithRowTibble %>%
    mutate_at(text, funs(removeDigits))

mutate_at(sampleDataWithRowTibble, text, funs(removeDigits))

## remove digits
SampleDatatidy <- sampleDataWithRowTibble
SampleDatatidy$text <- str_replace_all(SampleDatatidy$text, '\\d', ' ')

## remove any non word or space terms
SampleDatatidy$text <- str_replace_all(SampleDatatidy$text, '[^\\w ]', ' ')

## convert to lower case
SampleDatatidy$text <- tolower(SampleDatatidy$text)

sampleDataWords <- sampleDataWithRowTibble %>%
    unnest_tokens(word, text)

sampleDataWords <- sampleDataWords %>%
    anti_join(stop_words)

## No swear words found
sampleDataWords %>%
    anti_join(swearWords)
select(sampleDataWords, contains("fuck"))

sampleDataWords %>%
    count(word, sort = TRUE)
 
