# Reproducible Research Final Project: Improving Initial Data Read Performance

One of the most useful features in R is the ability of the `knitr` package to produce high quality analyses that combine text and graphics in a reproducible way. That is, if code that provides internet access to the original data sources is included in the R Markdown document, anyone with R can completely reproduce the analysis.

However, when working with large data sets, the default behavior of knitr to rerun the entire analysis can be time consuming, making the data scientist wait to test various pieces of code in the analysis. Assignment 2: the NOAA Storm Data Analysis is a case in point. Many students in *Reproducible Research* struggle with slow response times when they have to read the storm events raw data file into R.

Here are four approaches to improving the response time performance of the initial load.  

1. Set `stringsAsFactors=FALSE` on `read.csv()`. One of the default argument settings is to convert strings to factors, and this is very slow for the Storm Data data set (71 seconds read time on an [HP Spectre x-360 laptop](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/repdata-improvingInitialFileReadSpeed.md#appendix-computer-specifications)) vs. 31 seconds when stringsAsFactors=FALSE.<br><br>
2. Use a more efficient program to read the data, such as `readr::read_csv()`. I write about this in [Real World Example: Reading American Community Survey U.S. Census Data](http://bit.ly/2bAdLE9). On my laptop, `readr::read_csv()` reads the NOAA Storm Data data in 11.3 seconds.<br><br>
3. Write logic to read the data once, and save it as a serialized object with `saveRDS()`. Once saved, the data can be read with `readRDS()`, which takes about 10.7 seconds on my laptop.<br><br>
4. Use `knitr` options to [cache results of code chunks](http://rstudio-pubs-static.s3.amazonaws.com/180_77c843dcecf2406fb89d35dd0476628a).<br><br>

With #3, the logic to do this would look like the following, including programming statements to track the load, save, and read times.

      if (!file.exists("./repdata/assignment2/stormData.rds")) {
           message("Entered file does not exist block")
           library(readr)
           intervalStart <- Sys.time()
           stormData <- read_csv("./repdata/assignment2/repdata-data-StormData.csv",
                                 n_max = 902297,
                                 col_names = TRUE,
                                 ...) # additional arguments go here
           intervalEnd <- Sys.time()
           message(paste("readr::read_csv() took: ",intervalEnd - intervalStart,attr(intervalEnd - intervalStart,"units")))
           intervalStart <- Sys.time()
           saveRDS(stormData,"./repdata/assignment2/stormData.rds")
           intervalEnd <- Sys.time()
           message(paste("saveRDS() took: ",intervalEnd - intervalStart,attr(intervalEnd - intervalStart,"units")))

           } else {
                message('Entered readRDS() block')
                intervalStart <- Sys.time()
                stormData <- readRDS("./repdata/assignment2/stormData.rds")
                intervalEnd <- Sys.time()
                message(paste("readRDS() took: ",intervalEnd - intervalStart,attr(intervalEnd - intervalStart,"units")))

        }

Note that I added statements to show when each code block is executed, as well as to take performance timings for the data reads and writes.

# Appendix: Computer Specifications

The computer used for the performance timings listed in the article has the following specifications.

<table>
<tr>
<td valign=top>HP Spectre X360 laptop</td>
<td>
    <ul>
        <li>Operating system: Microsoft Windows 10, 64bit</li>
        <li>Processor: Intel Core i7-6500U at 2.5Ghz, turbo up to 3.1Ghz, two cores</li>
        <li>Memory: 8 gigabytes</li>
        <li>Disk: 512 gigabytes, solid state drive</li>
        <li>Date built: December 2015</li>
    </ul>
</td>
</tr>
</table>
