## Forms of the Extract Operator in R

One of the things that confuses students in the Johns Hopkins Data Science Specialization *R Programming Course* is that the extract operator is introduced in a way that does not emphasize how important it is as a concept in the R language. Often students watch the lectures and then have difficulty applying what they've learned to answer questions 11 - 20 in the first quiz, questions that require use of the extract operator in various ways.

The [extract operator](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Extract.html) is used to retrieve data from objects in R. The operator may take four forms, including `[, [[, $,` and `@`. The fourth form, `@`, is called the [slot operator](https://stat.ethz.ch/R-manual/R-devel/library/methods/html/slot.html), and is used to extract content from an object built with the S4 object system, also known as a *formally defined object*. Use of the S4 object system is a more advanced topic so we won't discuss it further here.

In this article we will illustrate various forms of the extract operator, focusing on how to use it with data frames.

The first form, `[`, can be used to extract content from vector, lists, or data frames. The following code defines a vector and then extracts the last 3 elements from it using two techniques. The first technique directly references elements 13 through 15. The second approach uses the length of the vector to calculate the indexes of last three elements.

    x <- 16:30 # define a vector
    x[13:15] # extract last 3 elements
    x[(length(x)-2):length(x)] # extract last 3 elements

When used with a list, `[` extracts one or more elements from the list.

The second and third forms of the extract operator, `[[` and `$` extract a single item from an object. Note that `$` does not support a computed index, as illustrated in an example below.  

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

Having illustrated different ways to extract content with the extract operator, we will now illustrate its power as a way to subset rows or columns in a data frame, which is required for a number of questions in *R Programming* quiz 1.

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
    head(mtcars[20:28,])

    # approach 2: use logic in the row dimension of reference
    head(mtcars[mtcars$cyl == 4 & mtcars$am == 1,])
    head(mtcars[mtcars[,"cyl"] == 4,])

    # approach 3: use which() function
    theSubsetRows <- which(mtcars$cyl == 4)
    head(mtcars[theSubsetRows,])

    # approach 4: use output from a function that returns a logical
    #             array instead of row numbers as in the prior example
    head(mtcars[!is.na(mtcars[,"cyl"]),])

## References

1. [Extract {base} R Documentation](https://stat.ethz.ch/R-manual/R-devel/library/base/html/Extract.html), retrieved 22 May 2016.
2. [SlotOp {base} R Documentation](https://stat.ethz.ch/R-manual/R-devel/library/base/html/slotOp.html), retrieved 22 May 2016.  
