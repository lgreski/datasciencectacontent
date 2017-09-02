# Importance of Getting and Cleaning Data

Hurricane Harvey was a major weather event in the United States during late August 2017. Within 48 hours of the time Harvey made landfall on August 25th, I observed a graphic posted on Twitter by [@datavisualinfo](http://bit.ly/2izTItC) regarding the frequency of hurricanes between 1851 and 2015. The graphic  illustrates why it is so important to thoroughly understand the data one collects. [@datavisualinfo](http://bit.ly/2izTItC) published the following chart to showcase their data visualization tool.

<img src="./images/cleaningData-valueOfCleaningData01.png">

As we can see from the chart footer, the data was sourced from the [Weather Underground Hurricane Archive](http://bit.ly/2vz4S2L). Using techniques learned in *Getting & Cleaning Data*, we can parse the HTML data into R and analyze it ourselves. There are four regions for which data is collected, including:

* North Atlantic Ocean
* Indian Ocean
* East Pacific Ocean
* West Pacific Ocean

When we draw some simple plots (a technique taught in the Johns Hopkins *Exploratory Data Analysis* course), we observe some very interesting patterns in the regional data. Since these were exploratory plots, I didn't take the time to standardize the Y axis across the four charts.

<img src="./images/cleaningData-valueOfCleaningData02.png">

Three of the four regions appear to have little to no data collection prior to 1950, and the only region with data back to 1851 seems to have no discernible trend in hurricane frequency. If I run a linear model on the Atlantic Ocean data, we find that the *R squared* for year predicting the number of hurricanes is only 0.0492, meaning that the two variables year and hurricane are pretty close to independent (where *R squared* = 0).

A search on the internet for [Indian Ocean Cyclones](http://bit.ly/2wIpkDC) shows that there were many [cyclones recorded before 1950](http://bit.ly/2vz5zcI). Therefore, the data on the Weather Underground site used for the Data Visual chart is incomplete. Additional searches for Pacific Ocean Cyclones results in additional information about [cyclones before 1950 in New Zealand](http://bit.ly/2vz5zcI), calling into question the data for the two Pacific Ocean regions.

Bottom line: the conclusion drawn in the original chart is wrong until we can confirm that the all four regions are correctly coded for hurricanes prior to 1950.

<img src="./images/cleaningData-valueOfCleaningData03.png">

# Appendix

## How about some Reproducible Research?

Since the data on web pages can change frequently, I saved the relevant HTML pages so I could reproduce the research. These files are stored on my [datasciencedepot github repository](http://bit.ly/2xDLoMX).

To reproduce my research, one can run the following R scripts.

First, we need the code to read one of the HTML files. We've built it as an R function because the code is the same for all four HTML files.

    #
    # readHurricaneHistory.R
    #

    readHurricaneData <- function(fileUrl,firstTableRow=606,startYear=1851,endYear=2015){
         theFile <- readLines(fileUrl,n=2500)
         theFile <- gsub("\t","",theFile)
         theFile <- gsub("<td>","",theFile)
         theFile <- gsub("</td>","",theFile)
         theFile <- gsub(",","",theFile)
         year <- endYear:startYear
         storms <- rep(0,length(year))
         hurricanes <- rep(0,length(year))
         deaths <- rep(" ",length(year))
         damage <- rep(" ",length(year))
         theData <- data.frame(year,storms,hurricanes,deaths,damage,stringsAsFactors=FALSE)
         lineCt <- seq(from = firstTableRow,to = sum(firstTableRow,length(year) * 10,-1),by=10)
         i <- 0 # output row
         for (line in lineCt ){
              i <- i + 1
              theData[i,"storms"] <- as.numeric(theFile[line + 2])
              theData[i,"hurricanes"] <- as.numeric(theFile[line + 3])
              theData[i,"deaths"] <- theFile[line + 4] # some rows have > symbols
              theData[i,"damage"] <- theFile[line + 5]
         }
         theData
    }


Next, we need the code to generate execute the reader on the four files and generate the charts.  In order to execute this code, one must clone the [lgreski/datasciencedepot](http://bit.ly/2eN3K6i) github repository, and edit the following code to point to its data directory.

    #
    # set directory where datasciencedepot/data was cloned
    #
    gitRepoDir <- "~/gitrepos/datasciencedepot/data/"

Run the following code to generate the four charts that I posted on Twitter, and the linear model.

    #
    # read the four regional hurricane history files
    #

    fileUrl <- paste(gitRepoDir,"/indianOceanHurricanes.html",sep="")
    # first row of table data: 606
    # last row of table data: 606 + 10 * 165 - 1 = 1650 + 606 -1 = 2255
    indianOcean <- readHurricaneData(fileUrl,
                                     firstTableRow=606,startYear=1851,endYear=2015)

    # North Atlantic Ocean

    fileUrl <- paste(gitRepoDir,"/northAtlanticHurricanes.html",sep="")
    atlanticOcean <- readHurricaneData(fileUrl,
                                       firstTableRow=606,startYear=1851,endYear=2015)

    # East Pacific Ocean
    fileUrl <- paste(gitRepoDir,"/eastPacificHurricanes.html",sep="")
    eastPacific <- readHurricaneData(fileUrl,
                                     firstTableRow=606,startYear=1851,endYear=2015)

    # West Pacific Ocean
    fileUrl <- paste(gitRepoDir,"/westPacificHurricanes.html",sep="")
    westPacific <- readHurricaneData(fileUrl,
                                     firstTableRow=606,startYear=1851,endYear=2015)

    plot(indianOcean$year,indianOcean$hurricanes,type="l",
         xlab = "Year",
         ylab = "Hurricanes",
         main = "Hurricanes by Year: Indian Ocean")

    plot(atlanticOcean$year,atlanticOcean$hurricanes,type="l",
         xlab = "Year",
         ylab = "Hurricanes",
         main = "Hurricanes by Year: North Atlantic Ocean")

    plot(eastPacific$year,eastPacific$hurricanes,type="l",
         xlab = "Year",
         ylab = "Hurricanes",
         main = "Hurricanes by Year: East Pacific Ocean")

    plot(westPacific$year,westPacific$hurricanes,type="l",
         xlab = "Year",
         ylab = "Hurricanes",
         main = "Hurricanes by Year: West Pacific Ocean")

    aModel <- lm(hurricanes ~ year,data = atlanticOcean)
    summary(aModel)
