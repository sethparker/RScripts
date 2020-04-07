################################
## SETH M PARKER
## UNIVERSITY OF NOTRE DAME
################################
# PFTs based on wood density

# basic equation...
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

# PFT Ds
Ds_h <- c(1:30)
for (dbh in 1:30)
{
  h = Dsb1*dbh^(Dsb2)
  Ds_h[dbh] = h
}

# PFT D
D_h <- c(1:30)
for (dbh in 1:30)
{
  h = Db1*dbh^(Db2)
  D_h[dbh] = h
}
plot(1:30,D_h)

# PFT BD
BD_h <- c(1:30)
for (dbh in 1:30)
{
  h = BDb1*dbh^(BDb2)
  BD_h[dbh] = h
}
plot(1:30,BD_h)

# PFT E
E_h <- c(1:30)
for (dbh in 1:30)
{
  h = Eb1*dbh^(Eb2)
  E_h[dbh] = h
}
plot(1:30,E_h)

Ds_v <- cbind(1:30,Ds_h)
D_v <- cbind(1:30,D_h)
BD_v <- cbind(1:30,BD_h)
E_v <- cbind(1:30,E_h)

# Soliving Marechaux and Chave for hlim and ah
# nonlinear least squares

start.ah <- 1
start.hlim <- 5

h_fun <- function(hlim,dbh,ah){
  h = hlim * (dbh / (dbh + ah))
  return(h)
}

# Ds
Ds.fit <- nls(Ds_h ~ h_fun(hlim,1:30,ah), start = list(hlim = start.hlim, ah = start.ah), 
              algorithm = "port", upper = list(hlim = 75, ah = 99))

# checking to see curve fit...
plot(1:30,Ds_h)
lines(1:30,19.31*(1:30/(1:30+15.95))) # in cm
plot(1:30/100,Ds_h)
lines(1:30/100,19.31*((1:30/100)/((1:30/100)+0.1595))) # in m for TROLL

Ds.hlim <- 19.31
Ds.ah <- 0.1595

# D
D.fit <- nls(D_h ~ h_fun(hlim,1:30,ah), start = list(hlim = start.hlim, ah = start.ah), 
              algorithm = "port", upper = list(hlim = 75, ah = 99))

# checking to see curve fit...
plot(1:30,D_h)
lines(1:30,63.54*(1:30/(1:30+89.21))) # in cm
plot(1:30/100,D_h)
lines(1:30/100,63.54*((1:30/100)/((1:30/100)+0.8921))) # in m for TROLL

D.hlim <- 63.54
D.ah <- 0.8921

# BD
BD.fit <- nls(BD_h ~ h_fun(hlim,1:30,ah), start = list(hlim = start.hlim, ah = start.ah), 
             algorithm = "port", upper = list(hlim = 75, ah = 99))

plot(1:30,BD_h)
lines(1:30,18.09*(1:30/(1:30+11.71))) # in cm
plot(1:30/100,BD_h)
lines(1:30/100,18.09*((1:30/100)/((1:30/100)+0.1171))) # in m for TROLL

BD.hlim <- 18.09
BD.ah <- 0.1171

# E
E.fit <- nls(E_h ~ h_fun(hlim,1:30,ah), start = list(hlim = start.hlim, ah = start.ah), 
              algorithm = "port", upper = list(hlim = 75, ah = 99))

plot(1:30,E_h)
lines(1:30,24.11*(1:30/(1:30+27.9))) # in cm
plot(1:30/100,E_h)
lines(1:30/100,24.11*((1:30/100)/((1:30/100)+0.279))) # in m for TROLL

E.hlim <- 24.11
E.ah <- 0.2790

# Testing allometry curve fit over different intervals 
# Generate fxn with input varibles, b1, b2, dbh.min, dbh.max

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
lines(0:60, 29.91 * (0:60/(0:60 + 36.8)), col = "blue")
lines(0:60, 23.84 * (0:60/(0:60 + 24.61)), col = "red")
# D
Generate.curve(Db1,Db2,10,60)
lines(0:60, 72.83 * (0:60/(10:60 + 99)), col = "blue")
lines(0:60, 69.39 * (0:60/(0:60 + 99)), col = "red")
# BD
Generate.curve(BDb1,BDb2,10,60)
lines(0:60, 27.04 * (0:60/(0:60 + 28.09)), col = "blue")
lines(0:60, 22.21 * (0:60/(0:60 + 19.05)), col = "red")
# E
Generate.curve(Eb1,Eb2,10,60)
lines(0:60, 39.87 * (0:60/(0:60 + 61.27)), col = "blue")
lines(0:60, 30.02 * (0:60/(0:60 + 40.02)), col = "red")
# blue = 10:60, red = 10:35
#

# Solve for DBH_t

# hmax = hlim * (3*dbh_t / (3*dbh_t + 2*ah))

# Ds = 25 = 29.91 * (3*dbh_t / (3*dbh_t + 2*0.3680)
# 1.2492 = dbh_t
# D  = 25 = 72.83 * (3*dbh_t / (3*dbh_t + 2*0.9900)
# 0.3450 = dbh_t
# BD = 25 = 27.04 * (3*dbh_t / (3*dbh_t + 2*0.2809)
# 2.2949 = dbh_t
# E  = 25 = 39.87 * (3*dbh_t / (3*dbh_t + 2*0.6127)
# 0.6967 = dbh_t

