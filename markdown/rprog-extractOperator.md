## Forms of the Extract Operator in R

One of the things that confuses students in the Johns Hopkins Data Science Specialization *R Programming Course* is that the extract operator is introduced in a way that does not emphasize how important it is as a concept in the R language. Often students watch the lectures and then have difficulty applying what they've learned to answer questions 11 - 20 in the first quiz, questions that require use of the extract operator in various ways.

The [extract operator](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Extract.html) is used to retrieve data from objects in R. The operator may take four forms, including `[, [[, $,` and `@`. The fourth form, `@`, is called the [slot operator](https://stat.ethz.ch/R-manual/R-devel/library/methods/html/slot.html), and is used to extract content from an object built with the S4 object system, also known as a *formally defined object*. Use of the S4 object system is a more advanced topic so we won't discuss it further here.

In this article we will illustrate various forms of the extract operator, focusing on how to use it with data frames.

The first form, `[`, can be used to extract content from vector, lists, or data frames. The following code defines a vector and then extracts the last 3 elements from it using two techniques. The first technique directly references elements 13 through 15. The second approach uses the length of the vector to calculate the indexes of last three elements.

    x <- 16:30 # define a vector
    x[13:15] # extract last 3 elements
    x[(length(x)-2):length(x)] # extract last 3 elements

## Example: Reading Data Files with the Extract Operator

Noting John Chambers' statement that <em>In R, everything is an object</em>, the `[` form of the extract operator can be used to extract data from the result of a function call. The following code executes `list.files()` on a subdirectory of the current R working directory that contains comma separated values files of Pokemon statistics, one file for each of the first 6 generations of Pokemon.

Notice that there are 7 files in the subdirectory.

<img src="./images/rprog-extractOperator03.png">

    # return first two generations of Pokemon stored in
    # pokemon data files retrieved from kaggle.com and
    # broken out into 6 csv files, one per generation

    thePokemonFiles <- list.files("./pokedata",
                                  full.names=TRUE)[1:2]
    thePokemonFiles

The above code executes `list.files()`, and then the extract operator `[1:2]` is applied to the output object, resulting in a `thePokemonFiles` object containing the first two files returned from the `list.files()` function.

<img src="./images/rprog-extractOperator04.png">

When used with a list, `[` extracts one or more elements from the list.

The second and third forms of the extract operator, `[[` and `$` extract a single item from an object. Note that `$` does not support a computed index, as illustrated in an example below.  

Returning to our Pokemon example, we can use the output from `list.files()`, along with the `[[` form of the extract operator and `lapply()` to read a subset of columns from the data files.

    pokemonData <- lapply(thePokemonFiles,function(x) read.csv(x)[["Attack"]])
    # show the list of vectors
    summary(pokemonData)

<img src="./images/rprog-extractOperator05.png">

The key feature of this code is use of an anonymous function within `lapply()` so we can apply the extract operator to the result of `read.csv()`. After the `lapply()` function executes, the `pokemonData` object is a list containing two vectors, the `Attack` column from each of the two files we read with `read.csv()`.

To combine the elements from the list into a single vector for subsequent processing, we can use the `unlist()` function.

## Comparing Forms of the Extract Operator

Since the easiest way to see how the various features of the extract operator work is to see code examples, we provide a number of code snippets to illustrate various ways to use the different forms of the operator.

The following code examples use the `mtcars` data set from the `datasets` package.

    library(datasets)
    data(mtcars)

    # Here, we set up a column name in a variable to illustrate use
    # of various forms of the extract operator with a column name stored in
    # another R object
    theCol <- "cyl"

    # approach 1: use [[ form of extract operator to extract a column
    #             from the data frame as a vector
    #             this works because a data frame is also a list
    mtcars[[theCol]]

    # approach 2: use variable name in column dimension of data frame
    mtcars[,theCol]

    # approach 3: use the $ form of extract operator. Note that since this
    #             form accesses named elements from the list, you can't use
    #             variable substitution (e.g. theCol) with this version of
    #             extract
    mtcars$cyl

    # this version fails because the `$` version of extract does not
    # work with variable substitution (i.e. a computed index)
    mtcars$theCol

Having illustrated different ways to extract content with the extract operator, we will now illustrate its power as a way to subset rows or columns in a data frame, which is required for a number of questions in *R Programming* quiz 1. Note that we'll use the `head()` function to limit the number of rows returned when we print the data frame in various forms. For more information on `head()`, enter `?head` in the R console.

    #
    # subsetting columns
    #

    # approach 1: subset with column numbers
    head(mtcars[,1:3])

    # approach 2: subset with column names
    theCols <- c("mpg","cyl","disp")
    head(mtcars[,theCols])

    #
    # subsetting rows
    #

    # approach 1: use exact row references
    mtcars[20:22,]

    # approach 2: use logic in the row dimension of reference
    head(mtcars[mtcars$cyl == 4 & mtcars$am == 1,])
    head(mtcars[mtcars[,"cyl"] == 4,])

    # approach 3: use which() function
    theSubsetRows <- which(mtcars$cyl == 4)
    head(mtcars[theSubsetRows,])

    # approach 4: use output from a function that returns a logical
    #             array instead of row numbers as in the prior example
    head(mtcars[!is.na(mtcars[,"cyl"]),])

## Getting Help with Operators

Students quickly learn that the help operator, `?`, is used to access R documentation. However, requesting help for an operator is a bit more complicated than it first appears:

<img src="./images/rprog-extractOperator01.png">

Instead, one has to place the operator in double quotes, as in `?"["` to access help for the extract operator.

<img src="./images/rprog-extractOperator02.png">

A more detailed explanation of the help function `help(...)` and help operator `?` may be found on the [Getting Help with R](https://www.r-project.org/help.html) page on the [R Project](https://www.r-project.org/) website.

## References

1. [Extract {base} R Documentation](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Extract.html), retrieved 22 May 2016.
2. [SlotOp {base} R Documentation](https://stat.ethz.ch/R-manual/R-devel/library/base/html/slotOp.html), retrieved 22 May 2016.
3. [Pokemon Data by Alberto Barradas](https://www.kaggle.com/abcsds/pokemon)
