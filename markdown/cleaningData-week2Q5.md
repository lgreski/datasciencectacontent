# Getting and Cleaning Data: Reading Fixed Width Files for Quiz 2

Question 5 in the week 2 quiz is deceptively simple: *report the sum of the fourth of the nine columns.* To answer this question correctly, it is important to view the file before writing any R code.


<img src="./images/cleaningData-week2q5-01.png">

Nine columns? The screen capture looks like 5 columns, not 9. However, there are truly 9 columns of data in this file, including:

1. week
2. Nino1and2SST
3. Nino1and2SSTA
4. Nino3SST
5. Nino3SSTA
6. Nino34SST
7. Nino34SSTA
8. Nino4SST
9. Nino4SSTA

The subtlety one must see to distinguish 9 columns from the list of 5 is that for some rows, the initial character for some of the columns is a minus sign.

The challenge is how to read the fourth column, Nino3SST, correctly. The columns are real numbers, not integers as stated in a Discussion Forum post on Coursera. That is, they contain decimal points and one value to the right of the decimal point.

<img src="./images/cleaningData-week2q5-02.png">

A text editor such as UltraEdit that provides a column number display makes it a bit easier to know which columns to read.

<img src="./images/cleaningData-week2q5-03.png">

The negative signs and column numbers must both be accounted for in the R function used to read the data.

## Additional Considerations

To answer the quiz question correctly, students must read the correct data file. The quiz question provides two URLs, [one to be used for the quiz](https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for) and another that is a link to the original data source that is continually updated.

<img src="./images/cleaningData-week2q5-04.png">

Many students get frustrated because they read the original data source directly from [the NOAA website](http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for), which has more records than the file to be used for the quiz. The correct file has 1,254 observations, starting with data from January 3, 1990 and ending on January 8, 2014, as illustrated below.

<img src="./images/cleaningData-week2q5-05.png">

As of October 14, 2017, the data from the NOAA has 1,449 observations, the most recent of which is from October 4th, 2017.

<img src="./images/cleaningData-week2q5-06.png">

## Background on the Data Set

The data set is maintained by the United States National Oceanographic and Atmospheric Administration. SST is an abbreviation of *sea surface temperature*. SSTA is an abbreviation of *sea surface temperature anomaly*.

There are four regions for which the NOAA collects data to track the El Niño Southern Oscillation, a combined atmospheric and ocean system, as illustrated below.

### El Niño Southern Oscillation

<img src="./images/cleaningData-week2q5-07.png">

### Codebook

<img src="./images/cleaningData-week2q5-08.png">


# References

[Climate  Glossary](http://www.cpc.ncep.noaa.gov/products/outreach/glossary.shtml): National Oceanographic and Atmospheric Administration website, retrieved 14 October 2017.

[Optimum Interpolation Sea Surface Temperatures](https://www.esrl.noaa.gov/psd/data/gridded/data.noaa.oisst.v2.html): National Oceanographic and Atmosphereic Administration, retrieved 14 October 2017.

*Last Updated: 14 October 2017*
