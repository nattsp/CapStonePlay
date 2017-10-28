## tm

library(tm)

##Produce just 3 documents

source <- DirSource("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\",
                    encoding = "UTF-8",
                    ignore.case = TRUE)

ovid <- SimpleCorpus(source)
summary(ovid)

##

source <- DirSource("..\\..\\Data\\Coursera-SwiftKey\\final\\en_US\\",
                    encoding = "UTF-8",
                    ignore.case = TRUE)

ovid <- SimpleCorpus(source)
summary(ovid)

##


con <- file("en_US.twitter_short.txt", "rb")
text <- data.frame(read_lines(con))
df_source <- DataframeSource(text)
dr_corpus <- VCorpus(df_source)
text <- read.delim("en_US.twitter_short.txt", sep = "/n")
text_corpus <- Corpus(VectorSource(text), readerControl = list(language = "en"))