##  makeCacheMatrix
#
#   Creates an "object" for a (square!) matrix to prepare for caching its inverse
#   containing a getter and setter (returning the value set) 
#   for the matrix and its inverse


##  makeCacheMatrix
#
#   Wrapper for a Matrix object that provides gettter and setter functions
#   for the matrix and its inverse.  Stores a cache of the last inverse value. 

makeCacheMatrix <- function(cacheMatrix = matrix()) {
        cacheMatrixInverse <- NULL # create the cache for the inverse
        set <- function(newMatrix) {
                cacheMatrix <<- newMatrix #set the matrix object
                cacheMatrixInverse <<- NULL #destroy the last cache
        }
        get <- function() {
                cacheMatrix #Return the matrix
        }
        setInverse <- function(newcacheMatrixInverse) {
                cacheMatrixInverse <<- newcacheMatrixInverse
        }
        getInverse <- function(){ 
                cacheMatrixInverse #possibly NULL!
        }
        #allows var$get(), var$set(x), etc...
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

## cacheSolve
# 
# Calclutes the inverse of a given CacheMatrix or returns the cached 
# value, if found.

cacheSolve <- function(matrixToSolve, ...) {
        inverse <- matrixToSolve$getInverse() #get the cached value
        if(!is.null(inverse)) { #recalcuate
                message("Using cached value")
                return(inverse)
        }
        else { #alert the user we're using the cached value.
                message("calculating value")
        }
        #store the value and return.
        inverse <- solve(matrixToSolve$get(), ...)
        matrixToSolve$setInverse(inverse)
        return(inverse)
}