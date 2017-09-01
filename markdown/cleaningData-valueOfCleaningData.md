# Importance of Getting and Cleaning Data

Hurricane Harvey was a major weather event in the United States during late August 2017. Within 48 hours of the time Harvey made landfall on August 25th, I observed a graphic posted on Twitter by [@datavisualinfo](http://bit.ly/2izTItC) regarding the frequency of hurricanes between 1851 and 2015. The graphic  illustrates why it is so important to thoroughly understand the data one collects. [@datavisualinfo](http://bit.ly/2izTItC) published the following chart to showcase their data visualization tool.

<img src="./images/cleaningData-valueOfCleaningData01.png">

As we can see from the chart footer, the data was sourced from the [Weather Underground Hurricane Archive](http://bit.ly/2vz4S2L). Using techniques learned in *Getting & Cleaning Data*, we can parse the HTML data into R and analyze it ourselves. There are four regions for which data is collected, including:

North Atlantic Ocean
Indian Ocean
East Pacific Ocean
West Pacific Ocean
When we draw some simple plots (a technique taught in Exploratory Data Analysis), we observe some very interesting patterns in the regional data. Since these were exploratory plots, I didn't bother to standardize the Y axis across the four charts.

<img src="./images/cleaningData-valueOfCleaningData02.png">

Three of the four regions appear to have little to no data collection prior to 1950, and the only region with data back to 1851 seems to have no discernible trend in hurricane frequency. If I run a linear model on the Atlantic Ocean data, we find that the *R squared* for year predicting the number of hurricanes is only 0.04, meaning that the two variables year and hurricane are pretty close to independent (where *R squared* = 0).

A search on the internet for [Indian Ocean Cyclones](http://bit.ly/2wIpkDC) shows that there were many [cyclones recorded before 1950](http://bit.ly/2vz5zcI). Therefore, the data on the Weather Underground site used for the Data Visual chart is incomplete. Additional searches for Pacific Ocean Cyclones results in additional information about cyclones before 1950 in New Zealand, calling into question the data for the two Pacific Ocean regions.

Bottom line: the conclusion drawn in the original chart is wrong until we can confirm that the all four regions are correctly coded for hurricanes prior to 1950.

<img src="./images/cleaningData-valueOfCleaningData03.png">

# Appendix

Since the data on web pages can change frequently, I saved the relevant HTML pages so I could reproduce the research. These files are stored at 
