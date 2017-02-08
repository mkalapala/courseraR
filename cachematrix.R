## The following pair of functions can cache the inverse of a matrix.

## the function "makeCacheMatrix" creates a special matrix object that is capable of caching its inverse.

makeCacheMatrix <- function( x= matrix()){
  inv = NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The following function "cacheSolve" computes the inverse of the special matrix returned by the above function. 
## If inverse has been calculated already, this function will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting Cached Data")
    return(inv)
  }
  my_matrix <- x$get()
  inv <- solve(my_matrix, ...)
  x$setInverse(inv)
  inv
}
       
