### attempt to read w/ rvest package 21 Nov 2020 
### ESPN redesigned their NFL site again, making it more difficult to parse

library(rvest)
baseURL <- "https://www.espn.com/nfl/team/schedule/_/name/bal"

html <- read_html(baseURL)
## content selected with rvest SelectorGadget 
theTable <- html_nodes(html,xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "Table__TD", " " ))] | //*[contains(concat( " ", @class, " " ), concat( " ", "Card__Content", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "items-center", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "dib", " " ))]')
textData <- html_text(theTable)
# use iebiball / vgrep to find where each row begins, easier
# to see when viewed as a data frame
df <- data.frame(textData)
View(df)

# elements 59, 60 are BYE week
rowStartIDs <- c(11,19,27,35,43,51,61,69,77,85)
gamesPlayed <- data.frame(do.call(rbind,
                                  lapply(rowStartIDs,function(x) textData[x:(x+7)])))
colnames(gamesPlayed) <- c("Week","Date","Opponent","Result","Record","HighPasser",
                           "HighRusher","HighReceiver")




### older version of code that has 351 elements due to differences in xpath,
### which parses out additional data 

# observe each row of played games has 19 data elements, bye week has 3
# elements, and unplayed games have 12 data elements 


library(rvest)
baseURL <- "https://www.espn.com/nfl/team/schedule/_/name/bal"
html <- read_html(baseURL)
## content selected with rvest SelectorGadget 
theTable <- html_nodes(html,xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "Table__TD", " " ))] | //span')
textData <- html_text(theTable)

# assign ID value based on element in vector where played games start,
# ignoring bye week 
rowStartIDs <- c(43,62,81,100,119,138,160,179,198)

# columns to retain include 1,3,6,8,10,11,12,14,16,18
gamesPlayed <- data.frame(do.call(rbind,
                          lapply(rowStartIDs,function(x) textData[x:(x+18)])))[c(1,3,6,8,10,11,12,14,16,18)]
# add column names 
colnames(gamesPlayed) <- c("Week","Date","Location","Opponent", "Outcome",
                 "Score","Record","HighPasser","HighRusher","HighReceiver")