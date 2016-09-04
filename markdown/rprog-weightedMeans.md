# Common Errors: Unweighted Means in Assignment 1

A number of students in *R Programming* check their calculations for the `pollutantmean()` function by comparing them with Microsoft Excel. Typically a student will calculate a mean from each Excel file in one of the sample problems and average the result. The resulting comparison matches the output from the student's `pollutantmean()` function, but does not match the sample output.

Why is this the case? It is because the student calculated the unweighted mean, or mean of means of each file, which I replicated in R as follows:

<img src="./images/rprog-weightedMean01.png">

The assignment requires a weighted mean. To calculate the weighted mean on a file by file basis, we need to know the number of non-missing values for sulfate in each file.

<img src="./images/rprog-weightedMean02.png">


The denominator in a weighted mean is the count of the number of observations that went into calculating each individual mean, and therefore we have to multiply each mean by the number of non-missing values to create the numerator.

<img src="./images/rprog-weightedMean03.png">


Finally, to illustrate the fact that pollutantmean() should calculate the weighted mean across all files...

<img src="./images/rprog-weightedMean04.png">

Here is all of the code that I screen captured above:

    #
    # calculate unweighted mean of sulfate for first 3 sensors
    #
    pollutantmean("specdata","sulfate",1)
    pollutantmean("specdata","sulfate",2)
    pollutantmean("specdata","sulfate",3)
    sum(3.880701,4.460811,4.327613) / 3

    #
    # next, calculate weighted mean
    #

    # read the files, only keeping the sulfate column by using
    # the extract operator on the data frame output by read.csv()
    sensor1 <- read.csv("./specdata/001.csv",header=TRUE)[,"sulfate"]
    sensor2 <- read.csv("./specdata/002.csv",header=TRUE)[,"sulfate"]
    sensor3 <- read.csv("./specdata/003.csv",header=TRUE)[,"sulfate"]

    # count number of non-missing observations for each file

    sum(!is.na(sensor1))
    sum(!is.na(sensor2))
    sum(!is.na(sensor3))

    # now calculate weighted mean

    sum(3.880701 * 117,4.460811 * 1041,4.327613 * 243) / sum(117,1041,243)

    # finally, calculate from a version of pollutantmean that
    # generates output matching sample output from assignment 1

    pollutantmean("specdata","sulfate",1:3)
