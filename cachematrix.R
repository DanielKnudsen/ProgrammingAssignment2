## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        # start with empty cache
        cache <- NULL
        
        # save matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # clear cache
                cache <<- NULL
        }
        
        # get saved matrix
        getMatrix <- function() {
                x
        }
        
        # cache the inverse
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        # get the inverse
        getInverse <- function() {
                cache
        }
        
        # return a list with each element of the list as a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
        
}


## Write a short comment describing this function

cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # return cached value if it exists
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # else calculate inverse and store it in cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        # show the inverse
        inverse
        
}
