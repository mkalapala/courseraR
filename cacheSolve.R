cacheSolve <- function(x, ...){
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