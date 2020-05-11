#my_function <- function(VARIABLE_NAME){
#  PERFORM OPERATION IN VARIABLE_NAME
#  VALUE
#}

avg <- function(x){
  s <- sum(x)
  l <- length(x)
  s/l
}
x <- 1:100
avg(x)

identical(mean(x),avg(x))

avg <- function(x,arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic , sum(x)/n , prod(x)^(1/n))
}

