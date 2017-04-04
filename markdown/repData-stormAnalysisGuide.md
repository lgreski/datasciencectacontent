# StormData Analysis: A Comprehensive Guide

The course project for *Reproducible Research* is an assignment that tests the limits of the skills students develop during the first five courses in the Johns Hopkins University Data Science Specialization on Coursera.

This is the first course project in the Data Science Specialization that requires students to incorporate what they've learned in data cleaning, R programming, and exploratory data analysis into a research product: an analysis of the 2011 National Oceanographic and Atmospheric Administration (NOAA) *StormData* database.

There are four major categories of problems with the NOAA data that give students fits as they work to complete the assignment. In descending order of severity, they are:

1. Changing data and collection methods over time, <br><br>
2. Poor quality of data, including what Hadley Wickham would describe as ["untidy" data](http://bit.ly/2nyw5Ci), <br><br>
3. Low quality, disorganized documentation, and <br><br>
4. Large data size.

A number of articles to help students complete the assignment have been posted by Community Mentors on the *Reproducible Research* Discussion Forums. These articles usually provide tactical support to the students, helping them solve specific areas of ambiguity with the assignment, such as what the numbers, + and - signs, and letters H, K, M, and B mean in the `PROPDMGEXP` and `CROPDMGEXP` variables.

In *StormData Analysis: A Comprehensive Guide*, we will provide a "big picture" review of the four problems articulated above so students can spend more of their time working with the data, and less of their time running into the same roadblocks that have faced past students.

# The Assignment: It Looks So Simple...

The course project assignment instructions make the task seem simple, asking students to answer two basic questions about the storm data.

> Your data analysis must address the following questions:
>
> 1. Across the United States, which types of events (as indicated in the  variable) are most harmful with respect to population health?<br><br>
>
> 2. Across the United States, which types of events have the greatest economic consequences?

For students who have completed *Exploratory Data Analysis*, they are well equipped to conduct a basic descriptive analysis of the data.

Also, for students who have completed *Getting and Cleaning Data* as well, the students have an understanding of a basic process to conduct a descriptive analysis, including the following steps.
<table>
<tr><td>
<img src="./images/repdata-stormDataGuide01.png"></td><td>1. Extract data from the compressed file, and load it into an R data frame.<br><br>
2. Run basic R functions against the data to understand its features, and determine the types of cleaning and data transformations needed to restructure data in order to answer the research questions.<br><br>
3. Write R code to clean and transform the data.<br><br>
4. Analyze the data, answering the questions required for the assignment, and support the analysis with relevant graphics and statistics.  </td></tr>
</table>

The instructions include access to the [data file](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2), a [codebook](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf), and a [frequently asked questions web page](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf) from the NOAA.



# Problem 1: Changing Data & Collection methods

*

# Problem 2: Poor Data Quality

* Even the NOAA says the data isn't accurate (see 2012 NOAA presentation)
*

# Problem 3: Low Quality Documentation

Items to cover in this section include:

* NWS Directive is both too detailed and not detailed enough
* No useful index of how different pieces of documentation relate to each other
* Web documentation still looks like 1995-era website
* Low signal to noise ratio in the documentation
* Lots of unexplained jargon
* Critical documentation is buried on FTP servers, requriing a lot of effort to discover it
* NWS Directive does not explain how data collection varies over time
* Need the Operations manual to fully understand the data, and it's not easily accessible

# Problem 4: Large Data Size

# Solutions for Students: Defensible Responses to the Problems

# Conclusions

# Appendix

## Information Available from the National Oceanographic and Atmospheric Administration

[National Weather Services Directive 10-1605](https://www.ncdc.noaa.gov/stormevents/pd01016005curr.pdf)

[National Weather Service Operations Manual Chapter F-42](http://www.nws.noaa.gov/wsom/manual/archives/NF429405.HTML) Contains the 1994 version of the *User's Guide for the Storm Data Database*, which provides important details on how data is entered into the database.

[NOAA StormData FAQ](https://www.ncdc.noaa.gov/stormevents/faq.jsp)

[NOAA Storm Data Details](https://www.ncdc.noaa.gov/stormevents/details.jsp)

[NOAA Storm Data Downloadable Files](https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/)

##
