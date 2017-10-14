# Getting and Cleaning Data: Reading Fixed Width Files for Quiz 2

To answer this question correctly, it is important to view the file before writing any R code.


<img src="./images/cleaningData-week2q5-01.png">

There are 9 columns of data in this file, including:

1. week
2. Nino1and2SST
3. Nino1and2SSTA
4. Nino3SST
5. Nino3SSTA
6. Nino34SST
7. Nino34SSTA
8. Nino4SST
9. Nino4SSTA

The challenge is how to read the fourth column, Nino3SST, correctly. The columns are real numbers, not integers as stated in one of the prior posts. That is, they contain decimal points and one value to the right of the decimal point.

<img src="./images/cleaningData-week2q5-02.png">

A text editor such as UltraEdit that provides a column number display makes it a bit easier to know which columns to read.

<img src="./images/cleaningData-week2q5-03.png">

Also notice that the SSTA columns have negative signs for some rows, and this must be accounted for in the R function used to read the data.

## Additional Considerations

To answer the quiz question correctly, students must read the correct data file. The quiz question provides two URLs, [one to be used for the quiz](https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for) and another that is a link to the original data source that is continually updated.

<img src="./images/cleaningData-week2q5-04.png">

Many students get frustrated because they read the original data source directly from [the NOAA website](http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for), which has more records than the file to be used for the quiz. The correct file has 1,254 observations, starting with data from January 3, 1990 and ending on January 8, 2014, as illustrated below.

<img src="./images/cleaningData-week2q5-05.png">

As of October 14, 2017, the data from the NOAA has 1,449 observations, the most recent of which is from October 4th, 2017.

<img src="./images/cleaningData-week2q5-06.png">

*Last Updated: 14 October 2017* 