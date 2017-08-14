#
# rprog-testCacheMatrix.R
#
# test script for makeCacheMatrix.R
# 

# approach 1: create a matrix object, then use it as input to cacheSolve()

a <- makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2))
cacheSolve(a)

# call cacheSolve(a) a second time to trigger the "getting cached inverse" message
cacheSolve(a)

# multiply the matrix by inverse, resulting in identity matrix
a$get() %*% a$getsolve()

# reset a with another matrix to clear out cached value
a$set(matrix(c(2,3,2,2),2,2))

# confirm that a has new data and that cache is NULL
a$get()
a$getsolve()

# rerun cache solve, note that "getting cached inverse" does not print,
# and that we get a different result
cacheSolve(a)

# approach 2: use makeCacheMatrix() as the input argument to cacheSolve()
#             note that the argument to cacheSolve() is a different object
#             than the argument to the first call of cacheSolve()
cacheSolve(makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2)))

# try a non-invertible matrix
b <- makeCacheMatrix(matrix(c(0,0,0,0),2,2))
cacheSolve(b)

# illustrate getting the memory locations
a <- makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2))
tracemem(a)
tracemem(matrix(c(-1, -2, 1, 1), 2,2))

# approach 2: use makeCacheMatrix() as the input argument to cacheSolve()
#             note that the argument to cacheSolve() is a different object
#             than the argument to the first call of cacheSolve()
cacheSolve(makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2)))

# illustrate getting the memory locations
a <- makeCacheMatrix(matrix(c(-1, -2, 1, 1), 2,2))
tracemem(a)
tracemem(matrix(c(-1, -2, 1, 1), 2,2))

# test non-matrix input: should return "not a matrix" error

a$set(1:5)
cacheSolve(a)