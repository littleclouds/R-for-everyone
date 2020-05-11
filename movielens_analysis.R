library(dslabs)
data("movielens")

movielens$movieId
head(movielens)
class(movielens$title)
str(genres)
class(movielens$genres)
levels(movielens$genres)
help('nlevels')
nlevels(movielens$genres)
