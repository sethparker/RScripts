
#PSME Db = 0.052
lifetime <- c(1:1000)


background_mortality <- function(){
  lifetime <- c(1:10000)
  for (tree in 1:10000){
  x <- 0
  repeat{
    y <- runif(1)
    x = x+1
    if (y < 0.0052){
      lifetime[tree] = x
      break}
    }
  }
hist(lifetime)
}

#PSME Dt
for (tree in 1:10000){
years <- 0
height <- 90
repeat{
  years = years+1
  theta <- 100 * (1-0.05*abs(rnorm(1)))
  if (height > theta){
  z <- 1-(theta/height)
  zz <- runif(1)
  if (zz < z){
    lifetime[tree] = years
    break} 
  }
}
hist(lifetime)
}


# Dt+Db
lifetime <- c(1:10000)
probabilities <- c(1:10000)
for (tree in 1:10000){
  years <- 0
  height <- 90
  db_prob <- 0.0052
  repeat{
    years <- years + 1
    theta <-  100 * (1-0.05*abs(rnorm(1)))
    x <- runif(1)
    if (height > theta){
      dt_prob <- 1-(theta/height)
      total_prob <- db_prob + dt_prob
      if (x < total_prob){
        lifetime[tree] = years
        probabilities[tree] = total_prob
        break
      } 
    }
  }
}




