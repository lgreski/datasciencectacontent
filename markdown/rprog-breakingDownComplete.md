# Breaking Down complete()

In [Breaking Down pollutantmean()](http://bit.ly/2cHyiCl) we describe approaches to solve the first problem within the Johns Hopkins *R Programming* course programming assignment 1. The programming assignment includes three different problems, and this article describes the second part of the assignment, the `complete()` function.

For this part of the assignment students are required to write an R function that builds a data frame consisting of two columns, the pollution sensor identifier and a count of the number of complete cases within that sensor file.

The following function stub is provided to students.

    complete <- function(directory,id=1:332){
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV filenames

      ## 'id' is an integer vector containing the monitor ID numbers to be Used

      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2 1047
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases

    }

## Key assumptions

This problem presents a slightly different challenge than `pollutantmean()` because the required output is a data frame, not a vector. That said, many of the assumptions we listed for `pollutantmean()` are also valid for `complete()`.

* Data will be stored in a directory called `specdata`, which is a subdirectory of the R working directory.
* Column (variable) names in the data files are case-sensitive.
* There are 332 sensor files, and therefore, the values of `id` will vary between 1 and 332.
* The only files in the `specdata` directory will be the 332 sensor files.
* There are two types of pollutants stored in the sensor files, `sulfate` and `nitrate`.
* Some of the values of `sulfate` and `nitrate` are missing, and we will need to process these to generate the output data frame.
* The sensor files have data that is separated by commas, and therefore we will need to use an R function that reads these types of files.
* The files are organized by sensor number, and all files within the `specdata` subdirectory have the file type `.csv`. Therefore, we can use the `id` argument to decide which files to read.
* The file names contain leading zeroes (e.g. sensor 1 is stored as `001.csv`), which may be relevant depending on the technique we use to read the data files.

There is also one assumption that is specific to the `complete()` function, and is critically important in order to pass the quiz: ***the ordering of rows in the output data frame must match the ordering of elements in the `id` argument passed to the function.*** That is, if we call the function with the following arguments:

    complete("specdata",id=c(10,8,9,7))

then the resulting data frame must have four rows, and the order of the rows must be sorted as follows:

    > complete("specdata",c(10,8,9,7))
      id nobs
    1 10  148
    2  8  192
    3  9  275
    4  7  442

## A potential solution

As we think about the problem, we can solve it in three major steps.

1. Identify the files we need to read from disk.
2. Read each file and calculate the number of complete cases
3. Create a data frame containing the required output, and return it to the parent environment.

Note that if we use an approach that creates a vector of complete case counts, we can combine it with the `id` vector in step 3. A stubbed version of the potential solution looks like this.

    complete <- function(directory,id=1:332){

      # identify files to read from disk

      # read files in order specified by id argument and create nobs vector
      # containing complete cases

      # create a data frame with columns id and nobs, and return to
      # parent environment
      
    }
