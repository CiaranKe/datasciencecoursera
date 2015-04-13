makeCacheMatrix <- function(cacheMatrix = matrix()) {
        cacheMatrixMean <- NULL
        set <- function(newMatrix) {
                cacheMatrix <<- newMatrix
                cacheMatrixMean <<- NULL
        }
        get <- function() cacheMatrix
        setmean <- function(newCacheMatrixMean) cacheMatrixMean 
                                <<- newCacheMatrixMean
        getmean <- function() cacheMatrixMean
        
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


cacheSolve <- function() {
        
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
