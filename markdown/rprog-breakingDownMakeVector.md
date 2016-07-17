## Breaking down makeVector()

The second programming assignment in the Johns Hopkins University *R Programming* course on Coursera.org makes use of a prototype set of functions that illustrate caching of a mean from a vector. The overall objective of the assignment is to demonstrate the concept of lexical scoping. This assignment often confuses students because it is difficult for them to understand the concepts simply by looking at their implementation in code.

This article explains the code in the cachemean.R file, highlighting key R concepts and features that make the program work as expected. In addition to the concept of scoping, the assignment also introduces use of S3 objects without explicitly explaining how object orientation is implemented in R, causing large amounts of frustration in students when they are unable to get their implementations of `makeCacheMatrix()` and `cacheSolve()` to work correctly.

## What is lexical scoping?

Scoping is the mechanism within R that determines how R finds symbols \(i.e. programming language elements\) to retrieve their values during the execution of an R script.

R supports two types of scoping: lexical scoping and dynamic scoping. As noted by Hadley Wickham, "Dynamic scoping is primarily used within functions to save typing during interactive analysis," and will not be covered here. Hadley Wickham's [Advanced-R](http://adv-r.had.co.nz/Computing-on-the-language.html#scoping-issues) website's section on scoping issues covers dynamic scoping.

Lexical scoping is used to retrieve values from objects based on the way functions are nested when they were written. Since *Programming Assignment 2* contains nested functions, to fully comprehend the assignment students must be able to visualize how the symbols are stored and accessed within the nested function. A more detailed explanation of lexical scoping is available on the [Advanced-R website's Function page](http://adv-r.had.co.nz/Functions.html), so I'll refer the reader there for the details.

Understanding of scoping is key to *R Programming Assignment 2*, because the fact that the "cache" works is due to how the code is built at design time, not how the code is called at runtime.

## Overall Design of makeVector() and cachemean()

The cachemean.R file contains two functions, `makeVector()` and `cachemean()`. The first function in the file, `makeVector()` creates an R object that stores a vector and its mean. The second function, `cachemean()` requires an argument that is returned by `makeVector()` in order to retrieve the mean from the cached value that is stored in the `makeVector()` object's environment.

## What's going on in makeVector()?

The key concept to understand in makeVector() is that it builds a set of functions and returns the functions within a list to the parent environment. That is,

        myVector <- makeVector(1:15)

results in an object, myVector, that contains four functions: `set()`, `get()`, `setmean()`, and `getmean()`.

Due to lexical scoping, `myVector` contains a complete copy of the environment for `makeVector()`, including any objects that are defined within `makeVector()` at design time (i.e., when it was coded). A diagram of the environment makes it clear what is accessible within `myVector`.

<img src="./images/rprog-breakingDownMakeVector01.png">

## Appendix: cachemean.R

Here is the entire listing for cachemean.R.

    makeVector <- function(x = numeric()) {
         m <- NULL
         set <- function(y) {
              x <<- y
              m <<- NULL
         }
         get <- function() x
         setmean <- function(mean) m <<- mean
         getmean <- function() m
         list(set = set, get = get,
              setmean = setmean,
              getmean = getmean)
    }
    cachemean <- function(x, ...) {
         m <- x$getmean()
         if(!is.null(m)) {
              message("getting cached data")
              return(m)
         }
         data <- x$get()
         m <- mean(data, ...)
         x$setmean(m)
         m
    }

## References

1. Wickham, Hadley -- [Advanced-R Functions](http://adv-r.had.co.nz/Functions.html), retrieved July 17, 2016.
2. Wickham, Hadley -- [Advanced-R Scoping Issues](http://adv-r.had.co.nz/Computing-on-the-language.html#scoping-issues), retrieved July 17, 2016.
