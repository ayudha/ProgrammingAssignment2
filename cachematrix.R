## The objective of the following functions:
## First Function stores (caches) in memory the inverse of the matrix
## Second Function retrieves the inverse of the matrix from cache if it already exists

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  setMatrix<-function(y){
  x<<-y
  m<<-NULL
}
getMatrix<-function() x
setInvMatrix<-function(solve) m<<- solve
getInvMatrix<-function() m
list(setMatrix=setMatrix, getMatrix=getMatrix,
   setInvMatrix=setInvMatrix,
   getInvMatrix=getInvMatrix)
}


## function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getInvMatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$getMatrix()
    m<-solve(matrix, ...)
    x$setInvMatrix(m)
    m
}
}
