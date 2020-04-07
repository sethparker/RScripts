################################
## SETH M PARKER
## UNIVERSITY OF NOTRE DAME
################################
# PFTs based on wood density

# Xiangtao basic equation...
# h = b1*dbh^(b2)

# PFT constants...
Dsb1 <- 2.09
Dsb2 <- 0.54
Db1 <- 0.93
Db2 <- 0.84
BDb1 <- 2.66
BDb2 <- 0.48
Eb1 <- 1.41
Eb2 <- 0.65

# # # # # # # # # # # # # # # # # # # # # # # # # # #
Generate.curve <- function(b1, b2, dbh.min, dbh.max){
# calculate Xiangtao's allometry...
  tmp_h <- c(dbh.min:dbh.max)
  for (dbh in dbh.min:dbh.max)
  {
    h = b1*dbh^(b2)
    tmp_h[dbh - dbh.min + 1] = h
  }
# plot to check curve
  plot(dbh.min:dbh.max, tmp_h)

# define secondary function for Marechaux and Chave allometry
  h_fxn <- function(hlim,dbh,ah){
    h = hlim * (dbh / (dbh + ah))
    return(h)
  }
  
# use nonlinear least squares model to solve for ah and hlim
  # set model inputs
  start.ah <- 1 
  start.hlim <- 5
  tmp_v <- cbind(dbh.min:dbh.max,tmp_h)

tmp.fit <- nls(tmp_h ~ h_fxn(hlim,dbh.min:dbh.max,ah), start = list(hlim = start.hlim, 
                ah = start.ah), algorithm = "port", upper = list(hlim = 75, ah = 99))  
# seems to be no way of extracting ah and hlim from tmp.fit via subset
# extract manually and then check fit with
  # lines(dbh.min:dbh.max, hlim * (dbh.min:dbh.max/(dbh.min:dbh.max + ah)))
return(tmp.fit)
}
# # # # # # # # # # # # # # # # # # # # # # # # # # #

# Ds
Generate.curve(Dsb1,Dsb2,10,60)
lines(10:60, 29.91 * (10:60/(10:60 + 36.80)))
# D
Generate.curve(Db1,Db2,1,10)
lines(1:10, 25.91 * (1:10/(1:10 + 30.66)))
# BD
Generate.curve(BDb1,BDb2,10,60)
lines(10:60, 27.04 * (10:60/(10:60 + 28.09)))
# E
Generate.curve(Eb1,Eb2,1,35)
lines(1:35, 26.61 * (1:35/(1:35 + 32.47)))
