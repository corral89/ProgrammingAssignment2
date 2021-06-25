## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## functions to cache the inverse of a matrix


##  create a matrix to cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
  # this will be needed for the next function to decide
  i <- NULL
  
  #set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  ## Method the get the matrix
  get <- function() {
    ## Return the matrix
    m
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    i
  }
  
  ## Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



cacheSolve <- function(x, ...) {
  
  m <- x$getInverse()
  
  
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## Get the matrix
  data <- x$get()
  
  ## Calculate the inverse 
  m <- solve(data) %*% data
  
  ## Set the inverse of the matrix
  x$setInverse(m)
  
  ## Return it
  m
}

