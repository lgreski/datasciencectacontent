# Breaking down pollutantmean()

As someone new to R, it's important to have a strategy for writing an R function. One way to do this is to use the process I described in the article [Strategy for the Programming Assignments](https://github.com/lgreski/datasciencectacontent/blob/master/markdown/makeItRun.md).  Starting with an outline helps break what at first appears to be an overwhelming task into manageable chunks.

For the `pollutantmean()` function, one way to solve the problem is as follows:

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

One last hint: if your program is more than 8 - 12 programming statements, it's too complicated. There are ways to solve this problem with as few as 1 - 3 programming statements if you nest / combine the required R functions.
