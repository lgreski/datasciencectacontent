# Programming Assignment 2: makeCacheMatrix() as an Object

In R, the `list` data type is the basis for the S3 object system, one of two "object" systems in R. The second system is the R4 object system. Programming Assignment 2 is based on the S3 object system.

When an object is defined as an S3 object, it includes not only the functions in its list, but also any variables in memory of the function where the list was created. This is what makes it an "object," it as both behavior (the functions), and state (the variables in the environment).

In this context, the functions in the list are the equivalent of methods in a Java class, and the matrix that was originally passed to `makeCacheMatrix()` is still available within the environment of the object to which the list was returned.

A subtlety about the S3 model that isn't explained in the _R Programming_ lectures is that S3 objects rely on a "trick" that makes them work. When an R function returns an object that contains functions to its parent environment (as is the case with a call like `myMatrix <- makeCacheMatrix(a)`), not only does `myMatrix` have access to the specific functions in its list, but it also retains access to the entire environment defined by `makeCacheMatrix()`, including the original argument used to start the function.

Why is this the case? `myMatrix` contains pointers to functions that are within the `makeCacheMatrix()` environment after the function ends, so these pointers prevent the memory consumed by `makeCacheMatrix()` from being released by the garbage collector. Therefore, the entire `makeCacheMatrix()` environment stays in memory, and `myMatrix` can access its functions as well as any data in that environment that is referenced in its functions.

This is why `x` (the argument initialized on the original function call) is accessible by subsequent calls to functions on `myMatrix` such as `myMatrix$get`, and it also explains why the code works without having to explicitly issue `myMatrix$set()` to set the value of `x`.

Reference: _Software for Data Analysis,_ Kindle Edition, location 1683\.

if R was a more strongly typed language, the function stub in Professor Peng's repository might look like:

    cacheSolve <- function(makeCacheMatrix x, ...) {

       # return the inverse of x, or calculate & return if cache is empty
    }

This type of specification would clarify the confusion experienced by some of the students in the September 2015 *R Programming* class. 
