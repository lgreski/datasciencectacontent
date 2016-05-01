# Breaking down pollutantmean()

As someone new to R or new to programming in general, it's important to have a plan of attack for writing the R functions required for the first programming assignment. One way to do this is to use the process I described in the article [Strategy for the Programming Assignments](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/makeItRun.md).  Starting with an outline helps break what at first appears to be an overwhelming task into manageable chunks.

In this article, we'll apply the general concepts from [Strategy for the Programming Assignments](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/makeItRun.md) to describe one of many potential solutions to `pollutantmean()`.

## Overall Objective: Calculate a Mean

The first part of the assignment requires students to calculate a single average taken from a number of pollution sensors that collect data across the United States. Students are to write an R function, `pollutantmean()`, that reads the files and calculates the mean for a given pollutant.

## Inputs

Every computer program starts with one or more "inputs," and ends with some type of output. `pollutantmean()` starts with three inputs, or *arguments,* each of which must be named within the `function()` function used to define `pollutantmean()`, also known as a function declaration:

<table>
<tr><th>Argument</th><th>Description</th></tr>
<tr><td>directory</td><td>The name of a subdirectory from which the 332 pollution sensors will be read. A key assumption for this assignment is that the name of the directory is `specdata`, and that it is a child directory from the <em>current R working directory</em>.  </td></tr>
<tr><td>pollutant</td><td>Each sensor file contains measurements for two pollutants, <em>sulfate,</em> and <em>nitrate.</em></td></tr>
<tr><td>id</td><td>a list of numbers that can vary from 1 to 332, indicating the sensor number(s) that are to be included in calculation of the mean. Each file is in a special format, comma separated values or `.csv,` such that the names of the files look like `001.csv, 002.csv, ..., 332.csv.` </td></tr>
</table>

To get a better picture of the data files, it's always a good idea to take a look at the raw data. As we can see from the following screenshot for `001.csv`, the file includes one row with header information, that is, the names of the variables in subsequent rows. The variables in each row include `Date`, `sulfate`, `nitrate`, and `ID`.

<img src="./images/rprog-pollutantmean01.png">

If you need a text editor with which to read the raw data files, I suggest [Atom](https://atom.io), since it is free.

In *Getting and Cleaning Data* you will learn how to develop a code book for a data set.  For now, we'll refer you to the [Assignment Instructions](http://github.com/lgreski/datasciencectacontent/blob/master/markdown/images/rprog-Assignment1Instructions.PDF) that explain the data that is in each comma separated value file. *Getting and Cleaning Data* also covers the fact that it's always a good idea to run some descriptive statistics on the data to understand what it looks like:

<img src="./images/rprog-pollutantmean02.png">


## Output

The output required for the assignment is a single number, the average calculated across all of the sensor files that were in the list of ID numbers passed into the function as an argument.

# Designing a Solution for `pollutantmean()`

Now that we understand the inputs and output required, we can discuss the process of converting the inputs to the output. The instructors in *R Programming* repeatedly discuss that there is more than one way to do things in R. To make it easier on the beginner, we'll take the conceptually simplest approach possible.

We know from the above discussion that we must read one or more files from disk to solve the problem. Because we need to return a single mean calculated across all of the files to be read, that means we must combine the individual files into a single file (or data frame) so we can calculate the mean correctly.  Conceptually we need to complete three steps within the function:

1. Read the files that are referenced in the `id` argument,
2. Combine the files into a single file / data frame, and
3. Calculate the mean of the requested pollutant and return it to the parent environment. 

Breaking this down to the next level of detail makes the design a bit more complicated, as we must account for the assumptions we discussed earlier in the article. One way to solve the problem is as follows:

1. Obtain a list of sensor files from the `specdata` folder, given the assumption that the `specdata` folder is a subfolder of the R Working Directory.<br><br>
2. Create an empty data frame into which you will collect all of the sensor files to be read<br><br>
3. Subset the list of sensor files down to only those to be used in the calculation of the mean. HINT: this can be done with vector subscripting.<br><br>
4. Loop through each file in the subsetted list and do the following: read the raw data file with an appropriate `read.???()` function, bind the file to the data frame you created in step 2.<br><br>
5. Calculate the mean and return it to the parent environment

While some of these steps can be combined by using `apply()` functions and other R functions such as `do.call()`, I've written this approach using a loop in step 4 so we can highlight where to subset the file list: do this BEFORE reading the data files from disk into memory.

Once you have your outline, you can organize your coding around the outline, like this:

    pollutantmean(...) {

       # obtain list of sensor files

       # create empty data frame

       # subset list of sensor files

       # loop through files in subset list and
       #    * read the csv file
       #    * bind to "collector" data frame

       # calculate mean and return to parent environment
    }

One last hint: if your program is more than 8 - 12 programming statements, it's too complicated. There are ways to solve this problem with as few as 1 - 3 programming statements if you combine the required R functions.
