## Cleaning

library(SnowballC)
library(dplyr)
library(tidyverse)
library(tidytext)
library(stringr)
library(ggplot2)

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

sampleDataTwittWords <- SampleDatatidy %>%
    unnest_tokens(word, text) %>%
    mutate(sample = "Twitter") %>%
    select(sample, word) %>%
    count(sample, word, sort = TRUE) %>%
    ungroup()

#mutate(sampleDataTwittWords, sample = "Twitter")

#sampleData <- sampleDataWithRowTibble %>%
#    unnest_tokens(word, text)



### blogs


sampleBlogsTidy <- sampleBlogsT %>%
    mutate(text = str_replace_all(text, '\\d', ' ')) %>%
    mutate(text = str_replace_all(text, '[^\\w ]', ' ')) %>%
    mutate(text = tolower(text))

sampleBlogsWords <- sampleBlogsTidy %>%
    unnest_tokens(word, text) %>%
    mutate(sample = "Blogs") %>%
    select(sample, word) %>%
    count(sample, word, sort = TRUE) %>%
    ungroup()

### news

sampleNewsTidy <- sampleNewsT %>%
    mutate(text = str_replace_all(text, '\\d', ' ')) %>%
    mutate(text = str_replace_all(text, '[^\\w ]', ' ')) %>%
    mutate(text = tolower(text))

sampleNewsWords <- sampleNewsTidy %>%
    unnest_tokens(word, text) %>%
    mutate(sample = "News") %>%
    select(sample, word) %>%
    count(sample, word, sort = TRUE) %>%
    ungroup()


### combine

sampleWords <- bind_rows(
    sampleDataTwittWords
    , sampleBlogsWords
    , sampleNewsWords)

totalWords <- sampleWords %>% 
    group_by(sample) %>% 
    summarize(total = sum(n))

sampleWords <- left_join(sampleWords, totalWords)


##plot



ggplot(sampleWords, aes(n/total, fill = sample)) +
    geom_histogram(show.legend = FALSE) +
    xlim(NA, 0.000009) +
    facet_wrap(~sample, ncol = 2, scales = "free_y")















sampleDataWords <- sampleDataWords %>%
    anti_join(stop_words)

## No swear words found
sampleDataWords %>%
    anti_join(swearWords)
select(sampleDataWords, contains("fuck"))

sampleDataWords %>%
    count(word, sort = TRUE)
 
