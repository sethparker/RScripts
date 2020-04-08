################################
### SETH PARKER
### UNIVERSITY OF NOTRE DAME
################################
### EVALUATING REANALYSIS DATA 
### GUANACASTE, COSTA RICA
################################

library(rhdf5)

h5ls("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_2007APR.h5")
# 720 x 36 x 36
h5ls("/Users/sethparker/Documents/Medvigy_Lab/CR_met/Horizontes_2015APR.h5")
# 1440 x 1 x 1

# Reanalysis data has all of 2007 through April of 2019
# Time step is 1 hour now
# We are interested in 10° 42' 36", -85° 33' 0"
# This corresponds to row 8 of lat and column 5 of long

h5read("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_2007APR.h5", "tmp") [,5,8]
# Use HDFView to veryify this returns the correct values

################################
# Starting with wind speed [m/2]
# separate loops for 07-09 and 10-19 used throughout
################################
# january
JAN.ought <- vector('list', 3)
names(JAN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JAN.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JAN.ought) <- sprintf("windv.200%s.jan", names(JAN.ought))

JAN.teen <- vector('list', 10)
names(JAN.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JAN.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JAN.teen) <- sprintf("windv.20%s.jan", names(JAN.teen))

# february
FEB.ought <- vector('list', 3)
names(FEB.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  FEB.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(FEB.ought) <- sprintf("windv.200%s.feb", names(FEB.ought))

FEB.teen <- vector('list', 10)
names(FEB.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  FEB.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(FEB.teen) <- sprintf("windv.20%s.feb", names(FEB.teen))

# march
MAR.ought <- vector('list', 3)
names(MAR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  MAR.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(MAR.ought) <- sprintf("windv.200%s.mar", names(MAR.ought))

MAR.teen <- vector('list', 10)
names(MAR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  MAR.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(MAR.teen) <- sprintf("windv.20%s.mar", names(MAR.teen))

# april
APR.ought <- vector('list', 3)
names(APR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  APR.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(APR.ought) <- sprintf("windv.200%s.apr", names(APR.ought))

APR.teen <- vector('list', 10)
names(APR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  APR.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(APR.teen) <- sprintf("windv.20%s.apr", names(APR.teen))

# may
MAY.ought <- vector('list', 3)
names(MAY.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  MAY.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(MAY.ought) <- sprintf("windv.200%s.may", names(MAY.ought))

MAY.teen <- vector('list', 9)
names(MAY.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  MAY.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(MAY.teen) <- sprintf("windv.20%s.may", names(MAY.teen))

# june
JUN.ought <- vector('list', 3)
names(JUN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JUN.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JUN.ought) <- sprintf("windv.200%s.jun", names(JUN.ought))

JUN.teen <- vector('list', 9)
names(JUN.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JUN.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JUN.teen) <- sprintf("windv.20%s.jun", names(JUN.teen))

# july
JUL.ought <- vector('list', 3)
names(JUL.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JUL.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JUL.ought) <- sprintf("windv.200%s.jul", names(JUL.ought))

JUL.teen <- vector('list', 9)
names(JUL.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  JUL.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(JUL.teen) <- sprintf("windv.20%s.jul", names(JUL.teen))

# august
AUG.ought <- vector('list', 3)
names(AUG.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  AUG.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(AUG.ought) <- sprintf("windv.200%s.aug", names(AUG.ought))

AUG.teen <- vector('list', 9)
names(AUG.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  AUG.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(AUG.teen) <- sprintf("windv.20%s.aug", names(AUG.teen))

# september
SEP.ought <- vector('list', 3)
names(SEP.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  SEP.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(SEP.ought) <- sprintf("windv.200%s.sep", names(SEP.ought))

SEP.teen <- vector('list', 9)
names(SEP.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  SEP.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(SEP.teen) <- sprintf("windv.20%s.sep", names(SEP.teen))

# october
OCT.ought <- vector('list', 3)
names(OCT.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  OCT.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(OCT.ought) <- sprintf("windv.200%s.oct", names(OCT.ought))

OCT.teen <- vector('list', 9)
names(OCT.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  OCT.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(OCT.teen) <- sprintf("windv.20%s.oct", names(OCT.teen))

# november
NOV.ought <- vector('list', 3)
names(NOV.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  NOV.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(NOV.ought) <- sprintf("windv.200%s.nov", names(NOV.ought))

NOV.teen <- vector('list', 9)
names(NOV.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  NOV.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(NOV.teen) <- sprintf("windv.20%s.nov", names(NOV.teen))

# december
DEC.ought <- vector('list', 3)
names(DEC.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  DEC.ought[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(DEC.ought) <- sprintf("windv.200%s.dec", names(DEC.ought))

DEC.teen <- vector('list', 9)
names(DEC.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "ugrd") [,5,8]
  a <- as.vector(tmp)
  a[which(a == 0)] = NA_character_
  DEC.teen[[as.character(i)]] <- mean(abs(as.numeric(na.omit(a))))
}
names(DEC.teen) <- sprintf("windv.20%s.dec", names(DEC.teen))

JAN.ugrd <- mean(JAN.ought$windv.2007.jan,JAN.ought$windv.2008.jan,JAN.ought$windv.2009.jan,+
                   JAN.teen$windv.2010.jan,JAN.teen$windv.2011.jan,JAN.teen$windv.2012.jan,+
                   JAN.teen$windv.2013.jan,JAN.teen$windv.2014.jan,JAN.teen$windv.2015.jan,+
                   JAN.teen$windv.2016.jan,JAN.teen$windv.2017.jan,JAN.teen$windv.2018.jan,JAN.teen$windv.2019.jan)
FEB.ugrd <- mean(FEB.ought$windv.2007.feb,FEB.ought$windv.2008.feb,FEB.ought$windv.2009.feb,+
                   FEB.teen$windv.2010.feb,FEB.teen$windv.2011.feb,FEB.teen$windv.2012.feb,+
                   FEB.teen$windv.2013.feb,FEB.teen$windv.2014.feb,FEB.teen$windv.2015.feb,+
                   FEB.teen$windv.2016.feb,FEB.teen$windv.2017.feb,FEB.teen$windv.2018.feb,FEB.teen$windv.2019.feb)
MAR.ugrd <- mean(MAR.ought$windv.2007.mar,MAR.ought$windv.2008.mar,MAR.ought$windv.2009.mar,+
                   MAR.teen$windv.2010.mar,MAR.teen$windv.2011.mar,MAR.teen$windv.2012.mar,+
                   MAR.teen$windv.2013.mar,MAR.teen$windv.2014.mar,MAR.teen$windv.2015.mar,+
                   MAR.teen$windv.2016.mar,MAR.teen$windv.2017.mar,MAR.teen$windv.2018.mar,MAR.teen$windv.2019.mar)
APR.ugrd <- mean(APR.ought$windv.2007.apr,APR.ought$windv.2008.apr,APR.ought$windv.2009.apr,+
                   APR.teen$windv.2010.apr,APR.teen$windv.2011.apr,APR.teen$windv.2012.apr,+
                   APR.teen$windv.2013.apr,APR.teen$windv.2014.apr,APR.teen$windv.2015.apr,+
                   APR.teen$windv.2016.apr,APR.teen$windv.2017.apr,APR.teen$windv.2018.apr,APR.teen$windv.2019.apr)
MAY.ugrd <- mean(MAY.ought$windv.2007.may,MAY.ought$windv.2008.may,MAY.ought$windv.2009.may,+
                   MAY.teen$windv.2010.may,MAY.teen$windv.2011.may,MAY.teen$windv.2012.may,+
                   MAY.teen$windv.2013.may,MAY.teen$windv.2014.may,MAY.teen$windv.2015.may,+
                   MAY.teen$windv.2016.may,MAY.teen$windv.2017.may,MAY.teen$windv.2018.may)
JUN.ugrd <- mean(JUN.ought$windv.2007.jun,JUN.ought$windv.2008.jun,JUN.ought$windv.2009.jun,+
                   JUN.teen$windv.2010.jun,JUN.teen$windv.2011.jun,JUN.teen$windv.2012.jun,+
                   JUN.teen$windv.2013.jun,JUN.teen$windv.2014.jun,JUN.teen$windv.2015.jun,+
                   JUN.teen$windv.2016.jun,JUN.teen$windv.2017.jun,JUN.teen$windv.2018.jun)
JUL.ugrd <- mean(JUL.ought$windv.2007.jul,JUL.ought$windv.2008.jul,JUL.ought$windv.2009.jul,+
                   JUL.teen$windv.2010.jul,JUL.teen$windv.2011.jul,JUL.teen$windv.2012.jul,+
                   JUL.teen$windv.2013.jul,JUL.teen$windv.2014.jul,JUL.teen$windv.2015.jul,+
                   JUL.teen$windv.2016.jul,JUL.teen$windv.2017.jul,JUL.teen$windv.2018.jul)
AUG.ugrd <- mean(AUG.ought$windv.2007.aug,AUG.ought$windv.2008.aug,AUG.ought$windv.2009.aug,+
                   AUG.teen$windv.2010.aug,AUG.teen$windv.2011.aug,AUG.teen$windv.2012.aug,+
                   AUG.teen$windv.2013.aug,AUG.teen$windv.2014.aug,AUG.teen$windv.2015.aug,+
                   AUG.teen$windv.2016.aug,AUG.teen$windv.2017.aug,AUG.teen$windv.2018.aug)
SEP.ugrd <- mean(SEP.ought$windv.2007.sep,SEP.ought$windv.2008.sep,SEP.ought$windv.2009.sep,+
                   SEP.teen$windv.2010.sep,SEP.teen$windv.2011.sep,SEP.teen$windv.2012.sep,+
                   SEP.teen$windv.2013.sep,SEP.teen$windv.2014.sep,SEP.teen$windv.2015.sep,+
                   SEP.teen$windv.2016.sep,SEP.teen$windv.2017.sep,SEP.teen$windv.2018.sep)
OCT.ugrd <- mean(OCT.ought$windv.2007.oct,OCT.ought$windv.2008.oct,OCT.ought$windv.2009.oct,+
                   OCT.teen$windv.2010.oct,OCT.teen$windv.2011.oct,OCT.teen$windv.2012.oct,+
                   OCT.teen$windv.2013.oct,OCT.teen$windv.2014.oct,OCT.teen$windv.2015.oct,+
                   OCT.teen$windv.2016.oct,OCT.teen$windv.2017.oct,OCT.teen$windv.2018.oct)
NOV.ugrd <- mean(NOV.ought$windv.2007.nov,NOV.ought$windv.2008.nov,NOV.ought$windv.2009.nov,+
                   NOV.teen$windv.2010.nov,NOV.teen$windv.2011.nov,NOV.teen$windv.2012.nov,+
                   NOV.teen$windv.2013.nov,NOV.teen$windv.2014.nov,NOV.teen$windv.2015.nov,+
                   NOV.teen$windv.2016.nov,NOV.teen$windv.2017.nov,NOV.teen$windv.2018.nov)
DEC.ugrd <- mean(DEC.ought$windv.2007.dec,DEC.ought$windv.2008.dec,DEC.ought$windv.2009.dec,+
                   DEC.teen$windv.2010.dec,DEC.teen$windv.2011.dec,DEC.teen$windv.2012.dec,+
                   DEC.teen$windv.2013.dec,DEC.teen$windv.2014.dec,DEC.teen$windv.2015.dec,+
                   DEC.teen$windv.2016.dec,DEC.teen$windv.2017.dec,DEC.teen$windv.2018.dec)

wind.v.by.month <- c(JAN.ugrd,FEB.ugrd,MAR.ugrd,APR.ugrd,MAY.ugrd,JUN.ugrd,JUL.ugrd,AUG.ugrd,+
                    SEP.ugrd,OCT.ugrd,NOV.ugrd,DEC.ugrd)

plot(wind.v.by.month, xlab="month",ylab="average wind speed [m/s]")
################################
# Precipitation
# given in kg/h2O/m^2/hr
# convert to mm
################################
# january
JAN.ought <- vector('list', 3)
names(JAN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "prate") [,5,8]
  JAN.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JAN.ought) <- sprintf("prate.200%s.jan", names(JAN.ought))

JAN.teen <- vector('list', 10)
names(JAN.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "prate") [,5,8]
  JAN.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JAN.teen) <- sprintf("prate.20%s.jan", names(JAN.teen))

# february
FEB.ought <- vector('list', 3)
names(FEB.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "prate") [,5,8]
  FEB.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(FEB.ought) <- sprintf("prate.200%s.feb", names(FEB.ought))

FEB.teen <- vector('list', 10)
names(FEB.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "prate") [,5,8]
  FEB.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(FEB.teen) <- sprintf("prate.20%s.feb", names(FEB.teen))

# march
MAR.ought <- vector('list', 3)
names(MAR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "prate") [,5,8]
  MAR.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(MAR.ought) <- sprintf("prate.200%s.mar", names(MAR.ought))

MAR.teen <- vector('list', 10)
names(MAR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "prate") [,5,8]
  MAR.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(MAR.teen) <- sprintf("prate.20%s.mar", names(MAR.teen))

# april
APR.ought <- vector('list', 3)
names(APR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "prate") [,5,8]
  APR.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(APR.ought) <- sprintf("prate.200%s.apr", names(APR.ought))

APR.teen <- vector('list', 10)
names(APR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "prate") [,5,8]
  APR.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(APR.teen) <- sprintf("prate.20%s.apr", names(APR.teen))

# may
MAY.ought <- vector('list', 3)
names(MAY.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "prate") [,5,8]
  MAY.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(MAY.ought) <- sprintf("prate.200%s.may", names(MAY.ought))

MAY.teen <- vector('list', 9)
names(MAY.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "prate") [,5,8]
  MAY.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(MAY.teen) <- sprintf("prate.20%s.may", names(MAY.teen))

# june
JUN.ought <- vector('list', 3)
names(JUN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "prate") [,5,8]
  JUN.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JUN.ought) <- sprintf("prate.200%s.jun", names(JUN.ought))

JUN.teen <- vector('list', 9)
names(JUN.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "prate") [,5,8]
  JUN.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JUN.teen) <- sprintf("prate.20%s.jun", names(JUN.teen))

# july
JUL.ought <- vector('list', 3)
names(JUL.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "prate") [,5,8]
  JUL.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JUL.ought) <- sprintf("prate.200%s.jul", names(JUL.ought))

JUL.teen <- vector('list', 9)
names(JUL.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "prate") [,5,8]
  JUL.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(JUL.teen) <- sprintf("prate.20%s.jul", names(JUL.teen))

# august
AUG.ought <- vector('list', 3)
names(AUG.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "prate") [,5,8]
  AUG.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(AUG.ought) <- sprintf("prate.200%s.aug", names(AUG.ought))

AUG.teen <- vector('list', 9)
names(AUG.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "prate") [,5,8]
  AUG.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(AUG.teen) <- sprintf("prate.20%s.aug", names(AUG.teen))

# september
SEP.ought <- vector('list', 3)
names(SEP.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "prate") [,5,8]
  SEP.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(SEP.ought) <- sprintf("prate.200%s.sep", names(SEP.ought))

SEP.teen <- vector('list', 9)
names(SEP.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "prate") [,5,8]
  SEP.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(SEP.teen) <- sprintf("prate.20%s.sep", names(SEP.teen))

# october
OCT.ought <- vector('list', 3)
names(OCT.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "prate") [,5,8]
  OCT.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(OCT.ought) <- sprintf("prate.200%s.oct", names(OCT.ought))

OCT.teen <- vector('list', 9)
names(OCT.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "prate") [,5,8]
  OCT.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(OCT.teen) <- sprintf("prate.20%s.oct", names(OCT.teen))

# november
NOV.ought <- vector('list', 3)
names(NOV.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "prate") [,5,8]
  NOV.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(NOV.ought) <- sprintf("prate.200%s.nov", names(NOV.ought))

NOV.teen <- vector('list', 9)
names(NOV.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "prate") [,5,8]
  NOV.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(NOV.teen) <- sprintf("prate.20%s.nov", names(NOV.teen))

# december
DEC.ought <- vector('list', 3)
names(DEC.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "prate") [,5,8]
  DEC.ought[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(DEC.ought) <- sprintf("prate.200%s.dec", names(DEC.ought))

DEC.teen <- vector('list', 9)
names(DEC.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "prate") [,5,8]
  DEC.teen[[as.character(i)]] <- tail(cumsum(tmp)*3600, n = 1)
}
names(DEC.teen) <- sprintf("prate.20%s.dec", names(DEC.teen))

JAN.prate <- mean(JAN.ought$prate.2007.jan,JAN.ought$prate.2008.jan,JAN.ought$prate.2009.jan,+
                    JAN.teen$prate.2010.jan,JAN.teen$prate.2011.jan,JAN.teen$prate.2012.jan,+
                    JAN.teen$prate.2013.jan,JAN.teen$prate.2014.jan,JAN.teen$prate.2015.jan,+
                    JAN.teen$prate.2016.jan,JAN.teen$prate.2017.jan,JAN.teen$prate.2018.jan,JAN.teen$prate.2019.jan)
FEB.prate <- mean(FEB.ought$prate.2007.feb,FEB.ought$prate.2008.feb,FEB.ought$prate.2009.feb,+
                    FEB.teen$prate.2010.feb,FEB.teen$prate.2011.feb,FEB.teen$prate.2012.feb,+
                    FEB.teen$prate.2013.feb,FEB.teen$prate.2014.feb,FEB.teen$prate.2015.feb,+
                    FEB.teen$prate.2016.feb,FEB.teen$prate.2017.feb,FEB.teen$prate.2018.feb,FEB.teen$prate.2019.feb)
MAR.prate <- mean(MAR.ought$prate.2007.mar,MAR.ought$prate.2008.mar,MAR.ought$prate.2009.mar,+
                    MAR.teen$prate.2010.mar,MAR.teen$prate.2011.mar,MAR.teen$prate.2012.mar,+
                    MAR.teen$prate.2013.mar,MAR.teen$prate.2014.mar,MAR.teen$prate.2015.mar,+
                    MAR.teen$prate.2016.mar,MAR.teen$prate.2017.mar,MAR.teen$prate.2018.mar,MAR.teen$prate.2019.mar)
APR.prate <- mean(APR.ought$prate.2007.apr,APR.ought$prate.2008.apr,APR.ought$prate.2009.apr,+
                    APR.teen$prate.2010.apr,APR.teen$prate.2011.apr,APR.teen$prate.2012.apr,+
                    APR.teen$prate.2013.apr,APR.teen$prate.2014.apr,APR.teen$prate.2015.apr,+
                    APR.teen$prate.2016.apr,APR.teen$prate.2017.apr,APR.teen$prate.2018.apr,APR.teen$prate.2019.apr)
MAY.prate <- mean(MAY.ought$prate.2007.may,MAY.ought$prate.2008.may,MAY.ought$prate.2009.may,+
                    MAY.teen$prate.2010.may,MAY.teen$prate.2011.may,MAY.teen$prate.2012.may,+
                    MAY.teen$prate.2013.may,MAY.teen$prate.2014.may,MAY.teen$prate.2015.may,+
                    MAY.teen$prate.2016.may,MAY.teen$prate.2017.may,MAY.teen$prate.2018.may)
JUN.prate <- mean(JUN.ought$prate.2007.jun,JUN.ought$prate.2008.jun,JUN.ought$prate.2009.jun,+
                    JUN.teen$prate.2010.jun,JUN.teen$prate.2011.jun,JUN.teen$prate.2012.jun,+
                    JUN.teen$prate.2013.jun,JUN.teen$prate.2014.jun,JUN.teen$prate.2015.jun,+
                    JUN.teen$prate.2016.jun,JUN.teen$prate.2017.jun,JUN.teen$prate.2018.jun)
JUL.prate <- mean(JUL.ought$prate.2007.jul,JUL.ought$prate.2008.jul,JUL.ought$prate.2009.jul,+
                    JUL.teen$prate.2010.jul,JUL.teen$prate.2011.jul,JUL.teen$prate.2012.jul,+
                    JUL.teen$prate.2013.jul,JUL.teen$prate.2014.jul,JUL.teen$prate.2015.jul,+
                    JUL.teen$prate.2016.jul,JUL.teen$prate.2017.jul,JUL.teen$prate.2018.jul)
AUG.prate <- mean(AUG.ought$prate.2007.aug,AUG.ought$prate.2008.aug,AUG.ought$prate.2009.aug,+
                    AUG.teen$prate.2010.aug,AUG.teen$prate.2011.aug,AUG.teen$prate.2012.aug,+
                    AUG.teen$prate.2013.aug,AUG.teen$prate.2014.aug,AUG.teen$prate.2015.aug,+
                    AUG.teen$prate.2016.aug,AUG.teen$prate.2017.aug,AUG.teen$prate.2018.aug)
SEP.prate <- mean(SEP.ought$prate.2007.sep,SEP.ought$prate.2008.sep,SEP.ought$prate.2009.sep,+
                    SEP.teen$prate.2010.sep,SEP.teen$prate.2011.sep,SEP.teen$prate.2012.sep,+
                    SEP.teen$prate.2013.sep,SEP.teen$prate.2014.sep,SEP.teen$prate.2015.sep,+
                    SEP.teen$prate.2016.sep,SEP.teen$prate.2017.sep,SEP.teen$prate.2018.sep)
OCT.prate <- mean(OCT.ought$prate.2007.oct,OCT.ought$prate.2008.oct,OCT.ought$prate.2009.oct,+
                    OCT.teen$prate.2010.oct,OCT.teen$prate.2011.oct,OCT.teen$prate.2012.oct,+
                    OCT.teen$prate.2013.oct,OCT.teen$prate.2014.oct,OCT.teen$prate.2015.oct,+
                    OCT.teen$prate.2016.oct,OCT.teen$prate.2017.oct,OCT.teen$prate.2018.oct)
NOV.prate <- mean(NOV.ought$prate.2007.nov,NOV.ought$prate.2008.nov,NOV.ought$prate.2009.nov,+
                    NOV.teen$prate.2010.nov,NOV.teen$prate.2011.nov,NOV.teen$prate.2012.nov,+
                    NOV.teen$prate.2013.nov,NOV.teen$prate.2014.nov,NOV.teen$prate.2015.nov,+
                    NOV.teen$prate.2016.nov,NOV.teen$prate.2017.nov,NOV.teen$prate.2018.nov)
DEC.prate <- mean(DEC.ought$prate.2007.dec,DEC.ought$prate.2008.dec,DEC.ought$prate.2009.dec,+
                    DEC.teen$prate.2010.dec,DEC.teen$prate.2011.dec,DEC.teen$prate.2012.dec,+
                    DEC.teen$prate.2013.dec,DEC.teen$prate.2014.dec,DEC.teen$prate.2015.dec,+
                    DEC.teen$prate.2016.dec,DEC.teen$prate.2017.dec,DEC.teen$prate.2018.dec)

prate.by.month <- c(JAN.prate,FEB.prate,MAR.prate,APR.prate,MAY.prate,JUN.prate,JUL.prate,+
                      AUG.prate,SEP.prate,OCT.prate,NOV.prate,DEC.prate)

plot(prate.by.month, xlab='month',ylab='monthly mean precipitation [mm]')
################################
# Temperature
# Given in K, convert to C (-273.15)

# Starting with mean temperature...
################################
# january
JAN.ought <- vector('list', 3)
names(JAN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "tmp") [,5,8]
  JAN.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(JAN.ought) <- sprintf("tmp.200%s.jan", names(JAN.ought))

JAN.teen <- vector('list', 10)
names(JAN.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "tmp") [,5,8]
  JAN.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(JAN.teen) <- sprintf("tmp.20%s.jan", names(JAN.teen))

# february
FEB.ought <- vector('list', 3)
names(FEB.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "tmp") [,5,8]
  FEB.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(FEB.ought) <- sprintf("tmp.200%s.feb", names(FEB.ought))

FEB.teen <- vector('list', 10)
names(FEB.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "tmp") [,5,8]
  FEB.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(FEB.teen) <- sprintf("tmp.20%s.feb", names(FEB.teen))

# march
MAR.ought <- vector('list', 3)
names(MAR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "tmp") [,5,8]
  MAR.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(MAR.ought) <- sprintf("tmp.200%s.mar", names(MAR.ought))

MAR.teen <- vector('list', 10)
names(MAR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "tmp") [,5,8]
  MAR.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(MAR.teen) <- sprintf("tmp.20%s.mar", names(MAR.teen))

# april
APR.ought <- vector('list', 3)
names(APR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "tmp") [,5,8]
  APR.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(APR.ought) <- sprintf("tmp.200%s.apr", names(APR.ought))

APR.teen <- vector('list', 10)
names(APR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "tmp") [,5,8]
  APR.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(APR.teen) <- sprintf("tmp.20%s.apr", names(APR.teen))

# may
MAY.ought <- vector('list', 3)
names(MAY.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "tmp") [,5,8]
  MAY.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(MAY.ought) <- sprintf("tmp.200%s.may", names(MAY.ought))

MAY.teen <- vector('list', 9)
names(MAY.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "tmp") [,5,8]
  MAY.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(MAY.teen) <- sprintf("tmp.20%s.may", names(MAY.teen))

# june
JUN.ought <- vector('list', 3)
names(JUN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "tmp") [,5,8]
  JUN.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(JUN.ought) <- sprintf("tmp.200%s.jun", names(JUN.ought))

JUN.teen <- vector('list', 9)
names(JUN.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "tmp") [,5,8]
  JUN.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(JUN.teen) <- sprintf("tmp.20%s.jun", names(JUN.teen))

# july
JUL.ought <- vector('list', 3)
names(JUL.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "tmp") [,5,8]
  JUL.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(JUL.ought) <- sprintf("tmp.200%s.jul", names(JUL.ought))

JUL.teen <- vector('list', 9)
names(JUL.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "tmp") [,5,8]
  JUL.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(JUL.teen) <- sprintf("tmp.20%s.jul", names(JUL.teen))

# august
AUG.ought <- vector('list', 3)
names(AUG.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "tmp") [,5,8]
  AUG.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(AUG.ought) <- sprintf("tmp.200%s.aug", names(AUG.ought))

AUG.teen <- vector('list', 9)
names(AUG.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "tmp") [,5,8]
  AUG.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(AUG.teen) <- sprintf("tmp.20%s.aug", names(AUG.teen))

# september
SEP.ought <- vector('list', 3)
names(SEP.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "tmp") [,5,8]
  SEP.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(SEP.ought) <- sprintf("tmp.200%s.sep", names(SEP.ought))

SEP.teen <- vector('list', 9)
names(SEP.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "tmp") [,5,8]
  SEP.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(SEP.teen) <- sprintf("tmp.20%s.sep", names(SEP.teen))

# october
OCT.ought <- vector('list', 3)
names(OCT.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "tmp") [,5,8]
  OCT.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(OCT.ought) <- sprintf("tmp.200%s.oct", names(OCT.ought))

OCT.teen <- vector('list', 9)
names(OCT.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "tmp") [,5,8]
  OCT.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(OCT.teen) <- sprintf("tmp.20%s.oct", names(OCT.teen))

# november
NOV.ought <- vector('list', 3)
names(NOV.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "tmp") [,5,8]
  NOV.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(NOV.ought) <- sprintf("tmp.200%s.nov", names(NOV.ought))

NOV.teen <- vector('list', 9)
names(NOV.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "tmp") [,5,8]
  NOV.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(NOV.teen) <- sprintf("tmp.20%s.nov", names(NOV.teen))

# december.         
DEC.ought <- vector('list', 3)
names(DEC.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "tmp") [,5,8]
  DEC.ought[[as.character(i)]] <- mean(tmp)-273.15
}
names(DEC.ought) <- sprintf("tmp.200%s.dec", names(DEC.ought))

DEC.teen <- vector('list', 9)
names(DEC.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "tmp") [,5,8]
  DEC.teen[[as.character(i)]] <- mean(tmp)-273.15
}
names(DEC.teen) <- sprintf("tmp.20%s.dec", names(DEC.teen))

JAN.tmp <- mean(JAN.ought$tmp.2007.jan,JAN.ought$tmp.2008.jan,JAN.ought$tmp.2009.jan,+
                  JAN.teen$tmp.2010.jan,JAN.teen$tmp.2011.jan,JAN.teen$tmp.2012.jan,+
                  JAN.teen$tmp.2013.jan,JAN.teen$tmp.2014.jan,JAN.teen$tmp.2015.jan,+
                  JAN.teen$tmp.2016.jan,JAN.teen$tmp.2017.jan,JAN.teen$tmp.2018.jan,JAN.teen$tmp.2019.jan)
FEB.tmp <- mean(FEB.ought$tmp.2007.feb,FEB.ought$tmp.2008.feb,FEB.ought$tmp.2009.feb,+
                  FEB.teen$tmp.2010.feb,FEB.teen$tmp.2011.feb,FEB.teen$tmp.2012.feb,+
                  FEB.teen$tmp.2013.feb,FEB.teen$tmp.2014.feb,FEB.teen$tmp.2015.feb,+
                  FEB.teen$tmp.2016.feb,FEB.teen$tmp.2017.feb,FEB.teen$tmp.2018.feb,FEB.teen$tmp.2019.feb)
MAR.tmp <- mean(MAR.ought$tmp.2007.mar,MAR.ought$tmp.2008.mar,MAR.ought$tmp.2009.mar,+
                  MAR.teen$tmp.2010.mar,MAR.teen$tmp.2011.mar,MAR.teen$tmp.2012.mar,+
                  MAR.teen$tmp.2013.mar,MAR.teen$tmp.2014.mar,MAR.teen$tmp.2015.mar,+
                  MAR.teen$tmp.2016.mar,MAR.teen$tmp.2017.mar,MAR.teen$tmp.2018.mar,MAR.teen$tmp.2019.mar)
APR.tmp <- mean(APR.ought$tmp.2007.apr,APR.ought$tmp.2008.apr,APR.ought$tmp.2009.apr,+
                  APR.teen$tmp.2010.apr,APR.teen$tmp.2011.apr,APR.teen$tmp.2012.apr,+
                  APR.teen$tmp.2013.apr,APR.teen$tmp.2014.apr,APR.teen$tmp.2015.apr,+
                  APR.teen$tmp.2016.apr,APR.teen$tmp.2017.apr,APR.teen$tmp.2018.apr,APR.teen$tmp.2019.apr)
MAY.tmp <- mean(MAY.ought$tmp.2007.may,MAY.ought$tmp.2008.may,MAY.ought$tmp.2009.may,+
                  MAY.teen$tmp.2010.may,MAY.teen$tmp.2011.may,MAY.teen$tmp.2012.may,+
                  MAY.teen$tmp.2013.may,MAY.teen$tmp.2014.may,MAY.teen$tmp.2015.may,+
                  MAY.teen$tmp.2016.may,MAY.teen$tmp.2017.may,MAY.teen$tmp.2018.may)
JUN.tmp <- mean(JUN.ought$tmp.2007.jun,JUN.ought$tmp.2008.jun,JUN.ought$tmp.2009.jun,+
                  JUN.teen$tmp.2010.jun,JUN.teen$tmp.2011.jun,JUN.teen$tmp.2012.jun,+
                  JUN.teen$tmp.2013.jun,JUN.teen$tmp.2014.jun,JUN.teen$tmp.2015.jun,+
                  JUN.teen$tmp.2016.jun,JUN.teen$tmp.2017.jun,JUN.teen$tmp.2018.jun)
JUL.tmp <- mean(JUL.ought$tmp.2007.jul,JUL.ought$tmp.2008.jul,JUL.ought$tmp.2009.jul,+
                  JUL.teen$tmp.2010.jul,JUL.teen$tmp.2011.jul,JUL.teen$tmp.2012.jul,+
                  JUL.teen$tmp.2013.jul,JUL.teen$tmp.2014.jul,JUL.teen$tmp.2015.jul,+
                  JUL.teen$tmp.2016.jul,JUL.teen$tmp.2017.jul,JUL.teen$tmp.2018.jul)
AUG.tmp <- mean(AUG.ought$tmp.2007.aug,AUG.ought$tmp.2008.aug,AUG.ought$tmp.2009.aug,+
                  AUG.teen$tmp.2010.aug,AUG.teen$tmp.2011.aug,AUG.teen$tmp.2012.aug,+
                  AUG.teen$tmp.2013.aug,AUG.teen$tmp.2014.aug,AUG.teen$tmp.2015.aug,+
                  AUG.teen$tmp.2016.aug,AUG.teen$tmp.2017.aug,AUG.teen$tmp.2018.aug)
SEP.tmp <- mean(SEP.ought$tmp.2007.sep,SEP.ought$tmp.2008.sep,SEP.ought$tmp.2009.sep,+
                  SEP.teen$tmp.2010.sep,SEP.teen$tmp.2011.sep,SEP.teen$tmp.2012.sep,+
                  SEP.teen$tmp.2013.sep,SEP.teen$tmp.2014.sep,SEP.teen$tmp.2015.sep,+
                  SEP.teen$tmp.2016.sep,SEP.teen$tmp.2017.sep,SEP.teen$tmp.2018.sep)
OCT.tmp <- mean(OCT.ought$tmp.2007.oct,OCT.ought$tmp.2008.oct,OCT.ought$tmp.2009.oct,+
                  OCT.teen$tmp.2010.oct,OCT.teen$tmp.2011.oct,OCT.teen$tmp.2012.oct,+
                  OCT.teen$tmp.2013.oct,OCT.teen$tmp.2014.oct,OCT.teen$tmp.2015.oct,+
                  OCT.teen$tmp.2016.oct,OCT.teen$tmp.2017.oct,OCT.teen$tmp.2018.oct)
NOV.tmp <- mean(NOV.ought$tmp.2007.nov,NOV.ought$tmp.2008.nov,NOV.ought$tmp.2009.nov,+
                  NOV.teen$tmp.2010.nov,NOV.teen$tmp.2011.nov,NOV.teen$tmp.2012.nov,+
                  NOV.teen$tmp.2013.nov,NOV.teen$tmp.2014.nov,NOV.teen$tmp.2015.nov,+
                  NOV.teen$tmp.2016.nov,NOV.teen$tmp.2017.nov,NOV.teen$tmp.2018.nov)
DEC.tmp <- mean(DEC.ought$tmp.2007.dec,DEC.ought$tmp.2008.dec,DEC.ought$tmp.2009.dec,+
                  DEC.teen$tmp.2010.dec,DEC.teen$tmp.2011.dec,DEC.teen$tmp.2012.dec,+
                  DEC.teen$tmp.2013.dec,DEC.teen$tmp.2014.dec,DEC.teen$tmp.2015.dec,+
                  DEC.teen$tmp.2016.dec,DEC.teen$tmp.2017.dec,DEC.teen$tmp.2018.dec)

tmp.by.month.mean <- c(JAN.tmp,FEB.tmp,MAR.tmp,APR.tmp,MAY.tmp,JUN.tmp,JUL.tmp,+
                    AUG.tmp,SEP.tmp,OCT.tmp,NOV.tmp,DEC.tmp)

plot(tmp.by.month.mean, ylab='monthly mean temperature [C]',xlab='month')
################################
# Next, max temperature...
################################
# january
JAN.ought <- vector('list', 3)
names(JAN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "tmp") [,5,8]
  JAN.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(JAN.ought) <- sprintf("tmp.200%s.jan", names(JAN.ought))

JAN.teen <- vector('list', 10)
names(JAN.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "tmp") [,5,8]
  JAN.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(JAN.teen) <- sprintf("tmp.20%s.jan", names(JAN.teen))

# february
FEB.ought <- vector('list', 3)
names(FEB.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "tmp") [,5,8]
  FEB.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(FEB.ought) <- sprintf("tmp.200%s.feb", names(FEB.ought))

FEB.teen <- vector('list', 10)
names(FEB.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "tmp") [,5,8]
  FEB.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(FEB.teen) <- sprintf("tmp.20%s.feb", names(FEB.teen))

# march
MAR.ought <- vector('list', 3)
names(MAR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "tmp") [,5,8]
  MAR.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(MAR.ought) <- sprintf("tmp.200%s.mar", names(MAR.ought))

MAR.teen <- vector('list', 10)
names(MAR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "tmp") [,5,8]
  MAR.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(MAR.teen) <- sprintf("tmp.20%s.mar", names(MAR.teen))

# april
APR.ought <- vector('list', 3)
names(APR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "tmp") [,5,8]
  APR.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(APR.ought) <- sprintf("tmp.200%s.apr", names(APR.ought))

APR.teen <- vector('list', 10)
names(APR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "tmp") [,5,8]
  APR.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(APR.teen) <- sprintf("tmp.20%s.apr", names(APR.teen))

# may
MAY.ought <- vector('list', 3)
names(MAY.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "tmp") [,5,8]
  MAY.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(MAY.ought) <- sprintf("tmp.200%s.may", names(MAY.ought))

MAY.teen <- vector('list', 9)
names(MAY.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "tmp") [,5,8]
  MAY.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(MAY.teen) <- sprintf("tmp.20%s.may", names(MAY.teen))

# june
JUN.ought <- vector('list', 3)
names(JUN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "tmp") [,5,8]
  JUN.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(JUN.ought) <- sprintf("tmp.200%s.jun", names(JUN.ought))

JUN.teen <- vector('list', 9)
names(JUN.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "tmp") [,5,8]
  JUN.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(JUN.teen) <- sprintf("tmp.20%s.jun", names(JUN.teen))

# july
JUL.ought <- vector('list', 3)
names(JUL.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "tmp") [,5,8]
  JUL.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(JUL.ought) <- sprintf("tmp.200%s.jul", names(JUL.ought))

JUL.teen <- vector('list', 9)
names(JUL.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "tmp") [,5,8]
  JUL.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(JUL.teen) <- sprintf("tmp.20%s.jul", names(JUL.teen))

# august
AUG.ought <- vector('list', 3)
names(AUG.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "tmp") [,5,8]
  AUG.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(AUG.ought) <- sprintf("tmp.200%s.aug", names(AUG.ought))

AUG.teen <- vector('list', 9)
names(AUG.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "tmp") [,5,8]
  AUG.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(AUG.teen) <- sprintf("tmp.20%s.aug", names(AUG.teen))

# september
SEP.ought <- vector('list', 3)
names(SEP.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "tmp") [,5,8]
  SEP.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(SEP.ought) <- sprintf("tmp.200%s.sep", names(SEP.ought))

SEP.teen <- vector('list', 9)
names(SEP.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "tmp") [,5,8]
  SEP.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(SEP.teen) <- sprintf("tmp.20%s.sep", names(SEP.teen))

# october
OCT.ought <- vector('list', 3)
names(OCT.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "tmp") [,5,8]
  OCT.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(OCT.ought) <- sprintf("tmp.200%s.oct", names(OCT.ought))

OCT.teen <- vector('list', 9)
names(OCT.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "tmp") [,5,8]
  OCT.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(OCT.teen) <- sprintf("tmp.20%s.oct", names(OCT.teen))

# november
NOV.ought <- vector('list', 3)
names(NOV.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "tmp") [,5,8]
  NOV.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(NOV.ought) <- sprintf("tmp.200%s.nov", names(NOV.ought))

NOV.teen <- vector('list', 9)
names(NOV.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "tmp") [,5,8]
  NOV.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(NOV.teen) <- sprintf("tmp.20%s.nov", names(NOV.teen))

# december.
DEC.ought <- vector('list', 3)
names(DEC.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "tmp") [,5,8]
  DEC.ought[[as.character(i)]] <- max(tmp)-273.15
}
names(DEC.ought) <- sprintf("tmp.200%s.dec", names(DEC.ought))

DEC.teen <- vector('list', 9)
names(DEC.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "tmp") [,5,8]
  DEC.teen[[as.character(i)]] <- max(tmp)-273.15
}
names(DEC.teen) <- sprintf("tmp.20%s.dec", names(DEC.teen))

JAN.tmp.max <- max(JAN.ought$tmp.2007.jan,JAN.ought$tmp.2008.jan,JAN.ought$tmp.2009.jan,+
                  JAN.teen$tmp.2010.jan,JAN.teen$tmp.2011.jan,JAN.teen$tmp.2012.jan,+
                  JAN.teen$tmp.2013.jan,JAN.teen$tmp.2014.jan,JAN.teen$tmp.2015.jan,+
                  JAN.teen$tmp.2016.jan,JAN.teen$tmp.2017.jan,JAN.teen$tmp.2018.jan,JAN.teen$tmp.2019.jan)
FEB.tmp.max <- max(FEB.ought$tmp.2007.feb,FEB.ought$tmp.2008.feb,FEB.ought$tmp.2009.feb,+
                  FEB.teen$tmp.2010.feb,FEB.teen$tmp.2011.feb,FEB.teen$tmp.2012.feb,+
                  FEB.teen$tmp.2013.feb,FEB.teen$tmp.2014.feb,FEB.teen$tmp.2015.feb,+
                  FEB.teen$tmp.2016.feb,FEB.teen$tmp.2017.feb,FEB.teen$tmp.2018.feb,FEB.teen$tmp.2019.feb)
MAR.tmp.max <- max(MAR.ought$tmp.2007.mar,MAR.ought$tmp.2008.mar,MAR.ought$tmp.2009.mar,+
                  MAR.teen$tmp.2010.mar,MAR.teen$tmp.2011.mar,MAR.teen$tmp.2012.mar,+
                  MAR.teen$tmp.2013.mar,MAR.teen$tmp.2014.mar,MAR.teen$tmp.2015.mar,+
                  MAR.teen$tmp.2016.mar,MAR.teen$tmp.2017.mar,MAR.teen$tmp.2018.mar,MAR.teen$tmp.2019.mar)
APR.tmp.max <- max(APR.ought$tmp.2007.apr,APR.ought$tmp.2008.apr,APR.ought$tmp.2009.apr,+
                  APR.teen$tmp.2010.apr,APR.teen$tmp.2011.apr,APR.teen$tmp.2012.apr,+
                  APR.teen$tmp.2013.apr,APR.teen$tmp.2014.apr,APR.teen$tmp.2015.apr,+
                  APR.teen$tmp.2016.apr,APR.teen$tmp.2017.apr,APR.teen$tmp.2018.apr,APR.teen$tmp.2019.apr)
MAY.tmp.max <- max(MAY.ought$tmp.2007.may,MAY.ought$tmp.2008.may,MAY.ought$tmp.2009.may,+
                  MAY.teen$tmp.2010.may,MAY.teen$tmp.2011.may,MAY.teen$tmp.2012.may,+
                  MAY.teen$tmp.2013.may,MAY.teen$tmp.2014.may,MAY.teen$tmp.2015.may,+
                  MAY.teen$tmp.2016.may,MAY.teen$tmp.2017.may,MAY.teen$tmp.2018.may)
JUN.tmp.max <- max(JUN.ought$tmp.2007.jun,JUN.ought$tmp.2008.jun,JUN.ought$tmp.2009.jun,+
                  JUN.teen$tmp.2010.jun,JUN.teen$tmp.2011.jun,JUN.teen$tmp.2012.jun,+
                  JUN.teen$tmp.2013.jun,JUN.teen$tmp.2014.jun,JUN.teen$tmp.2015.jun,+
                  JUN.teen$tmp.2016.jun,JUN.teen$tmp.2017.jun,JUN.teen$tmp.2018.jun)
JUL.tmp.max <- max(JUL.ought$tmp.2007.jul,JUL.ought$tmp.2008.jul,JUL.ought$tmp.2009.jul,+
                  JUL.teen$tmp.2010.jul,JUL.teen$tmp.2011.jul,JUL.teen$tmp.2012.jul,+
                  JUL.teen$tmp.2013.jul,JUL.teen$tmp.2014.jul,JUL.teen$tmp.2015.jul,+
                  JUL.teen$tmp.2016.jul,JUL.teen$tmp.2017.jul,JUL.teen$tmp.2018.jul)
AUG.tmp.max <- max(AUG.ought$tmp.2007.aug,AUG.ought$tmp.2008.aug,AUG.ought$tmp.2009.aug,+
                  AUG.teen$tmp.2010.aug,AUG.teen$tmp.2011.aug,AUG.teen$tmp.2012.aug,+
                  AUG.teen$tmp.2013.aug,AUG.teen$tmp.2014.aug,AUG.teen$tmp.2015.aug,+
                  AUG.teen$tmp.2016.aug,AUG.teen$tmp.2017.aug,AUG.teen$tmp.2018.aug)
SEP.tmp.max <- max(SEP.ought$tmp.2007.sep,SEP.ought$tmp.2008.sep,SEP.ought$tmp.2009.sep,+
                  SEP.teen$tmp.2010.sep,SEP.teen$tmp.2011.sep,SEP.teen$tmp.2012.sep,+
                  SEP.teen$tmp.2013.sep,SEP.teen$tmp.2014.sep,SEP.teen$tmp.2015.sep,+
                  SEP.teen$tmp.2016.sep,SEP.teen$tmp.2017.sep,SEP.teen$tmp.2018.sep)
OCT.tmp.max <- max(OCT.ought$tmp.2007.oct,OCT.ought$tmp.2008.oct,OCT.ought$tmp.2009.oct,+
                  OCT.teen$tmp.2010.oct,OCT.teen$tmp.2011.oct,OCT.teen$tmp.2012.oct,+
                  OCT.teen$tmp.2013.oct,OCT.teen$tmp.2014.oct,OCT.teen$tmp.2015.oct,+
                  OCT.teen$tmp.2016.oct,OCT.teen$tmp.2017.oct,OCT.teen$tmp.2018.oct)
NOV.tmp.max <- max(NOV.ought$tmp.2007.nov,NOV.ought$tmp.2008.nov,NOV.ought$tmp.2009.nov,+
                  NOV.teen$tmp.2010.nov,NOV.teen$tmp.2011.nov,NOV.teen$tmp.2012.nov,+
                  NOV.teen$tmp.2013.nov,NOV.teen$tmp.2014.nov,NOV.teen$tmp.2015.nov,+
                  NOV.teen$tmp.2016.nov,NOV.teen$tmp.2017.nov,NOV.teen$tmp.2018.nov)
DEC.tmp.max <- max(DEC.ought$tmp.2007.dec,DEC.ought$tmp.2008.dec,DEC.ought$tmp.2009.dec,+
                  DEC.teen$tmp.2010.dec,DEC.teen$tmp.2011.dec,DEC.teen$tmp.2012.dec,+
                  DEC.teen$tmp.2013.dec,DEC.teen$tmp.2014.dec,DEC.teen$tmp.2015.dec,+
                  DEC.teen$tmp.2016.dec,DEC.teen$tmp.2017.dec,DEC.teen$tmp.2018.dec)

tmp.by.month.max <- c(JAN.tmp.max,FEB.tmp.max,MAR.tmp.max,APR.tmp.max,MAY.tmp.max,JUN.tmp.max,JUL.tmp.max,+
                         AUG.tmp.max,SEP.tmp.max,OCT.tmp.max,NOV.tmp.max,DEC.tmp.max)

plot(tmp.by.month.max, ylab='monthly max temperature [C]',xlab='month')
################################
# Next, min temperature...
################################
JAN.ought <- vector('list', 3)
names(JAN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "tmp") [,5,8]
  JAN.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(JAN.ought) <- sprintf("tmp.200%s.jan", names(JAN.ought))

JAN.teen <- vector('list', 10)
names(JAN.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "tmp") [,5,8]
  JAN.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(JAN.teen) <- sprintf("tmp.20%s.jan", names(JAN.teen))

# february
FEB.ought <- vector('list', 3)
names(FEB.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "tmp") [,5,8]
  FEB.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(FEB.ought) <- sprintf("tmp.200%s.feb", names(FEB.ought))

FEB.teen <- vector('list', 10)
names(FEB.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "tmp") [,5,8]
  FEB.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(FEB.teen) <- sprintf("tmp.20%s.feb", names(FEB.teen))

# march
MAR.ought <- vector('list', 3)
names(MAR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "tmp") [,5,8]
  MAR.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(MAR.ought) <- sprintf("tmp.200%s.mar", names(MAR.ought))

MAR.teen <- vector('list', 10)
names(MAR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "tmp") [,5,8]
  MAR.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(MAR.teen) <- sprintf("tmp.20%s.mar", names(MAR.teen))

# april
APR.ought <- vector('list', 3)
names(APR.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "tmp") [,5,8]
  APR.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(APR.ought) <- sprintf("tmp.200%s.apr", names(APR.ought))

APR.teen <- vector('list', 10)
names(APR.teen) <- 10:19
for (i in 10:19)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "tmp") [,5,8]
  APR.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(APR.teen) <- sprintf("tmp.20%s.apr", names(APR.teen))

# may
MAY.ought <- vector('list', 3)
names(MAY.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "tmp") [,5,8]
  MAY.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(MAY.ought) <- sprintf("tmp.200%s.may", names(MAY.ought))

MAY.teen <- vector('list', 9)
names(MAY.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "tmp") [,5,8]
  MAY.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(MAY.teen) <- sprintf("tmp.20%s.may", names(MAY.teen))

# june
JUN.ought <- vector('list', 3)
names(JUN.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "tmp") [,5,8]
  JUN.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(JUN.ought) <- sprintf("tmp.200%s.jun", names(JUN.ought))

JUN.teen <- vector('list', 9)
names(JUN.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "tmp") [,5,8]
  JUN.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(JUN.teen) <- sprintf("tmp.20%s.jun", names(JUN.teen))

# july
JUL.ought <- vector('list', 3)
names(JUL.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "tmp") [,5,8]
  JUL.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(JUL.ought) <- sprintf("tmp.200%s.jul", names(JUL.ought))

JUL.teen <- vector('list', 9)
names(JUL.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "tmp") [,5,8]
  JUL.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(JUL.teen) <- sprintf("tmp.20%s.jul", names(JUL.teen))

# august
AUG.ought <- vector('list', 3)
names(AUG.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "tmp") [,5,8]
  AUG.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(AUG.ought) <- sprintf("tmp.200%s.aug", names(AUG.ought))

AUG.teen <- vector('list', 9)
names(AUG.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "tmp") [,5,8]
  AUG.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(AUG.teen) <- sprintf("tmp.20%s.aug", names(AUG.teen))

# september
SEP.ought <- vector('list', 3)
names(SEP.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "tmp") [,5,8]
  SEP.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(SEP.ought) <- sprintf("tmp.200%s.sep", names(SEP.ought))

SEP.teen <- vector('list', 9)
names(SEP.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "tmp") [,5,8]
  SEP.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(SEP.teen) <- sprintf("tmp.20%s.sep", names(SEP.teen))

# october
OCT.ought <- vector('list', 3)
names(OCT.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "tmp") [,5,8]
  OCT.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(OCT.ought) <- sprintf("tmp.200%s.oct", names(OCT.ought))

OCT.teen <- vector('list', 9)
names(OCT.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "tmp") [,5,8]
  OCT.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(OCT.teen) <- sprintf("tmp.20%s.oct", names(OCT.teen))

# november
NOV.ought <- vector('list', 3)
names(NOV.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "tmp") [,5,8]
  NOV.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(NOV.ought) <- sprintf("tmp.200%s.nov", names(NOV.ought))

NOV.teen <- vector('list', 9)
names(NOV.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "tmp") [,5,8]
  NOV.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(NOV.teen) <- sprintf("tmp.20%s.nov", names(NOV.teen))

# december.
DEC.ought <- vector('list', 3)
names(DEC.ought) <- 7:9
for (i in 7:9)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "tmp") [,5,8]
  DEC.ought[[as.character(i)]] <- min(tmp)-273.15
}
names(DEC.ought) <- sprintf("tmp.200%s.dec", names(DEC.ought))

DEC.teen <- vector('list', 9)
names(DEC.teen) <- 10:18
for (i in 10:18)
{
  tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "tmp") [,5,8]
  DEC.teen[[as.character(i)]] <- min(tmp)-273.15
}
names(DEC.teen) <- sprintf("tmp.20%s.dec", names(DEC.teen))

JAN.tmp.min <- min(JAN.ought$tmp.2007.jan,JAN.ought$tmp.2008.jan,JAN.ought$tmp.2009.jan,+
                     JAN.teen$tmp.2010.jan,JAN.teen$tmp.2011.jan,JAN.teen$tmp.2012.jan,+
                     JAN.teen$tmp.2013.jan,JAN.teen$tmp.2014.jan,JAN.teen$tmp.2015.jan,+
                     JAN.teen$tmp.2016.jan,JAN.teen$tmp.2017.jan,JAN.teen$tmp.2018.jan,JAN.teen$tmp.2019.jan)
FEB.tmp.min <- min(FEB.ought$tmp.2007.feb,FEB.ought$tmp.2008.feb,FEB.ought$tmp.2009.feb,+
                     FEB.teen$tmp.2010.feb,FEB.teen$tmp.2011.feb,FEB.teen$tmp.2012.feb,+
                     FEB.teen$tmp.2013.feb,FEB.teen$tmp.2014.feb,FEB.teen$tmp.2015.feb,+
                     FEB.teen$tmp.2016.feb,FEB.teen$tmp.2017.feb,FEB.teen$tmp.2018.feb,FEB.teen$tmp.2019.feb)
MAR.tmp.min <- min(MAR.ought$tmp.2007.mar,MAR.ought$tmp.2008.mar,MAR.ought$tmp.2009.mar,+
                     MAR.teen$tmp.2010.mar,MAR.teen$tmp.2011.mar,MAR.teen$tmp.2012.mar,+
                     MAR.teen$tmp.2013.mar,MAR.teen$tmp.2014.mar,MAR.teen$tmp.2015.mar,+
                     MAR.teen$tmp.2016.mar,MAR.teen$tmp.2017.mar,MAR.teen$tmp.2018.mar,MAR.teen$tmp.2019.mar)
APR.tmp.min <- min(APR.ought$tmp.2007.apr,APR.ought$tmp.2008.apr,APR.ought$tmp.2009.apr,+
                     APR.teen$tmp.2010.apr,APR.teen$tmp.2011.apr,APR.teen$tmp.2012.apr,+
                     APR.teen$tmp.2013.apr,APR.teen$tmp.2014.apr,APR.teen$tmp.2015.apr,+
                     APR.teen$tmp.2016.apr,APR.teen$tmp.2017.apr,APR.teen$tmp.2018.apr,APR.teen$tmp.2019.apr)
MAY.tmp.min <- min(MAY.ought$tmp.2007.may,MAY.ought$tmp.2008.may,MAY.ought$tmp.2009.may,+
                     MAY.teen$tmp.2010.may,MAY.teen$tmp.2011.may,MAY.teen$tmp.2012.may,+
                     MAY.teen$tmp.2013.may,MAY.teen$tmp.2014.may,MAY.teen$tmp.2015.may,+
                     MAY.teen$tmp.2016.may,MAY.teen$tmp.2017.may,MAY.teen$tmp.2018.may)
JUN.tmp.min <- min(JUN.ought$tmp.2007.jun,JUN.ought$tmp.2008.jun,JUN.ought$tmp.2009.jun,+
                     JUN.teen$tmp.2010.jun,JUN.teen$tmp.2011.jun,JUN.teen$tmp.2012.jun,+
                     JUN.teen$tmp.2013.jun,JUN.teen$tmp.2014.jun,JUN.teen$tmp.2015.jun,+
                     JUN.teen$tmp.2016.jun,JUN.teen$tmp.2017.jun,JUN.teen$tmp.2018.jun)
JUL.tmp.min <- min(JUL.ought$tmp.2007.jul,JUL.ought$tmp.2008.jul,JUL.ought$tmp.2009.jul,+
                      JUL.teen$tmp.2010.jul,JUL.teen$tmp.2011.jul,JUL.teen$tmp.2012.jul,+
                      JUL.teen$tmp.2013.jul,JUL.teen$tmp.2014.jul,JUL.teen$tmp.2015.jul,+
                      JUL.teen$tmp.2016.jul,JUL.teen$tmp.2017.jul,JUL.teen$tmp.2018.jul)
AUG.tmp.min <- min(AUG.ought$tmp.2007.aug,AUG.ought$tmp.2008.aug,AUG.ought$tmp.2009.aug,+
                     AUG.teen$tmp.2010.aug,AUG.teen$tmp.2011.aug,AUG.teen$tmp.2012.aug,+
                     AUG.teen$tmp.2013.aug,AUG.teen$tmp.2014.aug,AUG.teen$tmp.2015.aug,+
                     AUG.teen$tmp.2016.aug,AUG.teen$tmp.2017.aug,AUG.teen$tmp.2018.aug)
SEP.tmp.min <- min(SEP.ought$tmp.2007.sep,SEP.ought$tmp.2008.sep,SEP.ought$tmp.2009.sep,+
                     SEP.teen$tmp.2010.sep,SEP.teen$tmp.2011.sep,SEP.teen$tmp.2012.sep,+
                     SEP.teen$tmp.2013.sep,SEP.teen$tmp.2014.sep,SEP.teen$tmp.2015.sep,+
                     SEP.teen$tmp.2016.sep,SEP.teen$tmp.2017.sep,SEP.teen$tmp.2018.sep)
OCT.tmp.min <- min(OCT.ought$tmp.2007.oct,OCT.ought$tmp.2008.oct,OCT.ought$tmp.2009.oct,+
                     OCT.teen$tmp.2010.oct,OCT.teen$tmp.2011.oct,OCT.teen$tmp.2012.oct,+
                     OCT.teen$tmp.2013.oct,OCT.teen$tmp.2014.oct,OCT.teen$tmp.2015.oct,+
                     OCT.teen$tmp.2016.oct,OCT.teen$tmp.2017.oct,OCT.teen$tmp.2018.oct)
NOV.tmp.min <- min(NOV.ought$tmp.2007.nov,NOV.ought$tmp.2008.nov,NOV.ought$tmp.2009.nov,+
                     NOV.teen$tmp.2010.nov,NOV.teen$tmp.2011.nov,NOV.teen$tmp.2012.nov,+
                     NOV.teen$tmp.2013.nov,NOV.teen$tmp.2014.nov,NOV.teen$tmp.2015.nov,+
                     NOV.teen$tmp.2016.nov,NOV.teen$tmp.2017.nov,NOV.teen$tmp.2018.nov)
DEC.tmp.min <- min(DEC.ought$tmp.2007.dec,DEC.ought$tmp.2008.dec,DEC.ought$tmp.2009.dec,+
                     DEC.teen$tmp.2010.dec,DEC.teen$tmp.2011.dec,DEC.teen$tmp.2012.dec,+
                     DEC.teen$tmp.2013.dec,DEC.teen$tmp.2014.dec,DEC.teen$tmp.2015.dec,+
                     DEC.teen$tmp.2016.dec,DEC.teen$tmp.2017.dec,DEC.teen$tmp.2018.dec)

tmp.by.month.min <- c(JAN.tmp.min,FEB.tmp.min,MAR.tmp.min,APR.tmp.min,MAY.tmp.min,JUN.tmp.min,JUL.tmp.min,+
                        AUG.tmp.min,SEP.tmp.min,OCT.tmp.min,NOV.tmp.min,DEC.tmp.min)

plot(tmp.by.month.min, xlab='month',ylab='monthly minimum temperature [C]')
################################
# Mean Irradiance [W/m^2]
# combine all values of incoming shortwave
################################
# january
JAN.nbdsf.ought <- vector('list', 3)
JAN.nddsf.ought <- vector('list', 3)
JAN.vbdsf.ought <- vector('list', 3)
JAN.vddsf.ought <- vector('list', 3)
names(JAN.nbdsf.ought) <- 7:9
names(JAN.nddsf.ought) <- 7:9
names(JAN.vbdsf.ought) <- 7:9
names(JAN.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nddsf") [,5,8]
  JAN.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vddsf") [,5,8]
  JAN.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(JAN.nbdsf.ought) <- sprintf("nbdsf.200%s.jan", names(JAN.nbdsf.ought))
names(JAN.nddsf.ought) <- sprintf("nddsf.200%s.jan", names(JAN.nddsf.ought))
names(JAN.vbdsf.ought) <- sprintf("vbdsf.200%s.jan", names(JAN.vbdsf.ought))
names(JAN.vddsf.ought) <- sprintf("vddsf.200%s.jan", names(JAN.vddsf.ought))

JAN.nbdsf.teen <- vector('list', 10)
JAN.nddsf.teen <- vector('list', 10)
JAN.vbdsf.teen <- vector('list', 10)
JAN.vddsf.teen <- vector('list', 10)
names(JAN.nbdsf.teen) <- 10:19
names(JAN.nddsf.teen) <- 10:19
names(JAN.vbdsf.teen) <- 10:19
names(JAN.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nddsf") [,5,8]
  JAN.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vddsf") [,5,8]
  JAN.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(JAN.nbdsf.teen) <- sprintf("nbdsf.20%s.jan", names(JAN.nbdsf.teen))
names(JAN.nddsf.teen) <- sprintf("nddsf.20%s.jan", names(JAN.nddsf.teen))
names(JAN.vbdsf.teen) <- sprintf("vbdsf.20%s.jan", names(JAN.vbdsf.teen))
names(JAN.vddsf.teen) <- sprintf("vddsf.20%s.jan", names(JAN.vddsf.teen))

JAN.mean.irrad <- sum(
  mean(JAN.nbdsf.ought$nbdsf.2007.jan,JAN.nbdsf.ought$nbdsf.2008.jan,JAN.nbdsf.ought$nbdsf.2009.jan,+
         JAN.nbdsf.teen$nbdsf.2010.jan,JAN.nbdsf.teen$nbdsf.2011.jan,JAN.nbdsf.teen$nbdsf.2012.jan,+
         JAN.nbdsf.teen$nbdsf.2013.jan,JAN.nbdsf.teen$nbdsf.2014.jan,JAN.nbdsf.teen$nbdsf.2015.jan,+
         JAN.nbdsf.teen$nbdsf.2016.jan,JAN.nbdsf.teen$nbdsf.2017.jan,JAN.nbdsf.teen$nbdsf.2018.jan,JAN.nbdsf.teen$nbdsf.2019.jan),
  mean(JAN.nddsf.ought$nddsf.2007.jan,JAN.nddsf.ought$nddsf.2008.jan,JAN.nddsf.ought$nddsf.2009.jan,+
         JAN.nddsf.teen$nddsf.2010.jan,JAN.nddsf.teen$nddsf.2011.jan,JAN.nddsf.teen$nddsf.2012.jan,+
         JAN.nddsf.teen$nddsf.2013.jan,JAN.nddsf.teen$nddsf.2014.jan,JAN.nddsf.teen$nddsf.2015.jan,+
         JAN.nddsf.teen$nddsf.2016.jan,JAN.nddsf.teen$nddsf.2017.jan,JAN.nddsf.teen$nddsf.2018.jan,JAN.nddsf.teen$nddsf.2019.jan),
  mean(JAN.vbdsf.ought$vbdsf.2007.jan,JAN.vbdsf.ought$vbdsf.2008.jan,JAN.vbdsf.ought$vbdsf.2009.jan,+
         JAN.vbdsf.teen$vbdsf.2010.jan,JAN.vbdsf.teen$vbdsf.2011.jan,JAN.vbdsf.teen$vbdsf.2012.jan,+
         JAN.vbdsf.teen$vbdsf.2013.jan,JAN.vbdsf.teen$vbdsf.2014.jan,JAN.vbdsf.teen$vbdsf.2015.jan,+
         JAN.vbdsf.teen$vbdsf.2016.jan,JAN.vbdsf.teen$vbdsf.2017.jan,JAN.vbdsf.teen$vbdsf.2018.jan,JAN.vbdsf.teen$vbdsf.2019.jan),
  mean(JAN.vddsf.ought$vddsf.2007.jan,JAN.vddsf.ought$vddsf.2008.jan,JAN.vddsf.ought$vddsf.2009.jan,+
         JAN.vddsf.teen$vddsf.2010.jan,JAN.vddsf.teen$vddsf.2011.jan,JAN.vddsf.teen$vddsf.2012.jan,+
         JAN.vddsf.teen$vddsf.2013.jan,JAN.vddsf.teen$vddsf.2014.jan,JAN.vddsf.teen$vddsf.2015.jan,+
         JAN.vddsf.teen$vddsf.2016.jan,JAN.vddsf.teen$vddsf.2017.jan,JAN.vddsf.teen$vddsf.2018.jan,JAN.vddsf.teen$vddsf.2019.jan)
)

# february
FEB.nbdsf.ought <- vector('list', 3)
FEB.nddsf.ought <- vector('list', 3)
FEB.vbdsf.ought <- vector('list', 3)
FEB.vddsf.ought <- vector('list', 3)
names(FEB.nbdsf.ought) <- 7:9
names(FEB.nddsf.ought) <- 7:9
names(FEB.vbdsf.ought) <- 7:9
names(FEB.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nddsf") [,5,8]
  FEB.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vddsf") [,5,8]
  FEB.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(FEB.nbdsf.ought) <- sprintf("nbdsf.200%s.feb", names(FEB.nbdsf.ought))
names(FEB.nddsf.ought) <- sprintf("nddsf.200%s.feb", names(FEB.nddsf.ought))
names(FEB.vbdsf.ought) <- sprintf("vbdsf.200%s.feb", names(FEB.vbdsf.ought))
names(FEB.vddsf.ought) <- sprintf("vddsf.200%s.feb", names(FEB.vddsf.ought))

FEB.nbdsf.teen <- vector('list', 10)
FEB.nddsf.teen <- vector('list', 10)
FEB.vbdsf.teen <- vector('list', 10)
FEB.vddsf.teen <- vector('list', 10)
names(FEB.nbdsf.teen) <- 10:19
names(FEB.nddsf.teen) <- 10:19
names(FEB.vbdsf.teen) <- 10:19
names(FEB.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nddsf") [,5,8]
  FEB.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vddsf") [,5,8]
  FEB.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(FEB.nbdsf.teen) <- sprintf("nbdsf.20%s.feb", names(FEB.nbdsf.teen))
names(FEB.nddsf.teen) <- sprintf("nddsf.20%s.feb", names(FEB.nddsf.teen))
names(FEB.vbdsf.teen) <- sprintf("vbdsf.20%s.feb", names(FEB.vbdsf.teen))
names(FEB.vddsf.teen) <- sprintf("vddsf.20%s.feb", names(FEB.vddsf.teen))

FEB.mean.irrad <- sum(
  mean(FEB.nbdsf.ought$nbdsf.2007.feb,FEB.nbdsf.ought$nbdsf.2008.feb,FEB.nbdsf.ought$nbdsf.2009.feb,+
         FEB.nbdsf.teen$nbdsf.2010.feb,FEB.nbdsf.teen$nbdsf.2011.feb,FEB.nbdsf.teen$nbdsf.2012.feb,+
         FEB.nbdsf.teen$nbdsf.2013.feb,FEB.nbdsf.teen$nbdsf.2014.feb,FEB.nbdsf.teen$nbdsf.2015.feb,+
         FEB.nbdsf.teen$nbdsf.2016.feb,FEB.nbdsf.teen$nbdsf.2017.feb,FEB.nbdsf.teen$nbdsf.2018.feb,FEB.nbdsf.teen$nbdsf.2019.feb),
  mean(FEB.nddsf.ought$nddsf.2007.feb,FEB.nddsf.ought$nddsf.2008.feb,FEB.nddsf.ought$nddsf.2009.feb,+
         FEB.nddsf.teen$nddsf.2010.feb,FEB.nddsf.teen$nddsf.2011.feb,FEB.nddsf.teen$nddsf.2012.feb,+
         FEB.nddsf.teen$nddsf.2013.feb,FEB.nddsf.teen$nddsf.2014.feb,FEB.nddsf.teen$nddsf.2015.feb,+
         FEB.nddsf.teen$nddsf.2016.feb,FEB.nddsf.teen$nddsf.2017.feb,FEB.nddsf.teen$nddsf.2018.feb,FEB.nddsf.teen$nddsf.2019.feb),
  mean(FEB.vbdsf.ought$vbdsf.2007.feb,FEB.vbdsf.ought$vbdsf.2008.feb,FEB.vbdsf.ought$vbdsf.2009.feb,+
         FEB.vbdsf.teen$vbdsf.2010.feb,FEB.vbdsf.teen$vbdsf.2011.feb,FEB.vbdsf.teen$vbdsf.2012.feb,+
         FEB.vbdsf.teen$vbdsf.2013.feb,FEB.vbdsf.teen$vbdsf.2014.feb,FEB.vbdsf.teen$vbdsf.2015.feb,+
         FEB.vbdsf.teen$vbdsf.2016.feb,FEB.vbdsf.teen$vbdsf.2017.feb,FEB.vbdsf.teen$vbdsf.2018.feb,FEB.vbdsf.teen$vbdsf.2019.feb),
  mean(FEB.vddsf.ought$vddsf.2007.feb,FEB.vddsf.ought$vddsf.2008.feb,FEB.vddsf.ought$vddsf.2009.feb,+
         FEB.vddsf.teen$vddsf.2010.feb,FEB.vddsf.teen$vddsf.2011.feb,FEB.vddsf.teen$vddsf.2012.feb,+
         FEB.vddsf.teen$vddsf.2013.feb,FEB.vddsf.teen$vddsf.2014.feb,FEB.vddsf.teen$vddsf.2015.feb,+
         FEB.vddsf.teen$vddsf.2016.feb,FEB.vddsf.teen$vddsf.2017.feb,FEB.vddsf.teen$vddsf.2018.feb,FEB.vddsf.teen$vddsf.2019.feb)
)

# march
MAR.nbdsf.ought <- vector('list', 3)
MAR.nddsf.ought <- vector('list', 3)
MAR.vbdsf.ought <- vector('list', 3)
MAR.vddsf.ought <- vector('list', 3)
names(MAR.nbdsf.ought) <- 7:9
names(MAR.nddsf.ought) <- 7:9
names(MAR.vbdsf.ought) <- 7:9
names(MAR.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nddsf") [,5,8]
  MAR.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vddsf") [,5,8]
  MAR.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(MAR.nbdsf.ought) <- sprintf("nbdsf.200%s.mar", names(MAR.nbdsf.ought))
names(MAR.nddsf.ought) <- sprintf("nddsf.200%s.mar", names(MAR.nddsf.ought))
names(MAR.vbdsf.ought) <- sprintf("vbdsf.200%s.mar", names(MAR.vbdsf.ought))
names(MAR.vddsf.ought) <- sprintf("vddsf.200%s.mar", names(MAR.vddsf.ought))

MAR.nbdsf.teen <- vector('list', 10)
MAR.nddsf.teen <- vector('list', 10)
MAR.vbdsf.teen <- vector('list', 10)
MAR.vddsf.teen <- vector('list', 10)
names(MAR.nbdsf.teen) <- 10:19
names(MAR.nddsf.teen) <- 10:19
names(MAR.vbdsf.teen) <- 10:19
names(MAR.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nddsf") [,5,8]
  MAR.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vddsf") [,5,8]
  MAR.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(MAR.nbdsf.teen) <- sprintf("nbdsf.20%s.mar", names(MAR.nbdsf.teen))
names(MAR.nddsf.teen) <- sprintf("nddsf.20%s.mar", names(MAR.nddsf.teen))
names(MAR.vbdsf.teen) <- sprintf("vbdsf.20%s.mar", names(MAR.vbdsf.teen))
names(MAR.vddsf.teen) <- sprintf("vddsf.20%s.mar", names(MAR.vddsf.teen))

MAR.mean.irrad <- sum(
  mean(MAR.nbdsf.ought$nbdsf.2007.mar,MAR.nbdsf.ought$nbdsf.2008.mar,MAR.nbdsf.ought$nbdsf.2009.mar,+
         MAR.nbdsf.teen$nbdsf.2010.mar,MAR.nbdsf.teen$nbdsf.2011.mar,MAR.nbdsf.teen$nbdsf.2012.mar,+
         MAR.nbdsf.teen$nbdsf.2013.mar,MAR.nbdsf.teen$nbdsf.2014.mar,MAR.nbdsf.teen$nbdsf.2015.mar,+
         MAR.nbdsf.teen$nbdsf.2016.mar,MAR.nbdsf.teen$nbdsf.2017.mar,MAR.nbdsf.teen$nbdsf.2018.mar,MAR.nbdsf.teen$nbdsf.2019.mar),
  mean(MAR.nddsf.ought$nddsf.2007.mar,MAR.nddsf.ought$nddsf.2008.mar,MAR.nddsf.ought$nddsf.2009.mar,+
         MAR.nddsf.teen$nddsf.2010.mar,MAR.nddsf.teen$nddsf.2011.mar,MAR.nddsf.teen$nddsf.2012.mar,+
         MAR.nddsf.teen$nddsf.2013.mar,MAR.nddsf.teen$nddsf.2014.mar,MAR.nddsf.teen$nddsf.2015.mar,+
         MAR.nddsf.teen$nddsf.2016.mar,MAR.nddsf.teen$nddsf.2017.mar,MAR.nddsf.teen$nddsf.2018.mar,MAR.nddsf.teen$nddsf.2019.mar),
  mean(MAR.vbdsf.ought$vbdsf.2007.mar,MAR.vbdsf.ought$vbdsf.2008.mar,MAR.vbdsf.ought$vbdsf.2009.mar,+
         MAR.vbdsf.teen$vbdsf.2010.mar,MAR.vbdsf.teen$vbdsf.2011.mar,MAR.vbdsf.teen$vbdsf.2012.mar,+
         MAR.vbdsf.teen$vbdsf.2013.mar,MAR.vbdsf.teen$vbdsf.2014.mar,MAR.vbdsf.teen$vbdsf.2015.mar,+
         MAR.vbdsf.teen$vbdsf.2016.mar,MAR.vbdsf.teen$vbdsf.2017.mar,MAR.vbdsf.teen$vbdsf.2018.mar,MAR.vbdsf.teen$vbdsf.2019.mar),
  mean(MAR.vddsf.ought$vddsf.2007.mar,MAR.vddsf.ought$vddsf.2008.mar,MAR.vddsf.ought$vddsf.2009.mar,+
         MAR.vddsf.teen$vddsf.2010.mar,MAR.vddsf.teen$vddsf.2011.mar,MAR.vddsf.teen$vddsf.2012.mar,+
         MAR.vddsf.teen$vddsf.2013.mar,MAR.vddsf.teen$vddsf.2014.mar,MAR.vddsf.teen$vddsf.2015.mar,+
         MAR.vddsf.teen$vddsf.2016.mar,MAR.vddsf.teen$vddsf.2017.mar,MAR.vddsf.teen$vddsf.2018.mar,MAR.vddsf.teen$vddsf.2019.mar)
)

# april
APR.nbdsf.ought <- vector('list', 3)
APR.nddsf.ought <- vector('list', 3)
APR.vbdsf.ought <- vector('list', 3)
APR.vddsf.ought <- vector('list', 3)
names(APR.nbdsf.ought) <- 7:9
names(APR.nddsf.ought) <- 7:9
names(APR.vbdsf.ought) <- 7:9
names(APR.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nddsf") [,5,8]
  APR.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vddsf") [,5,8]
  APR.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(APR.nbdsf.ought) <- sprintf("nbdsf.200%s.apr", names(APR.nbdsf.ought))
names(APR.nddsf.ought) <- sprintf("nddsf.200%s.apr", names(APR.nddsf.ought))
names(APR.vbdsf.ought) <- sprintf("vbdsf.200%s.apr", names(APR.vbdsf.ought))
names(APR.vddsf.ought) <- sprintf("vddsf.200%s.apr", names(APR.vddsf.ought))

APR.nbdsf.teen <- vector('list', 10)
APR.nddsf.teen <- vector('list', 10)
APR.vbdsf.teen <- vector('list', 10)
APR.vddsf.teen <- vector('list', 10)
names(APR.nbdsf.teen) <- 10:19
names(APR.nddsf.teen) <- 10:19
names(APR.vbdsf.teen) <- 10:19
names(APR.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nddsf") [,5,8]
  APR.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vddsf") [,5,8]
  APR.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(APR.nbdsf.teen) <- sprintf("nbdsf.20%s.apr", names(APR.nbdsf.teen))
names(APR.nddsf.teen) <- sprintf("nddsf.20%s.apr", names(APR.nddsf.teen))
names(APR.vbdsf.teen) <- sprintf("vbdsf.20%s.apr", names(APR.vbdsf.teen))
names(APR.vddsf.teen) <- sprintf("vddsf.20%s.apr", names(APR.vddsf.teen))

APR.mean.irrad <- sum(
  mean(APR.nbdsf.ought$nbdsf.2007.apr,APR.nbdsf.ought$nbdsf.2008.apr,APR.nbdsf.ought$nbdsf.2009.apr,+
         APR.nbdsf.teen$nbdsf.2010.apr,APR.nbdsf.teen$nbdsf.2011.apr,APR.nbdsf.teen$nbdsf.2012.apr,+
         APR.nbdsf.teen$nbdsf.2013.apr,APR.nbdsf.teen$nbdsf.2014.apr,APR.nbdsf.teen$nbdsf.2015.apr,+
         APR.nbdsf.teen$nbdsf.2016.apr,APR.nbdsf.teen$nbdsf.2017.apr,APR.nbdsf.teen$nbdsf.2018.apr,APR.nbdsf.teen$nbdsf.2019.apr),
  mean(APR.nddsf.ought$nddsf.2007.apr,APR.nddsf.ought$nddsf.2008.apr,APR.nddsf.ought$nddsf.2009.apr,+
         APR.nddsf.teen$nddsf.2010.apr,APR.nddsf.teen$nddsf.2011.apr,APR.nddsf.teen$nddsf.2012.apr,+
         APR.nddsf.teen$nddsf.2013.apr,APR.nddsf.teen$nddsf.2014.apr,APR.nddsf.teen$nddsf.2015.apr,+
         APR.nddsf.teen$nddsf.2016.apr,APR.nddsf.teen$nddsf.2017.apr,APR.nddsf.teen$nddsf.2018.apr,APR.nddsf.teen$nddsf.2019.apr),
  mean(APR.vbdsf.ought$vbdsf.2007.apr,APR.vbdsf.ought$vbdsf.2008.apr,APR.vbdsf.ought$vbdsf.2009.apr,+
         APR.vbdsf.teen$vbdsf.2010.apr,APR.vbdsf.teen$vbdsf.2011.apr,APR.vbdsf.teen$vbdsf.2012.apr,+
         APR.vbdsf.teen$vbdsf.2013.apr,APR.vbdsf.teen$vbdsf.2014.apr,APR.vbdsf.teen$vbdsf.2015.apr,+
         APR.vbdsf.teen$vbdsf.2016.apr,APR.vbdsf.teen$vbdsf.2017.apr,APR.vbdsf.teen$vbdsf.2018.apr,APR.vbdsf.teen$vbdsf.2019.apr),
  mean(APR.vddsf.ought$vddsf.2007.apr,APR.vddsf.ought$vddsf.2008.apr,APR.vddsf.ought$vddsf.2009.apr,+
         APR.vddsf.teen$vddsf.2010.apr,APR.vddsf.teen$vddsf.2011.apr,APR.vddsf.teen$vddsf.2012.apr,+
         APR.vddsf.teen$vddsf.2013.apr,APR.vddsf.teen$vddsf.2014.apr,APR.vddsf.teen$vddsf.2015.apr,+
         APR.vddsf.teen$vddsf.2016.apr,APR.vddsf.teen$vddsf.2017.apr,APR.vddsf.teen$vddsf.2018.apr,APR.vddsf.teen$vddsf.2019.apr)
)

# may
MAY.nbdsf.ought <- vector('list', 3)
MAY.nddsf.ought <- vector('list', 3)
MAY.vbdsf.ought <- vector('list', 3)
MAY.vddsf.ought <- vector('list', 3)
names(MAY.nbdsf.ought) <- 7:9
names(MAY.nddsf.ought) <- 7:9
names(MAY.vbdsf.ought) <- 7:9
names(MAY.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nddsf") [,5,8]
  MAY.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vddsf") [,5,8]
  MAY.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(MAY.nbdsf.ought) <- sprintf("nbdsf.200%s.may", names(MAY.nbdsf.ought))
names(MAY.nddsf.ought) <- sprintf("nddsf.200%s.may", names(MAY.nddsf.ought))
names(MAY.vbdsf.ought) <- sprintf("vbdsf.200%s.may", names(MAY.vbdsf.ought))
names(MAY.vddsf.ought) <- sprintf("vddsf.200%s.may", names(MAY.vddsf.ought))

MAY.nbdsf.teen <- vector('list', 9)
MAY.nddsf.teen <- vector('list', 9)
MAY.vbdsf.teen <- vector('list', 9)
MAY.vddsf.teen <- vector('list', 9)
names(MAY.nbdsf.teen) <- 10:18
names(MAY.nddsf.teen) <- 10:18
names(MAY.vbdsf.teen) <- 10:18
names(MAY.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nddsf") [,5,8]
  MAY.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vddsf") [,5,8]
  MAY.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(MAY.nbdsf.teen) <- sprintf("nbdsf.20%s.may", names(MAY.nbdsf.teen))
names(MAY.nddsf.teen) <- sprintf("nddsf.20%s.may", names(MAY.nddsf.teen))
names(MAY.vbdsf.teen) <- sprintf("vbdsf.20%s.may", names(MAY.vbdsf.teen))
names(MAY.vddsf.teen) <- sprintf("vddsf.20%s.may", names(MAY.vddsf.teen))

MAY.mean.irrad <- sum(
  mean(MAY.nbdsf.ought$nbdsf.2007.may,MAY.nbdsf.ought$nbdsf.2008.may,MAY.nbdsf.ought$nbdsf.2009.may,+
         MAY.nbdsf.teen$nbdsf.2010.may,MAY.nbdsf.teen$nbdsf.2011.may,MAY.nbdsf.teen$nbdsf.2012.may,+
         MAY.nbdsf.teen$nbdsf.2013.may,MAY.nbdsf.teen$nbdsf.2014.may,MAY.nbdsf.teen$nbdsf.2015.may,+
         MAY.nbdsf.teen$nbdsf.2016.may,MAY.nbdsf.teen$nbdsf.2017.may,MAY.nbdsf.teen$nbdsf.2018.may),
  mean(MAY.nddsf.ought$nddsf.2007.may,MAY.nddsf.ought$nddsf.2008.may,MAY.nddsf.ought$nddsf.2009.may,+
         MAY.nddsf.teen$nddsf.2010.may,MAY.nddsf.teen$nddsf.2011.may,MAY.nddsf.teen$nddsf.2012.may,+
         MAY.nddsf.teen$nddsf.2013.may,MAY.nddsf.teen$nddsf.2014.may,MAY.nddsf.teen$nddsf.2015.may,+
         MAY.nddsf.teen$nddsf.2016.may,MAY.nddsf.teen$nddsf.2017.may,MAY.nddsf.teen$nddsf.2018.may),
  mean(MAY.vbdsf.ought$vbdsf.2007.may,MAY.vbdsf.ought$vbdsf.2008.may,MAY.vbdsf.ought$vbdsf.2009.may,+
         MAY.vbdsf.teen$vbdsf.2010.may,MAY.vbdsf.teen$vbdsf.2011.may,MAY.vbdsf.teen$vbdsf.2012.may,+
         MAY.vbdsf.teen$vbdsf.2013.may,MAY.vbdsf.teen$vbdsf.2014.may,MAY.vbdsf.teen$vbdsf.2015.may,+
         MAY.vbdsf.teen$vbdsf.2016.may,MAY.vbdsf.teen$vbdsf.2017.may,MAY.vbdsf.teen$vbdsf.2018.may),
  mean(MAY.vddsf.ought$vddsf.2007.may,MAY.vddsf.ought$vddsf.2008.may,MAY.vddsf.ought$vddsf.2009.may,+
         MAY.vddsf.teen$vddsf.2010.may,MAY.vddsf.teen$vddsf.2011.may,MAY.vddsf.teen$vddsf.2012.may,+
         MAY.vddsf.teen$vddsf.2013.may,MAY.vddsf.teen$vddsf.2014.may,MAY.vddsf.teen$vddsf.2015.may,+
         MAY.vddsf.teen$vddsf.2016.may,MAY.vddsf.teen$vddsf.2017.may,MAY.vddsf.teen$vddsf.2018.may)
)

# june
JUN.nbdsf.ought <- vector('list', 3)
JUN.nddsf.ought <- vector('list', 3)
JUN.vbdsf.ought <- vector('list', 3)
JUN.vddsf.ought <- vector('list', 3)
names(JUN.nbdsf.ought) <- 7:9
names(JUN.nddsf.ought) <- 7:9
names(JUN.vbdsf.ought) <- 7:9
names(JUN.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nddsf") [,5,8]
  JUN.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vddsf") [,5,8]
  JUN.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(JUN.nbdsf.ought) <- sprintf("nbdsf.200%s.jun", names(JUN.nbdsf.ought))
names(JUN.nddsf.ought) <- sprintf("nddsf.200%s.jun", names(JUN.nddsf.ought))
names(JUN.vbdsf.ought) <- sprintf("vbdsf.200%s.jun", names(JUN.vbdsf.ought))
names(JUN.vddsf.ought) <- sprintf("vddsf.200%s.jun", names(JUN.vddsf.ought))

JUN.nbdsf.teen <- vector('list', 9)
JUN.nddsf.teen <- vector('list', 9)
JUN.vbdsf.teen <- vector('list', 9)
JUN.vddsf.teen <- vector('list', 9)
names(JUN.nbdsf.teen) <- 10:18
names(JUN.nddsf.teen) <- 10:18
names(JUN.vbdsf.teen) <- 10:18
names(JUN.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nddsf") [,5,8]
  JUN.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vddsf") [,5,8]
  JUN.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(JUN.nbdsf.teen) <- sprintf("nbdsf.20%s.jun", names(JUN.nbdsf.teen))
names(JUN.nddsf.teen) <- sprintf("nddsf.20%s.jun", names(JUN.nddsf.teen))
names(JUN.vbdsf.teen) <- sprintf("vbdsf.20%s.jun", names(JUN.vbdsf.teen))
names(JUN.vddsf.teen) <- sprintf("vddsf.20%s.jun", names(JUN.vddsf.teen))

JUN.mean.irrad <- sum(
  mean(JUN.nbdsf.ought$nbdsf.2007.jun,JUN.nbdsf.ought$nbdsf.2008.jun,JUN.nbdsf.ought$nbdsf.2009.jun,+
         JUN.nbdsf.teen$nbdsf.2010.jun,JUN.nbdsf.teen$nbdsf.2011.jun,JUN.nbdsf.teen$nbdsf.2012.jun,+
         JUN.nbdsf.teen$nbdsf.2013.jun,JUN.nbdsf.teen$nbdsf.2014.jun,JUN.nbdsf.teen$nbdsf.2015.jun,+
         JUN.nbdsf.teen$nbdsf.2016.jun,JUN.nbdsf.teen$nbdsf.2017.jun,JUN.nbdsf.teen$nbdsf.2018.jun),
  mean(JUN.nddsf.ought$nddsf.2007.jun,JUN.nddsf.ought$nddsf.2008.jun,JUN.nddsf.ought$nddsf.2009.jun,+
         JUN.nddsf.teen$nddsf.2010.jun,JUN.nddsf.teen$nddsf.2011.jun,JUN.nddsf.teen$nddsf.2012.jun,+
         JUN.nddsf.teen$nddsf.2013.jun,JUN.nddsf.teen$nddsf.2014.jun,JUN.nddsf.teen$nddsf.2015.jun,+
         JUN.nddsf.teen$nddsf.2016.jun,JUN.nddsf.teen$nddsf.2017.jun,JUN.nddsf.teen$nddsf.2018.jun),
  mean(JUN.vbdsf.ought$vbdsf.2007.jun,JUN.vbdsf.ought$vbdsf.2008.jun,JUN.vbdsf.ought$vbdsf.2009.jun,+
         JUN.vbdsf.teen$vbdsf.2010.jun,JUN.vbdsf.teen$vbdsf.2011.jun,JUN.vbdsf.teen$vbdsf.2012.jun,+
         JUN.vbdsf.teen$vbdsf.2013.jun,JUN.vbdsf.teen$vbdsf.2014.jun,JUN.vbdsf.teen$vbdsf.2015.jun,+
         JUN.vbdsf.teen$vbdsf.2016.jun,JUN.vbdsf.teen$vbdsf.2017.jun,JUN.vbdsf.teen$vbdsf.2018.jun),
  mean(JUN.vddsf.ought$vddsf.2007.jun,JUN.vddsf.ought$vddsf.2008.jun,JUN.vddsf.ought$vddsf.2009.jun,+
         JUN.vddsf.teen$vddsf.2010.jun,JUN.vddsf.teen$vddsf.2011.jun,JUN.vddsf.teen$vddsf.2012.jun,+
         JUN.vddsf.teen$vddsf.2013.jun,JUN.vddsf.teen$vddsf.2014.jun,JUN.vddsf.teen$vddsf.2015.jun,+
         JUN.vddsf.teen$vddsf.2016.jun,JUN.vddsf.teen$vddsf.2017.jun,JUN.vddsf.teen$vddsf.2018.jun)
)

# july
JUL.nbdsf.ought <- vector('list', 3)
JUL.nddsf.ought <- vector('list', 3)
JUL.vbdsf.ought <- vector('list', 3)
JUL.vddsf.ought <- vector('list', 3)
names(JUL.nbdsf.ought) <- 7:9
names(JUL.nddsf.ought) <- 7:9
names(JUL.vbdsf.ought) <- 7:9
names(JUL.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nddsf") [,5,8]
  JUL.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vddsf") [,5,8]
  JUL.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(JUL.nbdsf.ought) <- sprintf("nbdsf.200%s.jul", names(JUL.nbdsf.ought))
names(JUL.nddsf.ought) <- sprintf("nddsf.200%s.jul", names(JUL.nddsf.ought))
names(JUL.vbdsf.ought) <- sprintf("vbdsf.200%s.jul", names(JUL.vbdsf.ought))
names(JUL.vddsf.ought) <- sprintf("vddsf.200%s.jul", names(JUL.vddsf.ought))

JUL.nbdsf.teen <- vector('list', 9)
JUL.nddsf.teen <- vector('list', 9)
JUL.vbdsf.teen <- vector('list', 9)
JUL.vddsf.teen <- vector('list', 9)
names(JUL.nbdsf.teen) <- 10:18
names(JUL.nddsf.teen) <- 10:18
names(JUL.vbdsf.teen) <- 10:18
names(JUL.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nddsf") [,5,8]
  JUL.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vddsf") [,5,8]
  JUL.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(JUL.nbdsf.teen) <- sprintf("nbdsf.20%s.jul", names(JUL.nbdsf.teen))
names(JUL.nddsf.teen) <- sprintf("nddsf.20%s.jul", names(JUL.nddsf.teen))
names(JUL.vbdsf.teen) <- sprintf("vbdsf.20%s.jul", names(JUL.vbdsf.teen))
names(JUL.vddsf.teen) <- sprintf("vddsf.20%s.jul", names(JUL.vddsf.teen))

JUL.mean.irrad <- sum(
  mean(JUL.nbdsf.ought$nbdsf.2007.jul,JUL.nbdsf.ought$nbdsf.2008.jul,JUL.nbdsf.ought$nbdsf.2009.jul,+
         JUL.nbdsf.teen$nbdsf.2010.jul,JUL.nbdsf.teen$nbdsf.2011.jul,JUL.nbdsf.teen$nbdsf.2012.jul,+
         JUL.nbdsf.teen$nbdsf.2013.jul,JUL.nbdsf.teen$nbdsf.2014.jul,JUL.nbdsf.teen$nbdsf.2015.jul,+
         JUL.nbdsf.teen$nbdsf.2016.jul,JUL.nbdsf.teen$nbdsf.2017.jul,JUL.nbdsf.teen$nbdsf.2018.jul),
  mean(JUL.nddsf.ought$nddsf.2007.jul,JUL.nddsf.ought$nddsf.2008.jul,JUL.nddsf.ought$nddsf.2009.jul,+
         JUL.nddsf.teen$nddsf.2010.jul,JUL.nddsf.teen$nddsf.2011.jul,JUL.nddsf.teen$nddsf.2012.jul,+
         JUL.nddsf.teen$nddsf.2013.jul,JUL.nddsf.teen$nddsf.2014.jul,JUL.nddsf.teen$nddsf.2015.jul,+
         JUL.nddsf.teen$nddsf.2016.jul,JUL.nddsf.teen$nddsf.2017.jul,JUL.nddsf.teen$nddsf.2018.jul),
  mean(JUL.vbdsf.ought$vbdsf.2007.jul,JUL.vbdsf.ought$vbdsf.2008.jul,JUL.vbdsf.ought$vbdsf.2009.jul,+
         JUL.vbdsf.teen$vbdsf.2010.jul,JUL.vbdsf.teen$vbdsf.2011.jul,JUL.vbdsf.teen$vbdsf.2012.jul,+
         JUL.vbdsf.teen$vbdsf.2013.jul,JUL.vbdsf.teen$vbdsf.2014.jul,JUL.vbdsf.teen$vbdsf.2015.jul,+
         JUL.vbdsf.teen$vbdsf.2016.jul,JUL.vbdsf.teen$vbdsf.2017.jul,JUL.vbdsf.teen$vbdsf.2018.jul),
  mean(JUL.vddsf.ought$vddsf.2007.jul,JUL.vddsf.ought$vddsf.2008.jul,JUL.vddsf.ought$vddsf.2009.jul,+
         JUL.vddsf.teen$vddsf.2010.jul,JUL.vddsf.teen$vddsf.2011.jul,JUL.vddsf.teen$vddsf.2012.jul,+
         JUL.vddsf.teen$vddsf.2013.jul,JUL.vddsf.teen$vddsf.2014.jul,JUL.vddsf.teen$vddsf.2015.jul,+
         JUL.vddsf.teen$vddsf.2016.jul,JUL.vddsf.teen$vddsf.2017.jul,JUL.vddsf.teen$vddsf.2018.jul)
)

# august
AUG.nbdsf.ought <- vector('list', 3)
AUG.nddsf.ought <- vector('list', 3)
AUG.vbdsf.ought <- vector('list', 3)
AUG.vddsf.ought <- vector('list', 3)
names(AUG.nbdsf.ought) <- 7:9
names(AUG.nddsf.ought) <- 7:9
names(AUG.vbdsf.ought) <- 7:9
names(AUG.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nddsf") [,5,8]
  AUG.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vddsf") [,5,8]
  AUG.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(AUG.nbdsf.ought) <- sprintf("nbdsf.200%s.aug", names(AUG.nbdsf.ought))
names(AUG.nddsf.ought) <- sprintf("nddsf.200%s.aug", names(AUG.nddsf.ought))
names(AUG.vbdsf.ought) <- sprintf("vbdsf.200%s.aug", names(AUG.vbdsf.ought))
names(AUG.vddsf.ought) <- sprintf("vddsf.200%s.aug", names(AUG.vddsf.ought))

AUG.nbdsf.teen <- vector('list', 9)
AUG.nddsf.teen <- vector('list', 9)
AUG.vbdsf.teen <- vector('list', 9)
AUG.vddsf.teen <- vector('list', 9)
names(AUG.nbdsf.teen) <- 10:18
names(AUG.nddsf.teen) <- 10:18
names(AUG.vbdsf.teen) <- 10:18
names(AUG.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nddsf") [,5,8]
  AUG.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vddsf") [,5,8]
  AUG.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(AUG.nbdsf.teen) <- sprintf("nbdsf.20%s.aug", names(AUG.nbdsf.teen))
names(AUG.nddsf.teen) <- sprintf("nddsf.20%s.aug", names(AUG.nddsf.teen))
names(AUG.vbdsf.teen) <- sprintf("vbdsf.20%s.aug", names(AUG.vbdsf.teen))
names(AUG.vddsf.teen) <- sprintf("vddsf.20%s.aug", names(AUG.vddsf.teen))

AUG.mean.irrad <- sum(
  mean(AUG.nbdsf.ought$nbdsf.2007.aug,AUG.nbdsf.ought$nbdsf.2008.aug,AUG.nbdsf.ought$nbdsf.2009.aug,+
         AUG.nbdsf.teen$nbdsf.2010.aug,AUG.nbdsf.teen$nbdsf.2011.aug,AUG.nbdsf.teen$nbdsf.2012.aug,+
         AUG.nbdsf.teen$nbdsf.2013.aug,AUG.nbdsf.teen$nbdsf.2014.aug,AUG.nbdsf.teen$nbdsf.2015.aug,+
         AUG.nbdsf.teen$nbdsf.2016.aug,AUG.nbdsf.teen$nbdsf.2017.aug,AUG.nbdsf.teen$nbdsf.2018.aug),
  mean(AUG.nddsf.ought$nddsf.2007.aug,AUG.nddsf.ought$nddsf.2008.aug,AUG.nddsf.ought$nddsf.2009.aug,+
         AUG.nddsf.teen$nddsf.2010.aug,AUG.nddsf.teen$nddsf.2011.aug,AUG.nddsf.teen$nddsf.2012.aug,+
         AUG.nddsf.teen$nddsf.2013.aug,AUG.nddsf.teen$nddsf.2014.aug,AUG.nddsf.teen$nddsf.2015.aug,+
         AUG.nddsf.teen$nddsf.2016.aug,AUG.nddsf.teen$nddsf.2017.aug,AUG.nddsf.teen$nddsf.2018.aug),
  mean(AUG.vbdsf.ought$vbdsf.2007.aug,AUG.vbdsf.ought$vbdsf.2008.aug,AUG.vbdsf.ought$vbdsf.2009.aug,+
         AUG.vbdsf.teen$vbdsf.2010.aug,AUG.vbdsf.teen$vbdsf.2011.aug,AUG.vbdsf.teen$vbdsf.2012.aug,+
         AUG.vbdsf.teen$vbdsf.2013.aug,AUG.vbdsf.teen$vbdsf.2014.aug,AUG.vbdsf.teen$vbdsf.2015.aug,+
         AUG.vbdsf.teen$vbdsf.2016.aug,AUG.vbdsf.teen$vbdsf.2017.aug,AUG.vbdsf.teen$vbdsf.2018.aug),
  mean(AUG.vddsf.ought$vddsf.2007.aug,AUG.vddsf.ought$vddsf.2008.aug,AUG.vddsf.ought$vddsf.2009.aug,+
         AUG.vddsf.teen$vddsf.2010.aug,AUG.vddsf.teen$vddsf.2011.aug,AUG.vddsf.teen$vddsf.2012.aug,+
         AUG.vddsf.teen$vddsf.2013.aug,AUG.vddsf.teen$vddsf.2014.aug,AUG.vddsf.teen$vddsf.2015.aug,+
         AUG.vddsf.teen$vddsf.2016.aug,AUG.vddsf.teen$vddsf.2017.aug,AUG.vddsf.teen$vddsf.2018.aug)
)

# september
SEP.nbdsf.ought <- vector('list', 3)
SEP.nddsf.ought <- vector('list', 3)
SEP.vbdsf.ought <- vector('list', 3)
SEP.vddsf.ought <- vector('list', 3)
names(SEP.nbdsf.ought) <- 7:9
names(SEP.nddsf.ought) <- 7:9
names(SEP.vbdsf.ought) <- 7:9
names(SEP.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nddsf") [,5,8]
  SEP.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vddsf") [,5,8]
  SEP.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(SEP.nbdsf.ought) <- sprintf("nbdsf.200%s.sep", names(SEP.nbdsf.ought))
names(SEP.nddsf.ought) <- sprintf("nddsf.200%s.sep", names(SEP.nddsf.ought))
names(SEP.vbdsf.ought) <- sprintf("vbdsf.200%s.sep", names(SEP.vbdsf.ought))
names(SEP.vddsf.ought) <- sprintf("vddsf.200%s.sep", names(SEP.vddsf.ought))

SEP.nbdsf.teen <- vector('list', 9)
SEP.nddsf.teen <- vector('list', 9)
SEP.vbdsf.teen <- vector('list', 9)
SEP.vddsf.teen <- vector('list', 9)
names(SEP.nbdsf.teen) <- 10:18
names(SEP.nddsf.teen) <- 10:18
names(SEP.vbdsf.teen) <- 10:18
names(SEP.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nddsf") [,5,8]
  SEP.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vddsf") [,5,8]
  SEP.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(SEP.nbdsf.teen) <- sprintf("nbdsf.20%s.sep", names(SEP.nbdsf.teen))
names(SEP.nddsf.teen) <- sprintf("nddsf.20%s.sep", names(SEP.nddsf.teen))
names(SEP.vbdsf.teen) <- sprintf("vbdsf.20%s.sep", names(SEP.vbdsf.teen))
names(SEP.vddsf.teen) <- sprintf("vddsf.20%s.sep", names(SEP.vddsf.teen))

SEP.mean.irrad <- sum(
  mean(SEP.nbdsf.ought$nbdsf.2007.sep,SEP.nbdsf.ought$nbdsf.2008.sep,SEP.nbdsf.ought$nbdsf.2009.sep,+
         SEP.nbdsf.teen$nbdsf.2010.sep,SEP.nbdsf.teen$nbdsf.2011.sep,SEP.nbdsf.teen$nbdsf.2012.sep,+
         SEP.nbdsf.teen$nbdsf.2013.sep,SEP.nbdsf.teen$nbdsf.2014.sep,SEP.nbdsf.teen$nbdsf.2015.sep,+
         SEP.nbdsf.teen$nbdsf.2016.sep,SEP.nbdsf.teen$nbdsf.2017.sep,SEP.nbdsf.teen$nbdsf.2018.sep),
  mean(SEP.nddsf.ought$nddsf.2007.sep,SEP.nddsf.ought$nddsf.2008.sep,SEP.nddsf.ought$nddsf.2009.sep,+
         SEP.nddsf.teen$nddsf.2010.sep,SEP.nddsf.teen$nddsf.2011.sep,SEP.nddsf.teen$nddsf.2012.sep,+
         SEP.nddsf.teen$nddsf.2013.sep,SEP.nddsf.teen$nddsf.2014.sep,SEP.nddsf.teen$nddsf.2015.sep,+
         SEP.nddsf.teen$nddsf.2016.sep,SEP.nddsf.teen$nddsf.2017.sep,SEP.nddsf.teen$nddsf.2018.sep),
  mean(SEP.vbdsf.ought$vbdsf.2007.sep,SEP.vbdsf.ought$vbdsf.2008.sep,SEP.vbdsf.ought$vbdsf.2009.sep,+
         SEP.vbdsf.teen$vbdsf.2010.sep,SEP.vbdsf.teen$vbdsf.2011.sep,SEP.vbdsf.teen$vbdsf.2012.sep,+
         SEP.vbdsf.teen$vbdsf.2013.sep,SEP.vbdsf.teen$vbdsf.2014.sep,SEP.vbdsf.teen$vbdsf.2015.sep,+
         SEP.vbdsf.teen$vbdsf.2016.sep,SEP.vbdsf.teen$vbdsf.2017.sep,SEP.vbdsf.teen$vbdsf.2018.sep),
  mean(SEP.vddsf.ought$vddsf.2007.sep,SEP.vddsf.ought$vddsf.2008.sep,SEP.vddsf.ought$vddsf.2009.sep,+
         SEP.vddsf.teen$vddsf.2010.sep,SEP.vddsf.teen$vddsf.2011.sep,SEP.vddsf.teen$vddsf.2012.sep,+
         SEP.vddsf.teen$vddsf.2013.sep,SEP.vddsf.teen$vddsf.2014.sep,SEP.vddsf.teen$vddsf.2015.sep,+
         SEP.vddsf.teen$vddsf.2016.sep,SEP.vddsf.teen$vddsf.2017.sep,SEP.vddsf.teen$vddsf.2018.sep)
)

# october
OCT.nbdsf.ought <- vector('list', 3)
OCT.nddsf.ought <- vector('list', 3)
OCT.vbdsf.ought <- vector('list', 3)
OCT.vddsf.ought <- vector('list', 3)
names(OCT.nbdsf.ought) <- 7:9
names(OCT.nddsf.ought) <- 7:9
names(OCT.vbdsf.ought) <- 7:9
names(OCT.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nddsf") [,5,8]
  OCT.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vddsf") [,5,8]
  OCT.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(OCT.nbdsf.ought) <- sprintf("nbdsf.200%s.oct", names(OCT.nbdsf.ought))
names(OCT.nddsf.ought) <- sprintf("nddsf.200%s.oct", names(OCT.nddsf.ought))
names(OCT.vbdsf.ought) <- sprintf("vbdsf.200%s.oct", names(OCT.vbdsf.ought))
names(OCT.vddsf.ought) <- sprintf("vddsf.200%s.oct", names(OCT.vddsf.ought))

OCT.nbdsf.teen <- vector('list', 9)
OCT.nddsf.teen <- vector('list', 9)
OCT.vbdsf.teen <- vector('list', 9)
OCT.vddsf.teen <- vector('list', 9)
names(OCT.nbdsf.teen) <- 10:18
names(OCT.nddsf.teen) <- 10:18
names(OCT.vbdsf.teen) <- 10:18
names(OCT.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nddsf") [,5,8]
  OCT.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vddsf") [,5,8]
  OCT.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(OCT.nbdsf.teen) <- sprintf("nbdsf.20%s.oct", names(OCT.nbdsf.teen))
names(OCT.nddsf.teen) <- sprintf("nddsf.20%s.oct", names(OCT.nddsf.teen))
names(OCT.vbdsf.teen) <- sprintf("vbdsf.20%s.oct", names(OCT.vbdsf.teen))
names(OCT.vddsf.teen) <- sprintf("vddsf.20%s.oct", names(OCT.vddsf.teen))

OCT.mean.irrad <- sum(
  mean(OCT.nbdsf.ought$nbdsf.2007.oct,OCT.nbdsf.ought$nbdsf.2008.oct,OCT.nbdsf.ought$nbdsf.2009.oct,+
         OCT.nbdsf.teen$nbdsf.2010.oct,OCT.nbdsf.teen$nbdsf.2011.oct,OCT.nbdsf.teen$nbdsf.2012.oct,+
         OCT.nbdsf.teen$nbdsf.2013.oct,OCT.nbdsf.teen$nbdsf.2014.oct,OCT.nbdsf.teen$nbdsf.2015.oct,+
         OCT.nbdsf.teen$nbdsf.2016.oct,OCT.nbdsf.teen$nbdsf.2017.oct,OCT.nbdsf.teen$nbdsf.2018.oct),
  mean(OCT.nddsf.ought$nddsf.2007.oct,OCT.nddsf.ought$nddsf.2008.oct,OCT.nddsf.ought$nddsf.2009.oct,+
         OCT.nddsf.teen$nddsf.2010.oct,OCT.nddsf.teen$nddsf.2011.oct,OCT.nddsf.teen$nddsf.2012.oct,+
         OCT.nddsf.teen$nddsf.2013.oct,OCT.nddsf.teen$nddsf.2014.oct,OCT.nddsf.teen$nddsf.2015.oct,+
         OCT.nddsf.teen$nddsf.2016.oct,OCT.nddsf.teen$nddsf.2017.oct,OCT.nddsf.teen$nddsf.2018.oct),
  mean(OCT.vbdsf.ought$vbdsf.2007.oct,OCT.vbdsf.ought$vbdsf.2008.oct,OCT.vbdsf.ought$vbdsf.2009.oct,+
         OCT.vbdsf.teen$vbdsf.2010.oct,OCT.vbdsf.teen$vbdsf.2011.oct,OCT.vbdsf.teen$vbdsf.2012.oct,+
         OCT.vbdsf.teen$vbdsf.2013.oct,OCT.vbdsf.teen$vbdsf.2014.oct,OCT.vbdsf.teen$vbdsf.2015.oct,+
         OCT.vbdsf.teen$vbdsf.2016.oct,OCT.vbdsf.teen$vbdsf.2017.oct,OCT.vbdsf.teen$vbdsf.2018.oct),
  mean(OCT.vddsf.ought$vddsf.2007.oct,OCT.vddsf.ought$vddsf.2008.oct,OCT.vddsf.ought$vddsf.2009.oct,+
         OCT.vddsf.teen$vddsf.2010.oct,OCT.vddsf.teen$vddsf.2011.oct,OCT.vddsf.teen$vddsf.2012.oct,+
         OCT.vddsf.teen$vddsf.2013.oct,OCT.vddsf.teen$vddsf.2014.oct,OCT.vddsf.teen$vddsf.2015.oct,+
         OCT.vddsf.teen$vddsf.2016.oct,OCT.vddsf.teen$vddsf.2017.oct,OCT.vddsf.teen$vddsf.2018.oct)
)

# november
NOV.nbdsf.ought <- vector('list', 3)
NOV.nddsf.ought <- vector('list', 3)
NOV.vbdsf.ought <- vector('list', 3)
NOV.vddsf.ought <- vector('list', 3)
names(NOV.nbdsf.ought) <- 7:9
names(NOV.nddsf.ought) <- 7:9
names(NOV.vbdsf.ought) <- 7:9
names(NOV.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nddsf") [,5,8]
  NOV.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vddsf") [,5,8]
  NOV.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(NOV.nbdsf.ought) <- sprintf("nbdsf.200%s.nov", names(NOV.nbdsf.ought))
names(NOV.nddsf.ought) <- sprintf("nddsf.200%s.nov", names(NOV.nddsf.ought))
names(NOV.vbdsf.ought) <- sprintf("vbdsf.200%s.nov", names(NOV.vbdsf.ought))
names(NOV.vddsf.ought) <- sprintf("vddsf.200%s.nov", names(NOV.vddsf.ought))

NOV.nbdsf.teen <- vector('list', 9)
NOV.nddsf.teen <- vector('list', 9)
NOV.vbdsf.teen <- vector('list', 9)
NOV.vddsf.teen <- vector('list', 9)
names(NOV.nbdsf.teen) <- 10:18
names(NOV.nddsf.teen) <- 10:18
names(NOV.vbdsf.teen) <- 10:18
names(NOV.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nddsf") [,5,8]
  NOV.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vddsf") [,5,8]
  NOV.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(NOV.nbdsf.teen) <- sprintf("nbdsf.20%s.nov", names(NOV.nbdsf.teen))
names(NOV.nddsf.teen) <- sprintf("nddsf.20%s.nov", names(NOV.nddsf.teen))
names(NOV.vbdsf.teen) <- sprintf("vbdsf.20%s.nov", names(NOV.vbdsf.teen))
names(NOV.vddsf.teen) <- sprintf("vddsf.20%s.nov", names(NOV.vddsf.teen))

NOV.mean.irrad <- sum(
  mean(NOV.nbdsf.ought$nbdsf.2007.nov,NOV.nbdsf.ought$nbdsf.2008.nov,NOV.nbdsf.ought$nbdsf.2009.nov,+
         NOV.nbdsf.teen$nbdsf.2010.nov,NOV.nbdsf.teen$nbdsf.2011.nov,NOV.nbdsf.teen$nbdsf.2012.nov,+
         NOV.nbdsf.teen$nbdsf.2013.nov,NOV.nbdsf.teen$nbdsf.2014.nov,NOV.nbdsf.teen$nbdsf.2015.nov,+
         NOV.nbdsf.teen$nbdsf.2016.nov,NOV.nbdsf.teen$nbdsf.2017.nov,NOV.nbdsf.teen$nbdsf.2018.nov),
  mean(NOV.nddsf.ought$nddsf.2007.nov,NOV.nddsf.ought$nddsf.2008.nov,NOV.nddsf.ought$nddsf.2009.nov,+
         NOV.nddsf.teen$nddsf.2010.nov,NOV.nddsf.teen$nddsf.2011.nov,NOV.nddsf.teen$nddsf.2012.nov,+
         NOV.nddsf.teen$nddsf.2013.nov,NOV.nddsf.teen$nddsf.2014.nov,NOV.nddsf.teen$nddsf.2015.nov,+
         NOV.nddsf.teen$nddsf.2016.nov,NOV.nddsf.teen$nddsf.2017.nov,NOV.nddsf.teen$nddsf.2018.nov),
  mean(NOV.vbdsf.ought$vbdsf.2007.nov,NOV.vbdsf.ought$vbdsf.2008.nov,NOV.vbdsf.ought$vbdsf.2009.nov,+
         NOV.vbdsf.teen$vbdsf.2010.nov,NOV.vbdsf.teen$vbdsf.2011.nov,NOV.vbdsf.teen$vbdsf.2012.nov,+
         NOV.vbdsf.teen$vbdsf.2013.nov,NOV.vbdsf.teen$vbdsf.2014.nov,NOV.vbdsf.teen$vbdsf.2015.nov,+
         NOV.vbdsf.teen$vbdsf.2016.nov,NOV.vbdsf.teen$vbdsf.2017.nov,NOV.vbdsf.teen$vbdsf.2018.nov),
  mean(NOV.vddsf.ought$vddsf.2007.nov,NOV.vddsf.ought$vddsf.2008.nov,NOV.vddsf.ought$vddsf.2009.nov,+
         NOV.vddsf.teen$vddsf.2010.nov,NOV.vddsf.teen$vddsf.2011.nov,NOV.vddsf.teen$vddsf.2012.nov,+
         NOV.vddsf.teen$vddsf.2013.nov,NOV.vddsf.teen$vddsf.2014.nov,NOV.vddsf.teen$vddsf.2015.nov,+
         NOV.vddsf.teen$vddsf.2016.nov,NOV.vddsf.teen$vddsf.2017.nov,NOV.vddsf.teen$vddsf.2018.nov)
)

# december
DEC.nbdsf.ought <- vector('list', 3)
DEC.nddsf.ought <- vector('list', 3)
DEC.vbdsf.ought <- vector('list', 3)
DEC.vddsf.ought <- vector('list', 3)
names(DEC.nbdsf.ought) <- 7:9
names(DEC.nddsf.ought) <- 7:9
names(DEC.vbdsf.ought) <- 7:9
names(DEC.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nbdsf.ought[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nddsf") [,5,8]
  DEC.nddsf.ought[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vbdsf.ought[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vddsf") [,5,8]
  DEC.vddsf.ought[[as.character(i)]] <- mean(vddsf)
}
names(DEC.nbdsf.ought) <- sprintf("nbdsf.200%s.dec", names(DEC.nbdsf.ought))
names(DEC.nddsf.ought) <- sprintf("nddsf.200%s.dec", names(DEC.nddsf.ought))
names(DEC.vbdsf.ought) <- sprintf("vbdsf.200%s.dec", names(DEC.vbdsf.ought))
names(DEC.vddsf.ought) <- sprintf("vddsf.200%s.dec", names(DEC.vddsf.ought))

DEC.nbdsf.teen <- vector('list', 9)
DEC.nddsf.teen <- vector('list', 9)
DEC.vbdsf.teen <- vector('list', 9)
DEC.vddsf.teen <- vector('list', 9)
names(DEC.nbdsf.teen) <- 10:18
names(DEC.nddsf.teen) <- 10:18
names(DEC.vbdsf.teen) <- 10:18
names(DEC.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nbdsf.teen[[as.character(i)]] <- mean(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nddsf") [,5,8]
  DEC.nddsf.teen[[as.character(i)]] <- mean(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vbdsf.teen[[as.character(i)]] <- mean(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vddsf") [,5,8]
  DEC.vddsf.teen[[as.character(i)]] <- mean(vddsf)
}
names(DEC.nbdsf.teen) <- sprintf("nbdsf.20%s.dec", names(DEC.nbdsf.teen))
names(DEC.nddsf.teen) <- sprintf("nddsf.20%s.dec", names(DEC.nddsf.teen))
names(DEC.vbdsf.teen) <- sprintf("vbdsf.20%s.dec", names(DEC.vbdsf.teen))
names(DEC.vddsf.teen) <- sprintf("vddsf.20%s.dec", names(DEC.vddsf.teen))

DEC.mean.irrad <- sum(
  mean(DEC.nbdsf.ought$nbdsf.2007.dec,DEC.nbdsf.ought$nbdsf.2008.dec,DEC.nbdsf.ought$nbdsf.2009.dec,+
         DEC.nbdsf.teen$nbdsf.2010.dec,DEC.nbdsf.teen$nbdsf.2011.dec,DEC.nbdsf.teen$nbdsf.2012.dec,+
         DEC.nbdsf.teen$nbdsf.2013.dec,DEC.nbdsf.teen$nbdsf.2014.dec,DEC.nbdsf.teen$nbdsf.2015.dec,+
         DEC.nbdsf.teen$nbdsf.2016.dec,DEC.nbdsf.teen$nbdsf.2017.dec,DEC.nbdsf.teen$nbdsf.2018.dec),
  mean(DEC.nddsf.ought$nddsf.2007.dec,DEC.nddsf.ought$nddsf.2008.dec,DEC.nddsf.ought$nddsf.2009.dec,+
         DEC.nddsf.teen$nddsf.2010.dec,DEC.nddsf.teen$nddsf.2011.dec,DEC.nddsf.teen$nddsf.2012.dec,+
         DEC.nddsf.teen$nddsf.2013.dec,DEC.nddsf.teen$nddsf.2014.dec,DEC.nddsf.teen$nddsf.2015.dec,+
         DEC.nddsf.teen$nddsf.2016.dec,DEC.nddsf.teen$nddsf.2017.dec,DEC.nddsf.teen$nddsf.2018.dec),
  mean(DEC.vbdsf.ought$vbdsf.2007.dec,DEC.vbdsf.ought$vbdsf.2008.dec,DEC.vbdsf.ought$vbdsf.2009.dec,+
         DEC.vbdsf.teen$vbdsf.2010.dec,DEC.vbdsf.teen$vbdsf.2011.dec,DEC.vbdsf.teen$vbdsf.2012.dec,+
         DEC.vbdsf.teen$vbdsf.2013.dec,DEC.vbdsf.teen$vbdsf.2014.dec,DEC.vbdsf.teen$vbdsf.2015.dec,+
         DEC.vbdsf.teen$vbdsf.2016.dec,DEC.vbdsf.teen$vbdsf.2017.dec,DEC.vbdsf.teen$vbdsf.2018.dec),
  mean(DEC.vddsf.ought$vddsf.2007.dec,DEC.vddsf.ought$vddsf.2008.dec,DEC.vddsf.ought$vddsf.2009.dec,+
         DEC.vddsf.teen$vddsf.2010.dec,DEC.vddsf.teen$vddsf.2011.dec,DEC.vddsf.teen$vddsf.2012.dec,+
         DEC.vddsf.teen$vddsf.2013.dec,DEC.vddsf.teen$vddsf.2014.dec,DEC.vddsf.teen$vddsf.2015.dec,+
         DEC.vddsf.teen$vddsf.2016.dec,DEC.vddsf.teen$vddsf.2017.dec,DEC.vddsf.teen$vddsf.2018.dec)
)

irrad.mean.by.month <- c(JAN.mean.irrad,FEB.mean.irrad,MAR.mean.irrad,APR.mean.irrad,MAY.mean.irrad,+
                           JUN.mean.irrad,JUL.mean.irrad,AUG.mean.irrad,SEP.mean.irrad,OCT.mean.irrad,+
                           NOV.mean.irrad,DEC.mean.irrad)

plot(irrad.mean.by.month, ylab='mean irradiance [W/m^2]',xlab='month')

################################
# Max Irradiance in [W/m^2]
################################
# january
JAN.nbdsf.ought <- vector('list', 3)
JAN.nddsf.ought <- vector('list', 3)
JAN.vbdsf.ought <- vector('list', 3)
JAN.vddsf.ought <- vector('list', 3)
names(JAN.nbdsf.ought) <- 7:9
names(JAN.nddsf.ought) <- 7:9
names(JAN.vbdsf.ought) <- 7:9
names(JAN.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nddsf") [,5,8]
  JAN.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vddsf") [,5,8]
  JAN.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(JAN.nbdsf.ought) <- sprintf("nbdsf.200%s.jan", names(JAN.nbdsf.ought))
names(JAN.nddsf.ought) <- sprintf("nddsf.200%s.jan", names(JAN.nddsf.ought))
names(JAN.vbdsf.ought) <- sprintf("vbdsf.200%s.jan", names(JAN.vbdsf.ought))
names(JAN.vddsf.ought) <- sprintf("vddsf.200%s.jan", names(JAN.vddsf.ought))

JAN.nbdsf.teen <- vector('list', 10)
JAN.nddsf.teen <- vector('list', 10)
JAN.vbdsf.teen <- vector('list', 10)
JAN.vddsf.teen <- vector('list', 10)
names(JAN.nbdsf.teen) <- 10:19
names(JAN.nddsf.teen) <- 10:19
names(JAN.vbdsf.teen) <- 10:19
names(JAN.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nddsf") [,5,8]
  JAN.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vddsf") [,5,8]
  JAN.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(JAN.nbdsf.teen) <- sprintf("nbdsf.20%s.jan", names(JAN.nbdsf.teen))
names(JAN.nddsf.teen) <- sprintf("nddsf.20%s.jan", names(JAN.nddsf.teen))
names(JAN.vbdsf.teen) <- sprintf("vbdsf.20%s.jan", names(JAN.vbdsf.teen))
names(JAN.vddsf.teen) <- sprintf("vddsf.20%s.jan", names(JAN.vddsf.teen))

JAN.max.irrad <- sum(
  max(JAN.nbdsf.ought$nbdsf.2007.jan,JAN.nbdsf.ought$nbdsf.2008.jan,JAN.nbdsf.ought$nbdsf.2009.jan,+
        JAN.nbdsf.teen$nbdsf.2010.jan,JAN.nbdsf.teen$nbdsf.2011.jan,JAN.nbdsf.teen$nbdsf.2012.jan,+
        JAN.nbdsf.teen$nbdsf.2013.jan,JAN.nbdsf.teen$nbdsf.2014.jan,JAN.nbdsf.teen$nbdsf.2015.jan,+
        JAN.nbdsf.teen$nbdsf.2016.jan,JAN.nbdsf.teen$nbdsf.2017.jan,JAN.nbdsf.teen$nbdsf.2018.jan,JAN.nbdsf.teen$nbdsf.2019.jan),
  max(JAN.nddsf.ought$nddsf.2007.jan,JAN.nddsf.ought$nddsf.2008.jan,JAN.nddsf.ought$nddsf.2009.jan,+
        JAN.nddsf.teen$nddsf.2010.jan,JAN.nddsf.teen$nddsf.2011.jan,JAN.nddsf.teen$nddsf.2012.jan,+
        JAN.nddsf.teen$nddsf.2013.jan,JAN.nddsf.teen$nddsf.2014.jan,JAN.nddsf.teen$nddsf.2015.jan,+
        JAN.nddsf.teen$nddsf.2016.jan,JAN.nddsf.teen$nddsf.2017.jan,JAN.nddsf.teen$nddsf.2018.jan,JAN.nddsf.teen$nddsf.2019.jan),
  max(JAN.vbdsf.ought$vbdsf.2007.jan,JAN.vbdsf.ought$vbdsf.2008.jan,JAN.vbdsf.ought$vbdsf.2009.jan,+
        JAN.vbdsf.teen$vbdsf.2010.jan,JAN.vbdsf.teen$vbdsf.2011.jan,JAN.vbdsf.teen$vbdsf.2012.jan,+
        JAN.vbdsf.teen$vbdsf.2013.jan,JAN.vbdsf.teen$vbdsf.2014.jan,JAN.vbdsf.teen$vbdsf.2015.jan,+
        JAN.vbdsf.teen$vbdsf.2016.jan,JAN.vbdsf.teen$vbdsf.2017.jan,JAN.vbdsf.teen$vbdsf.2018.jan,JAN.vbdsf.teen$vbdsf.2019.jan),
  max(JAN.vddsf.ought$vddsf.2007.jan,JAN.vddsf.ought$vddsf.2008.jan,JAN.vddsf.ought$vddsf.2009.jan,+
        JAN.vddsf.teen$vddsf.2010.jan,JAN.vddsf.teen$vddsf.2011.jan,JAN.vddsf.teen$vddsf.2012.jan,+
        JAN.vddsf.teen$vddsf.2013.jan,JAN.vddsf.teen$vddsf.2014.jan,JAN.vddsf.teen$vddsf.2015.jan,+
        JAN.vddsf.teen$vddsf.2016.jan,JAN.vddsf.teen$vddsf.2017.jan,JAN.vddsf.teen$vddsf.2018.jan,JAN.vddsf.teen$vddsf.2019.jan)
)

# february
FEB.nbdsf.ought <- vector('list', 3)
FEB.nddsf.ought <- vector('list', 3)
FEB.vbdsf.ought <- vector('list', 3)
FEB.vddsf.ought <- vector('list', 3)
names(FEB.nbdsf.ought) <- 7:9
names(FEB.nddsf.ought) <- 7:9
names(FEB.vbdsf.ought) <- 7:9
names(FEB.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nddsf") [,5,8]
  FEB.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vddsf") [,5,8]
  FEB.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(FEB.nbdsf.ought) <- sprintf("nbdsf.200%s.feb", names(FEB.nbdsf.ought))
names(FEB.nddsf.ought) <- sprintf("nddsf.200%s.feb", names(FEB.nddsf.ought))
names(FEB.vbdsf.ought) <- sprintf("vbdsf.200%s.feb", names(FEB.vbdsf.ought))
names(FEB.vddsf.ought) <- sprintf("vddsf.200%s.feb", names(FEB.vddsf.ought))

FEB.nbdsf.teen <- vector('list', 10)
FEB.nddsf.teen <- vector('list', 10)
FEB.vbdsf.teen <- vector('list', 10)
FEB.vddsf.teen <- vector('list', 10)
names(FEB.nbdsf.teen) <- 10:19
names(FEB.nddsf.teen) <- 10:19
names(FEB.vbdsf.teen) <- 10:19
names(FEB.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nddsf") [,5,8]
  FEB.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vddsf") [,5,8]
  FEB.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(FEB.nbdsf.teen) <- sprintf("nbdsf.20%s.feb", names(FEB.nbdsf.teen))
names(FEB.nddsf.teen) <- sprintf("nddsf.20%s.feb", names(FEB.nddsf.teen))
names(FEB.vbdsf.teen) <- sprintf("vbdsf.20%s.feb", names(FEB.vbdsf.teen))
names(FEB.vddsf.teen) <- sprintf("vddsf.20%s.feb", names(FEB.vddsf.teen))

FEB.max.irrad <- sum(
  max(FEB.nbdsf.ought$nbdsf.2007.feb,FEB.nbdsf.ought$nbdsf.2008.feb,FEB.nbdsf.ought$nbdsf.2009.feb,+
        FEB.nbdsf.teen$nbdsf.2010.feb,FEB.nbdsf.teen$nbdsf.2011.feb,FEB.nbdsf.teen$nbdsf.2012.feb,+
        FEB.nbdsf.teen$nbdsf.2013.feb,FEB.nbdsf.teen$nbdsf.2014.feb,FEB.nbdsf.teen$nbdsf.2015.feb,+
        FEB.nbdsf.teen$nbdsf.2016.feb,FEB.nbdsf.teen$nbdsf.2017.feb,FEB.nbdsf.teen$nbdsf.2018.feb,FEB.nbdsf.teen$nbdsf.2019.feb),
  max(FEB.nddsf.ought$nddsf.2007.feb,FEB.nddsf.ought$nddsf.2008.feb,FEB.nddsf.ought$nddsf.2009.feb,+
        FEB.nddsf.teen$nddsf.2010.feb,FEB.nddsf.teen$nddsf.2011.feb,FEB.nddsf.teen$nddsf.2012.feb,+
        FEB.nddsf.teen$nddsf.2013.feb,FEB.nddsf.teen$nddsf.2014.feb,FEB.nddsf.teen$nddsf.2015.feb,+
        FEB.nddsf.teen$nddsf.2016.feb,FEB.nddsf.teen$nddsf.2017.feb,FEB.nddsf.teen$nddsf.2018.feb,FEB.nddsf.teen$nddsf.2019.feb),
  max(FEB.vbdsf.ought$vbdsf.2007.feb,FEB.vbdsf.ought$vbdsf.2008.feb,FEB.vbdsf.ought$vbdsf.2009.feb,+
        FEB.vbdsf.teen$vbdsf.2010.feb,FEB.vbdsf.teen$vbdsf.2011.feb,FEB.vbdsf.teen$vbdsf.2012.feb,+
        FEB.vbdsf.teen$vbdsf.2013.feb,FEB.vbdsf.teen$vbdsf.2014.feb,FEB.vbdsf.teen$vbdsf.2015.feb,+
        FEB.vbdsf.teen$vbdsf.2016.feb,FEB.vbdsf.teen$vbdsf.2017.feb,FEB.vbdsf.teen$vbdsf.2018.feb,FEB.vbdsf.teen$vbdsf.2019.feb),
  max(FEB.vddsf.ought$vddsf.2007.feb,FEB.vddsf.ought$vddsf.2008.feb,FEB.vddsf.ought$vddsf.2009.feb,+
        FEB.vddsf.teen$vddsf.2010.feb,FEB.vddsf.teen$vddsf.2011.feb,FEB.vddsf.teen$vddsf.2012.feb,+
        FEB.vddsf.teen$vddsf.2013.feb,FEB.vddsf.teen$vddsf.2014.feb,FEB.vddsf.teen$vddsf.2015.feb,+
        FEB.vddsf.teen$vddsf.2016.feb,FEB.vddsf.teen$vddsf.2017.feb,FEB.vddsf.teen$vddsf.2018.feb,FEB.vddsf.teen$vddsf.2019.feb)
)

# march
MAR.nbdsf.ought <- vector('list', 3)
MAR.nddsf.ought <- vector('list', 3)
MAR.vbdsf.ought <- vector('list', 3)
MAR.vddsf.ought <- vector('list', 3)
names(MAR.nbdsf.ought) <- 7:9
names(MAR.nddsf.ought) <- 7:9
names(MAR.vbdsf.ought) <- 7:9
names(MAR.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nddsf") [,5,8]
  MAR.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vddsf") [,5,8]
  MAR.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(MAR.nbdsf.ought) <- sprintf("nbdsf.200%s.mar", names(MAR.nbdsf.ought))
names(MAR.nddsf.ought) <- sprintf("nddsf.200%s.mar", names(MAR.nddsf.ought))
names(MAR.vbdsf.ought) <- sprintf("vbdsf.200%s.mar", names(MAR.vbdsf.ought))
names(MAR.vddsf.ought) <- sprintf("vddsf.200%s.mar", names(MAR.vddsf.ought))

MAR.nbdsf.teen <- vector('list', 10)
MAR.nddsf.teen <- vector('list', 10)
MAR.vbdsf.teen <- vector('list', 10)
MAR.vddsf.teen <- vector('list', 10)
names(MAR.nbdsf.teen) <- 10:19
names(MAR.nddsf.teen) <- 10:19
names(MAR.vbdsf.teen) <- 10:19
names(MAR.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nddsf") [,5,8]
  MAR.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vddsf") [,5,8]
  MAR.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(MAR.nbdsf.teen) <- sprintf("nbdsf.20%s.mar", names(MAR.nbdsf.teen))
names(MAR.nddsf.teen) <- sprintf("nddsf.20%s.mar", names(MAR.nddsf.teen))
names(MAR.vbdsf.teen) <- sprintf("vbdsf.20%s.mar", names(MAR.vbdsf.teen))
names(MAR.vddsf.teen) <- sprintf("vddsf.20%s.mar", names(MAR.vddsf.teen))

MAR.max.irrad <- sum(
  max(MAR.nbdsf.ought$nbdsf.2007.mar,MAR.nbdsf.ought$nbdsf.2008.mar,MAR.nbdsf.ought$nbdsf.2009.mar,+
        MAR.nbdsf.teen$nbdsf.2010.mar,MAR.nbdsf.teen$nbdsf.2011.mar,MAR.nbdsf.teen$nbdsf.2012.mar,+
        MAR.nbdsf.teen$nbdsf.2013.mar,MAR.nbdsf.teen$nbdsf.2014.mar,MAR.nbdsf.teen$nbdsf.2015.mar,+
        MAR.nbdsf.teen$nbdsf.2016.mar,MAR.nbdsf.teen$nbdsf.2017.mar,MAR.nbdsf.teen$nbdsf.2018.mar,MAR.nbdsf.teen$nbdsf.2019.mar),
  max(MAR.nddsf.ought$nddsf.2007.mar,MAR.nddsf.ought$nddsf.2008.mar,MAR.nddsf.ought$nddsf.2009.mar,+
        MAR.nddsf.teen$nddsf.2010.mar,MAR.nddsf.teen$nddsf.2011.mar,MAR.nddsf.teen$nddsf.2012.mar,+
        MAR.nddsf.teen$nddsf.2013.mar,MAR.nddsf.teen$nddsf.2014.mar,MAR.nddsf.teen$nddsf.2015.mar,+
        MAR.nddsf.teen$nddsf.2016.mar,MAR.nddsf.teen$nddsf.2017.mar,MAR.nddsf.teen$nddsf.2018.mar,MAR.nddsf.teen$nddsf.2019.mar),
  max(MAR.vbdsf.ought$vbdsf.2007.mar,MAR.vbdsf.ought$vbdsf.2008.mar,MAR.vbdsf.ought$vbdsf.2009.mar,+
        MAR.vbdsf.teen$vbdsf.2010.mar,MAR.vbdsf.teen$vbdsf.2011.mar,MAR.vbdsf.teen$vbdsf.2012.mar,+
        MAR.vbdsf.teen$vbdsf.2013.mar,MAR.vbdsf.teen$vbdsf.2014.mar,MAR.vbdsf.teen$vbdsf.2015.mar,+
        MAR.vbdsf.teen$vbdsf.2016.mar,MAR.vbdsf.teen$vbdsf.2017.mar,MAR.vbdsf.teen$vbdsf.2018.mar,MAR.vbdsf.teen$vbdsf.2019.mar),
  max(MAR.vddsf.ought$vddsf.2007.mar,MAR.vddsf.ought$vddsf.2008.mar,MAR.vddsf.ought$vddsf.2009.mar,+
        MAR.vddsf.teen$vddsf.2010.mar,MAR.vddsf.teen$vddsf.2011.mar,MAR.vddsf.teen$vddsf.2012.mar,+
        MAR.vddsf.teen$vddsf.2013.mar,MAR.vddsf.teen$vddsf.2014.mar,MAR.vddsf.teen$vddsf.2015.mar,+
        MAR.vddsf.teen$vddsf.2016.mar,MAR.vddsf.teen$vddsf.2017.mar,MAR.vddsf.teen$vddsf.2018.mar,MAR.vddsf.teen$vddsf.2019.mar)
)

# april
APR.nbdsf.ought <- vector('list', 3)
APR.nddsf.ought <- vector('list', 3)
APR.vbdsf.ought <- vector('list', 3)
APR.vddsf.ought <- vector('list', 3)
names(APR.nbdsf.ought) <- 7:9
names(APR.nddsf.ought) <- 7:9
names(APR.vbdsf.ought) <- 7:9
names(APR.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nddsf") [,5,8]
  APR.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vddsf") [,5,8]
  APR.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(APR.nbdsf.ought) <- sprintf("nbdsf.200%s.apr", names(APR.nbdsf.ought))
names(APR.nddsf.ought) <- sprintf("nddsf.200%s.apr", names(APR.nddsf.ought))
names(APR.vbdsf.ought) <- sprintf("vbdsf.200%s.apr", names(APR.vbdsf.ought))
names(APR.vddsf.ought) <- sprintf("vddsf.200%s.apr", names(APR.vddsf.ought))

APR.nbdsf.teen <- vector('list', 10)
APR.nddsf.teen <- vector('list', 10)
APR.vbdsf.teen <- vector('list', 10)
APR.vddsf.teen <- vector('list', 10)
names(APR.nbdsf.teen) <- 10:19
names(APR.nddsf.teen) <- 10:19
names(APR.vbdsf.teen) <- 10:19
names(APR.vddsf.teen) <- 10:19
for (i in 10:19)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nddsf") [,5,8]
  APR.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vddsf") [,5,8]
  APR.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(APR.nbdsf.teen) <- sprintf("nbdsf.20%s.apr", names(APR.nbdsf.teen))
names(APR.nddsf.teen) <- sprintf("nddsf.20%s.apr", names(APR.nddsf.teen))
names(APR.vbdsf.teen) <- sprintf("vbdsf.20%s.apr", names(APR.vbdsf.teen))
names(APR.vddsf.teen) <- sprintf("vddsf.20%s.apr", names(APR.vddsf.teen))

APR.max.irrad <- sum(
  max(APR.nbdsf.ought$nbdsf.2007.apr,APR.nbdsf.ought$nbdsf.2008.apr,APR.nbdsf.ought$nbdsf.2009.apr,+
        APR.nbdsf.teen$nbdsf.2010.apr,APR.nbdsf.teen$nbdsf.2011.apr,APR.nbdsf.teen$nbdsf.2012.apr,+
        APR.nbdsf.teen$nbdsf.2013.apr,APR.nbdsf.teen$nbdsf.2014.apr,APR.nbdsf.teen$nbdsf.2015.apr,+
        APR.nbdsf.teen$nbdsf.2016.apr,APR.nbdsf.teen$nbdsf.2017.apr,APR.nbdsf.teen$nbdsf.2018.apr,APR.nbdsf.teen$nbdsf.2019.apr),
  max(APR.nddsf.ought$nddsf.2007.apr,APR.nddsf.ought$nddsf.2008.apr,APR.nddsf.ought$nddsf.2009.apr,+
        APR.nddsf.teen$nddsf.2010.apr,APR.nddsf.teen$nddsf.2011.apr,APR.nddsf.teen$nddsf.2012.apr,+
        APR.nddsf.teen$nddsf.2013.apr,APR.nddsf.teen$nddsf.2014.apr,APR.nddsf.teen$nddsf.2015.apr,+
        APR.nddsf.teen$nddsf.2016.apr,APR.nddsf.teen$nddsf.2017.apr,APR.nddsf.teen$nddsf.2018.apr,APR.nddsf.teen$nddsf.2019.apr),
  max(APR.vbdsf.ought$vbdsf.2007.apr,APR.vbdsf.ought$vbdsf.2008.apr,APR.vbdsf.ought$vbdsf.2009.apr,+
        APR.vbdsf.teen$vbdsf.2010.apr,APR.vbdsf.teen$vbdsf.2011.apr,APR.vbdsf.teen$vbdsf.2012.apr,+
        APR.vbdsf.teen$vbdsf.2013.apr,APR.vbdsf.teen$vbdsf.2014.apr,APR.vbdsf.teen$vbdsf.2015.apr,+
        APR.vbdsf.teen$vbdsf.2016.apr,APR.vbdsf.teen$vbdsf.2017.apr,APR.vbdsf.teen$vbdsf.2018.apr,APR.vbdsf.teen$vbdsf.2019.apr),
  max(APR.vddsf.ought$vddsf.2007.apr,APR.vddsf.ought$vddsf.2008.apr,APR.vddsf.ought$vddsf.2009.apr,+
        APR.vddsf.teen$vddsf.2010.apr,APR.vddsf.teen$vddsf.2011.apr,APR.vddsf.teen$vddsf.2012.apr,+
        APR.vddsf.teen$vddsf.2013.apr,APR.vddsf.teen$vddsf.2014.apr,APR.vddsf.teen$vddsf.2015.apr,+
        APR.vddsf.teen$vddsf.2016.apr,APR.vddsf.teen$vddsf.2017.apr,APR.vddsf.teen$vddsf.2018.apr,APR.vddsf.teen$vddsf.2019.apr)
)

# may
MAY.nbdsf.ought <- vector('list', 3)
MAY.nddsf.ought <- vector('list', 3)
MAY.vbdsf.ought <- vector('list', 3)
MAY.vddsf.ought <- vector('list', 3)
names(MAY.nbdsf.ought) <- 7:9
names(MAY.nddsf.ought) <- 7:9
names(MAY.vbdsf.ought) <- 7:9
names(MAY.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nddsf") [,5,8]
  MAY.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vddsf") [,5,8]
  MAY.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(MAY.nbdsf.ought) <- sprintf("nbdsf.200%s.may", names(MAY.nbdsf.ought))
names(MAY.nddsf.ought) <- sprintf("nddsf.200%s.may", names(MAY.nddsf.ought))
names(MAY.vbdsf.ought) <- sprintf("vbdsf.200%s.may", names(MAY.vbdsf.ought))
names(MAY.vddsf.ought) <- sprintf("vddsf.200%s.may", names(MAY.vddsf.ought))

MAY.nbdsf.teen <- vector('list', 9)
MAY.nddsf.teen <- vector('list', 9)
MAY.vbdsf.teen <- vector('list', 9)
MAY.vddsf.teen <- vector('list', 9)
names(MAY.nbdsf.teen) <- 10:18
names(MAY.nddsf.teen) <- 10:18
names(MAY.vbdsf.teen) <- 10:18
names(MAY.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nddsf") [,5,8]
  MAY.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vddsf") [,5,8]
  MAY.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(MAY.nbdsf.teen) <- sprintf("nbdsf.20%s.may", names(MAY.nbdsf.teen))
names(MAY.nddsf.teen) <- sprintf("nddsf.20%s.may", names(MAY.nddsf.teen))
names(MAY.vbdsf.teen) <- sprintf("vbdsf.20%s.may", names(MAY.vbdsf.teen))
names(MAY.vddsf.teen) <- sprintf("vddsf.20%s.may", names(MAY.vddsf.teen))

MAY.max.irrad <- sum(
  max(MAY.nbdsf.ought$nbdsf.2007.may,MAY.nbdsf.ought$nbdsf.2008.may,MAY.nbdsf.ought$nbdsf.2009.may,+
        MAY.nbdsf.teen$nbdsf.2010.may,MAY.nbdsf.teen$nbdsf.2011.may,MAY.nbdsf.teen$nbdsf.2012.may,+
        MAY.nbdsf.teen$nbdsf.2013.may,MAY.nbdsf.teen$nbdsf.2014.may,MAY.nbdsf.teen$nbdsf.2015.may,+
        MAY.nbdsf.teen$nbdsf.2016.may,MAY.nbdsf.teen$nbdsf.2017.may,MAY.nbdsf.teen$nbdsf.2018.may),
  max(MAY.nddsf.ought$nddsf.2007.may,MAY.nddsf.ought$nddsf.2008.may,MAY.nddsf.ought$nddsf.2009.may,+
        MAY.nddsf.teen$nddsf.2010.may,MAY.nddsf.teen$nddsf.2011.may,MAY.nddsf.teen$nddsf.2012.may,+
        MAY.nddsf.teen$nddsf.2013.may,MAY.nddsf.teen$nddsf.2014.may,MAY.nddsf.teen$nddsf.2015.may,+
        MAY.nddsf.teen$nddsf.2016.may,MAY.nddsf.teen$nddsf.2017.may,MAY.nddsf.teen$nddsf.2018.may),
  max(MAY.vbdsf.ought$vbdsf.2007.may,MAY.vbdsf.ought$vbdsf.2008.may,MAY.vbdsf.ought$vbdsf.2009.may,+
        MAY.vbdsf.teen$vbdsf.2010.may,MAY.vbdsf.teen$vbdsf.2011.may,MAY.vbdsf.teen$vbdsf.2012.may,+
        MAY.vbdsf.teen$vbdsf.2013.may,MAY.vbdsf.teen$vbdsf.2014.may,MAY.vbdsf.teen$vbdsf.2015.may,+
        MAY.vbdsf.teen$vbdsf.2016.may,MAY.vbdsf.teen$vbdsf.2017.may,MAY.vbdsf.teen$vbdsf.2018.may),
  max(MAY.vddsf.ought$vddsf.2007.may,MAY.vddsf.ought$vddsf.2008.may,MAY.vddsf.ought$vddsf.2009.may,+
        MAY.vddsf.teen$vddsf.2010.may,MAY.vddsf.teen$vddsf.2011.may,MAY.vddsf.teen$vddsf.2012.may,+
        MAY.vddsf.teen$vddsf.2013.may,MAY.vddsf.teen$vddsf.2014.may,MAY.vddsf.teen$vddsf.2015.may,+
        MAY.vddsf.teen$vddsf.2016.may,MAY.vddsf.teen$vddsf.2017.may,MAY.vddsf.teen$vddsf.2018.may)
)

# june
JUN.nbdsf.ought <- vector('list', 3)
JUN.nddsf.ought <- vector('list', 3)
JUN.vbdsf.ought <- vector('list', 3)
JUN.vddsf.ought <- vector('list', 3)
names(JUN.nbdsf.ought) <- 7:9
names(JUN.nddsf.ought) <- 7:9
names(JUN.vbdsf.ought) <- 7:9
names(JUN.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nddsf") [,5,8]
  JUN.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vddsf") [,5,8]
  JUN.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(JUN.nbdsf.ought) <- sprintf("nbdsf.200%s.jun", names(JUN.nbdsf.ought))
names(JUN.nddsf.ought) <- sprintf("nddsf.200%s.jun", names(JUN.nddsf.ought))
names(JUN.vbdsf.ought) <- sprintf("vbdsf.200%s.jun", names(JUN.vbdsf.ought))
names(JUN.vddsf.ought) <- sprintf("vddsf.200%s.jun", names(JUN.vddsf.ought))

JUN.nbdsf.teen <- vector('list', 9)
JUN.nddsf.teen <- vector('list', 9)
JUN.vbdsf.teen <- vector('list', 9)
JUN.vddsf.teen <- vector('list', 9)
names(JUN.nbdsf.teen) <- 10:18
names(JUN.nddsf.teen) <- 10:18
names(JUN.vbdsf.teen) <- 10:18
names(JUN.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nddsf") [,5,8]
  JUN.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vddsf") [,5,8]
  JUN.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(JUN.nbdsf.teen) <- sprintf("nbdsf.20%s.jun", names(JUN.nbdsf.teen))
names(JUN.nddsf.teen) <- sprintf("nddsf.20%s.jun", names(JUN.nddsf.teen))
names(JUN.vbdsf.teen) <- sprintf("vbdsf.20%s.jun", names(JUN.vbdsf.teen))
names(JUN.vddsf.teen) <- sprintf("vddsf.20%s.jun", names(JUN.vddsf.teen))

JUN.max.irrad <- sum(
  max(JUN.nbdsf.ought$nbdsf.2007.jun,JUN.nbdsf.ought$nbdsf.2008.jun,JUN.nbdsf.ought$nbdsf.2009.jun,+
        JUN.nbdsf.teen$nbdsf.2010.jun,JUN.nbdsf.teen$nbdsf.2011.jun,JUN.nbdsf.teen$nbdsf.2012.jun,+
        JUN.nbdsf.teen$nbdsf.2013.jun,JUN.nbdsf.teen$nbdsf.2014.jun,JUN.nbdsf.teen$nbdsf.2015.jun,+
        JUN.nbdsf.teen$nbdsf.2016.jun,JUN.nbdsf.teen$nbdsf.2017.jun,JUN.nbdsf.teen$nbdsf.2018.jun),
  max(JUN.nddsf.ought$nddsf.2007.jun,JUN.nddsf.ought$nddsf.2008.jun,JUN.nddsf.ought$nddsf.2009.jun,+
        JUN.nddsf.teen$nddsf.2010.jun,JUN.nddsf.teen$nddsf.2011.jun,JUN.nddsf.teen$nddsf.2012.jun,+
        JUN.nddsf.teen$nddsf.2013.jun,JUN.nddsf.teen$nddsf.2014.jun,JUN.nddsf.teen$nddsf.2015.jun,+
        JUN.nddsf.teen$nddsf.2016.jun,JUN.nddsf.teen$nddsf.2017.jun,JUN.nddsf.teen$nddsf.2018.jun),
  max(JUN.vbdsf.ought$vbdsf.2007.jun,JUN.vbdsf.ought$vbdsf.2008.jun,JUN.vbdsf.ought$vbdsf.2009.jun,+
        JUN.vbdsf.teen$vbdsf.2010.jun,JUN.vbdsf.teen$vbdsf.2011.jun,JUN.vbdsf.teen$vbdsf.2012.jun,+
        JUN.vbdsf.teen$vbdsf.2013.jun,JUN.vbdsf.teen$vbdsf.2014.jun,JUN.vbdsf.teen$vbdsf.2015.jun,+
        JUN.vbdsf.teen$vbdsf.2016.jun,JUN.vbdsf.teen$vbdsf.2017.jun,JUN.vbdsf.teen$vbdsf.2018.jun),
  max(JUN.vddsf.ought$vddsf.2007.jun,JUN.vddsf.ought$vddsf.2008.jun,JUN.vddsf.ought$vddsf.2009.jun,+
        JUN.vddsf.teen$vddsf.2010.jun,JUN.vddsf.teen$vddsf.2011.jun,JUN.vddsf.teen$vddsf.2012.jun,+
        JUN.vddsf.teen$vddsf.2013.jun,JUN.vddsf.teen$vddsf.2014.jun,JUN.vddsf.teen$vddsf.2015.jun,+
        JUN.vddsf.teen$vddsf.2016.jun,JUN.vddsf.teen$vddsf.2017.jun,JUN.vddsf.teen$vddsf.2018.jun)
)

# july
JUL.nbdsf.ought <- vector('list', 3)
JUL.nddsf.ought <- vector('list', 3)
JUL.vbdsf.ought <- vector('list', 3)
JUL.vddsf.ought <- vector('list', 3)
names(JUL.nbdsf.ought) <- 7:9
names(JUL.nddsf.ought) <- 7:9
names(JUL.vbdsf.ought) <- 7:9
names(JUL.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nddsf") [,5,8]
  JUL.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vddsf") [,5,8]
  JUL.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(JUL.nbdsf.ought) <- sprintf("nbdsf.200%s.jul", names(JUL.nbdsf.ought))
names(JUL.nddsf.ought) <- sprintf("nddsf.200%s.jul", names(JUL.nddsf.ought))
names(JUL.vbdsf.ought) <- sprintf("vbdsf.200%s.jul", names(JUL.vbdsf.ought))
names(JUL.vddsf.ought) <- sprintf("vddsf.200%s.jul", names(JUL.vddsf.ought))

JUL.nbdsf.teen <- vector('list', 9)
JUL.nddsf.teen <- vector('list', 9)
JUL.vbdsf.teen <- vector('list', 9)
JUL.vddsf.teen <- vector('list', 9)
names(JUL.nbdsf.teen) <- 10:18
names(JUL.nddsf.teen) <- 10:18
names(JUL.vbdsf.teen) <- 10:18
names(JUL.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nddsf") [,5,8]
  JUL.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vddsf") [,5,8]
  JUL.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(JUL.nbdsf.teen) <- sprintf("nbdsf.20%s.jul", names(JUL.nbdsf.teen))
names(JUL.nddsf.teen) <- sprintf("nddsf.20%s.jul", names(JUL.nddsf.teen))
names(JUL.vbdsf.teen) <- sprintf("vbdsf.20%s.jul", names(JUL.vbdsf.teen))
names(JUL.vddsf.teen) <- sprintf("vddsf.20%s.jul", names(JUL.vddsf.teen))

JUL.max.irrad <- sum(
  max(JUL.nbdsf.ought$nbdsf.2007.jul,JUL.nbdsf.ought$nbdsf.2008.jul,JUL.nbdsf.ought$nbdsf.2009.jul,+
        JUL.nbdsf.teen$nbdsf.2010.jul,JUL.nbdsf.teen$nbdsf.2011.jul,JUL.nbdsf.teen$nbdsf.2012.jul,+
        JUL.nbdsf.teen$nbdsf.2013.jul,JUL.nbdsf.teen$nbdsf.2014.jul,JUL.nbdsf.teen$nbdsf.2015.jul,+
        JUL.nbdsf.teen$nbdsf.2016.jul,JUL.nbdsf.teen$nbdsf.2017.jul,JUL.nbdsf.teen$nbdsf.2018.jul),
  max(JUL.nddsf.ought$nddsf.2007.jul,JUL.nddsf.ought$nddsf.2008.jul,JUL.nddsf.ought$nddsf.2009.jul,+
        JUL.nddsf.teen$nddsf.2010.jul,JUL.nddsf.teen$nddsf.2011.jul,JUL.nddsf.teen$nddsf.2012.jul,+
        JUL.nddsf.teen$nddsf.2013.jul,JUL.nddsf.teen$nddsf.2014.jul,JUL.nddsf.teen$nddsf.2015.jul,+
        JUL.nddsf.teen$nddsf.2016.jul,JUL.nddsf.teen$nddsf.2017.jul,JUL.nddsf.teen$nddsf.2018.jul),
  max(JUL.vbdsf.ought$vbdsf.2007.jul,JUL.vbdsf.ought$vbdsf.2008.jul,JUL.vbdsf.ought$vbdsf.2009.jul,+
        JUL.vbdsf.teen$vbdsf.2010.jul,JUL.vbdsf.teen$vbdsf.2011.jul,JUL.vbdsf.teen$vbdsf.2012.jul,+
        JUL.vbdsf.teen$vbdsf.2013.jul,JUL.vbdsf.teen$vbdsf.2014.jul,JUL.vbdsf.teen$vbdsf.2015.jul,+
        JUL.vbdsf.teen$vbdsf.2016.jul,JUL.vbdsf.teen$vbdsf.2017.jul,JUL.vbdsf.teen$vbdsf.2018.jul),
  max(JUL.vddsf.ought$vddsf.2007.jul,JUL.vddsf.ought$vddsf.2008.jul,JUL.vddsf.ought$vddsf.2009.jul,+
        JUL.vddsf.teen$vddsf.2010.jul,JUL.vddsf.teen$vddsf.2011.jul,JUL.vddsf.teen$vddsf.2012.jul,+
        JUL.vddsf.teen$vddsf.2013.jul,JUL.vddsf.teen$vddsf.2014.jul,JUL.vddsf.teen$vddsf.2015.jul,+
        JUL.vddsf.teen$vddsf.2016.jul,JUL.vddsf.teen$vddsf.2017.jul,JUL.vddsf.teen$vddsf.2018.jul)
)

# august
AUG.nbdsf.ought <- vector('list', 3)
AUG.nddsf.ought <- vector('list', 3)
AUG.vbdsf.ought <- vector('list', 3)
AUG.vddsf.ought <- vector('list', 3)
names(AUG.nbdsf.ought) <- 7:9
names(AUG.nddsf.ought) <- 7:9
names(AUG.vbdsf.ought) <- 7:9
names(AUG.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nddsf") [,5,8]
  AUG.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vddsf") [,5,8]
  AUG.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(AUG.nbdsf.ought) <- sprintf("nbdsf.200%s.aug", names(AUG.nbdsf.ought))
names(AUG.nddsf.ought) <- sprintf("nddsf.200%s.aug", names(AUG.nddsf.ought))
names(AUG.vbdsf.ought) <- sprintf("vbdsf.200%s.aug", names(AUG.vbdsf.ought))
names(AUG.vddsf.ought) <- sprintf("vddsf.200%s.aug", names(AUG.vddsf.ought))

AUG.nbdsf.teen <- vector('list', 9)
AUG.nddsf.teen <- vector('list', 9)
AUG.vbdsf.teen <- vector('list', 9)
AUG.vddsf.teen <- vector('list', 9)
names(AUG.nbdsf.teen) <- 10:18
names(AUG.nddsf.teen) <- 10:18
names(AUG.vbdsf.teen) <- 10:18
names(AUG.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nddsf") [,5,8]
  AUG.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vddsf") [,5,8]
  AUG.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(AUG.nbdsf.teen) <- sprintf("nbdsf.20%s.aug", names(AUG.nbdsf.teen))
names(AUG.nddsf.teen) <- sprintf("nddsf.20%s.aug", names(AUG.nddsf.teen))
names(AUG.vbdsf.teen) <- sprintf("vbdsf.20%s.aug", names(AUG.vbdsf.teen))
names(AUG.vddsf.teen) <- sprintf("vddsf.20%s.aug", names(AUG.vddsf.teen))

AUG.max.irrad <- sum(
  max(AUG.nbdsf.ought$nbdsf.2007.aug,AUG.nbdsf.ought$nbdsf.2008.aug,AUG.nbdsf.ought$nbdsf.2009.aug,+
        AUG.nbdsf.teen$nbdsf.2010.aug,AUG.nbdsf.teen$nbdsf.2011.aug,AUG.nbdsf.teen$nbdsf.2012.aug,+
        AUG.nbdsf.teen$nbdsf.2013.aug,AUG.nbdsf.teen$nbdsf.2014.aug,AUG.nbdsf.teen$nbdsf.2015.aug,+
        AUG.nbdsf.teen$nbdsf.2016.aug,AUG.nbdsf.teen$nbdsf.2017.aug,AUG.nbdsf.teen$nbdsf.2018.aug),
  max(AUG.nddsf.ought$nddsf.2007.aug,AUG.nddsf.ought$nddsf.2008.aug,AUG.nddsf.ought$nddsf.2009.aug,+
        AUG.nddsf.teen$nddsf.2010.aug,AUG.nddsf.teen$nddsf.2011.aug,AUG.nddsf.teen$nddsf.2012.aug,+
        AUG.nddsf.teen$nddsf.2013.aug,AUG.nddsf.teen$nddsf.2014.aug,AUG.nddsf.teen$nddsf.2015.aug,+
        AUG.nddsf.teen$nddsf.2016.aug,AUG.nddsf.teen$nddsf.2017.aug,AUG.nddsf.teen$nddsf.2018.aug),
  max(AUG.vbdsf.ought$vbdsf.2007.aug,AUG.vbdsf.ought$vbdsf.2008.aug,AUG.vbdsf.ought$vbdsf.2009.aug,+
        AUG.vbdsf.teen$vbdsf.2010.aug,AUG.vbdsf.teen$vbdsf.2011.aug,AUG.vbdsf.teen$vbdsf.2012.aug,+
        AUG.vbdsf.teen$vbdsf.2013.aug,AUG.vbdsf.teen$vbdsf.2014.aug,AUG.vbdsf.teen$vbdsf.2015.aug,+
        AUG.vbdsf.teen$vbdsf.2016.aug,AUG.vbdsf.teen$vbdsf.2017.aug,AUG.vbdsf.teen$vbdsf.2018.aug),
  max(AUG.vddsf.ought$vddsf.2007.aug,AUG.vddsf.ought$vddsf.2008.aug,AUG.vddsf.ought$vddsf.2009.aug,+
        AUG.vddsf.teen$vddsf.2010.aug,AUG.vddsf.teen$vddsf.2011.aug,AUG.vddsf.teen$vddsf.2012.aug,+
        AUG.vddsf.teen$vddsf.2013.aug,AUG.vddsf.teen$vddsf.2014.aug,AUG.vddsf.teen$vddsf.2015.aug,+
        AUG.vddsf.teen$vddsf.2016.aug,AUG.vddsf.teen$vddsf.2017.aug,AUG.vddsf.teen$vddsf.2018.aug)
)

# september
SEP.nbdsf.ought <- vector('list', 3)
SEP.nddsf.ought <- vector('list', 3)
SEP.vbdsf.ought <- vector('list', 3)
SEP.vddsf.ought <- vector('list', 3)
names(SEP.nbdsf.ought) <- 7:9
names(SEP.nddsf.ought) <- 7:9
names(SEP.vbdsf.ought) <- 7:9
names(SEP.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nddsf") [,5,8]
  SEP.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vddsf") [,5,8]
  SEP.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(SEP.nbdsf.ought) <- sprintf("nbdsf.200%s.sep", names(SEP.nbdsf.ought))
names(SEP.nddsf.ought) <- sprintf("nddsf.200%s.sep", names(SEP.nddsf.ought))
names(SEP.vbdsf.ought) <- sprintf("vbdsf.200%s.sep", names(SEP.vbdsf.ought))
names(SEP.vddsf.ought) <- sprintf("vddsf.200%s.sep", names(SEP.vddsf.ought))

SEP.nbdsf.teen <- vector('list', 9)
SEP.nddsf.teen <- vector('list', 9)
SEP.vbdsf.teen <- vector('list', 9)
SEP.vddsf.teen <- vector('list', 9)
names(SEP.nbdsf.teen) <- 10:18
names(SEP.nddsf.teen) <- 10:18
names(SEP.vbdsf.teen) <- 10:18
names(SEP.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nddsf") [,5,8]
  SEP.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vddsf") [,5,8]
  SEP.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(SEP.nbdsf.teen) <- sprintf("nbdsf.20%s.sep", names(SEP.nbdsf.teen))
names(SEP.nddsf.teen) <- sprintf("nddsf.20%s.sep", names(SEP.nddsf.teen))
names(SEP.vbdsf.teen) <- sprintf("vbdsf.20%s.sep", names(SEP.vbdsf.teen))
names(SEP.vddsf.teen) <- sprintf("vddsf.20%s.sep", names(SEP.vddsf.teen))

SEP.max.irrad <- sum(
  max(SEP.nbdsf.ought$nbdsf.2007.sep,SEP.nbdsf.ought$nbdsf.2008.sep,SEP.nbdsf.ought$nbdsf.2009.sep,+
        SEP.nbdsf.teen$nbdsf.2010.sep,SEP.nbdsf.teen$nbdsf.2011.sep,SEP.nbdsf.teen$nbdsf.2012.sep,+
        SEP.nbdsf.teen$nbdsf.2013.sep,SEP.nbdsf.teen$nbdsf.2014.sep,SEP.nbdsf.teen$nbdsf.2015.sep,+
        SEP.nbdsf.teen$nbdsf.2016.sep,SEP.nbdsf.teen$nbdsf.2017.sep,SEP.nbdsf.teen$nbdsf.2018.sep),
  max(SEP.nddsf.ought$nddsf.2007.sep,SEP.nddsf.ought$nddsf.2008.sep,SEP.nddsf.ought$nddsf.2009.sep,+
        SEP.nddsf.teen$nddsf.2010.sep,SEP.nddsf.teen$nddsf.2011.sep,SEP.nddsf.teen$nddsf.2012.sep,+
        SEP.nddsf.teen$nddsf.2013.sep,SEP.nddsf.teen$nddsf.2014.sep,SEP.nddsf.teen$nddsf.2015.sep,+
        SEP.nddsf.teen$nddsf.2016.sep,SEP.nddsf.teen$nddsf.2017.sep,SEP.nddsf.teen$nddsf.2018.sep),
  max(SEP.vbdsf.ought$vbdsf.2007.sep,SEP.vbdsf.ought$vbdsf.2008.sep,SEP.vbdsf.ought$vbdsf.2009.sep,+
        SEP.vbdsf.teen$vbdsf.2010.sep,SEP.vbdsf.teen$vbdsf.2011.sep,SEP.vbdsf.teen$vbdsf.2012.sep,+
        SEP.vbdsf.teen$vbdsf.2013.sep,SEP.vbdsf.teen$vbdsf.2014.sep,SEP.vbdsf.teen$vbdsf.2015.sep,+
        SEP.vbdsf.teen$vbdsf.2016.sep,SEP.vbdsf.teen$vbdsf.2017.sep,SEP.vbdsf.teen$vbdsf.2018.sep),
  max(SEP.vddsf.ought$vddsf.2007.sep,SEP.vddsf.ought$vddsf.2008.sep,SEP.vddsf.ought$vddsf.2009.sep,+
        SEP.vddsf.teen$vddsf.2010.sep,SEP.vddsf.teen$vddsf.2011.sep,SEP.vddsf.teen$vddsf.2012.sep,+
        SEP.vddsf.teen$vddsf.2013.sep,SEP.vddsf.teen$vddsf.2014.sep,SEP.vddsf.teen$vddsf.2015.sep,+
        SEP.vddsf.teen$vddsf.2016.sep,SEP.vddsf.teen$vddsf.2017.sep,SEP.vddsf.teen$vddsf.2018.sep)
)

# october
OCT.nbdsf.ought <- vector('list', 3)
OCT.nddsf.ought <- vector('list', 3)
OCT.vbdsf.ought <- vector('list', 3)
OCT.vddsf.ought <- vector('list', 3)
names(OCT.nbdsf.ought) <- 7:9
names(OCT.nddsf.ought) <- 7:9
names(OCT.vbdsf.ought) <- 7:9
names(OCT.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nddsf") [,5,8]
  OCT.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vddsf") [,5,8]
  OCT.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(OCT.nbdsf.ought) <- sprintf("nbdsf.200%s.oct", names(OCT.nbdsf.ought))
names(OCT.nddsf.ought) <- sprintf("nddsf.200%s.oct", names(OCT.nddsf.ought))
names(OCT.vbdsf.ought) <- sprintf("vbdsf.200%s.oct", names(OCT.vbdsf.ought))
names(OCT.vddsf.ought) <- sprintf("vddsf.200%s.oct", names(OCT.vddsf.ought))

OCT.nbdsf.teen <- vector('list', 9)
OCT.nddsf.teen <- vector('list', 9)
OCT.vbdsf.teen <- vector('list', 9)
OCT.vddsf.teen <- vector('list', 9)
names(OCT.nbdsf.teen) <- 10:18
names(OCT.nddsf.teen) <- 10:18
names(OCT.vbdsf.teen) <- 10:18
names(OCT.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nddsf") [,5,8]
  OCT.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vddsf") [,5,8]
  OCT.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(OCT.nbdsf.teen) <- sprintf("nbdsf.20%s.oct", names(OCT.nbdsf.teen))
names(OCT.nddsf.teen) <- sprintf("nddsf.20%s.oct", names(OCT.nddsf.teen))
names(OCT.vbdsf.teen) <- sprintf("vbdsf.20%s.oct", names(OCT.vbdsf.teen))
names(OCT.vddsf.teen) <- sprintf("vddsf.20%s.oct", names(OCT.vddsf.teen))

OCT.max.irrad <- sum(
  max(OCT.nbdsf.ought$nbdsf.2007.oct,OCT.nbdsf.ought$nbdsf.2008.oct,OCT.nbdsf.ought$nbdsf.2009.oct,+
        OCT.nbdsf.teen$nbdsf.2010.oct,OCT.nbdsf.teen$nbdsf.2011.oct,OCT.nbdsf.teen$nbdsf.2012.oct,+
        OCT.nbdsf.teen$nbdsf.2013.oct,OCT.nbdsf.teen$nbdsf.2014.oct,OCT.nbdsf.teen$nbdsf.2015.oct,+
        OCT.nbdsf.teen$nbdsf.2016.oct,OCT.nbdsf.teen$nbdsf.2017.oct,OCT.nbdsf.teen$nbdsf.2018.oct),
  max(OCT.nddsf.ought$nddsf.2007.oct,OCT.nddsf.ought$nddsf.2008.oct,OCT.nddsf.ought$nddsf.2009.oct,+
        OCT.nddsf.teen$nddsf.2010.oct,OCT.nddsf.teen$nddsf.2011.oct,OCT.nddsf.teen$nddsf.2012.oct,+
        OCT.nddsf.teen$nddsf.2013.oct,OCT.nddsf.teen$nddsf.2014.oct,OCT.nddsf.teen$nddsf.2015.oct,+
        OCT.nddsf.teen$nddsf.2016.oct,OCT.nddsf.teen$nddsf.2017.oct,OCT.nddsf.teen$nddsf.2018.oct),
  max(OCT.vbdsf.ought$vbdsf.2007.oct,OCT.vbdsf.ought$vbdsf.2008.oct,OCT.vbdsf.ought$vbdsf.2009.oct,+
        OCT.vbdsf.teen$vbdsf.2010.oct,OCT.vbdsf.teen$vbdsf.2011.oct,OCT.vbdsf.teen$vbdsf.2012.oct,+
        OCT.vbdsf.teen$vbdsf.2013.oct,OCT.vbdsf.teen$vbdsf.2014.oct,OCT.vbdsf.teen$vbdsf.2015.oct,+
        OCT.vbdsf.teen$vbdsf.2016.oct,OCT.vbdsf.teen$vbdsf.2017.oct,OCT.vbdsf.teen$vbdsf.2018.oct),
  max(OCT.vddsf.ought$vddsf.2007.oct,OCT.vddsf.ought$vddsf.2008.oct,OCT.vddsf.ought$vddsf.2009.oct,+
        OCT.vddsf.teen$vddsf.2010.oct,OCT.vddsf.teen$vddsf.2011.oct,OCT.vddsf.teen$vddsf.2012.oct,+
        OCT.vddsf.teen$vddsf.2013.oct,OCT.vddsf.teen$vddsf.2014.oct,OCT.vddsf.teen$vddsf.2015.oct,+
        OCT.vddsf.teen$vddsf.2016.oct,OCT.vddsf.teen$vddsf.2017.oct,OCT.vddsf.teen$vddsf.2018.oct)
)

# november
NOV.nbdsf.ought <- vector('list', 3)
NOV.nddsf.ought <- vector('list', 3)
NOV.vbdsf.ought <- vector('list', 3)
NOV.vddsf.ought <- vector('list', 3)
names(NOV.nbdsf.ought) <- 7:9
names(NOV.nddsf.ought) <- 7:9
names(NOV.vbdsf.ought) <- 7:9
names(NOV.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nddsf") [,5,8]
  NOV.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vddsf") [,5,8]
  NOV.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(NOV.nbdsf.ought) <- sprintf("nbdsf.200%s.nov", names(NOV.nbdsf.ought))
names(NOV.nddsf.ought) <- sprintf("nddsf.200%s.nov", names(NOV.nddsf.ought))
names(NOV.vbdsf.ought) <- sprintf("vbdsf.200%s.nov", names(NOV.vbdsf.ought))
names(NOV.vddsf.ought) <- sprintf("vddsf.200%s.nov", names(NOV.vddsf.ought))

NOV.nbdsf.teen <- vector('list', 9)
NOV.nddsf.teen <- vector('list', 9)
NOV.vbdsf.teen <- vector('list', 9)
NOV.vddsf.teen <- vector('list', 9)
names(NOV.nbdsf.teen) <- 10:18
names(NOV.nddsf.teen) <- 10:18
names(NOV.vbdsf.teen) <- 10:18
names(NOV.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nddsf") [,5,8]
  NOV.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vddsf") [,5,8]
  NOV.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(NOV.nbdsf.teen) <- sprintf("nbdsf.20%s.nov", names(NOV.nbdsf.teen))
names(NOV.nddsf.teen) <- sprintf("nddsf.20%s.nov", names(NOV.nddsf.teen))
names(NOV.vbdsf.teen) <- sprintf("vbdsf.20%s.nov", names(NOV.vbdsf.teen))
names(NOV.vddsf.teen) <- sprintf("vddsf.20%s.nov", names(NOV.vddsf.teen))

NOV.max.irrad <- sum(
  max(NOV.nbdsf.ought$nbdsf.2007.nov,NOV.nbdsf.ought$nbdsf.2008.nov,NOV.nbdsf.ought$nbdsf.2009.nov,+
        NOV.nbdsf.teen$nbdsf.2010.nov,NOV.nbdsf.teen$nbdsf.2011.nov,NOV.nbdsf.teen$nbdsf.2012.nov,+
        NOV.nbdsf.teen$nbdsf.2013.nov,NOV.nbdsf.teen$nbdsf.2014.nov,NOV.nbdsf.teen$nbdsf.2015.nov,+
        NOV.nbdsf.teen$nbdsf.2016.nov,NOV.nbdsf.teen$nbdsf.2017.nov,NOV.nbdsf.teen$nbdsf.2018.nov),
  max(NOV.nddsf.ought$nddsf.2007.nov,NOV.nddsf.ought$nddsf.2008.nov,NOV.nddsf.ought$nddsf.2009.nov,+
        NOV.nddsf.teen$nddsf.2010.nov,NOV.nddsf.teen$nddsf.2011.nov,NOV.nddsf.teen$nddsf.2012.nov,+
        NOV.nddsf.teen$nddsf.2013.nov,NOV.nddsf.teen$nddsf.2014.nov,NOV.nddsf.teen$nddsf.2015.nov,+
        NOV.nddsf.teen$nddsf.2016.nov,NOV.nddsf.teen$nddsf.2017.nov,NOV.nddsf.teen$nddsf.2018.nov),
  max(NOV.vbdsf.ought$vbdsf.2007.nov,NOV.vbdsf.ought$vbdsf.2008.nov,NOV.vbdsf.ought$vbdsf.2009.nov,+
        NOV.vbdsf.teen$vbdsf.2010.nov,NOV.vbdsf.teen$vbdsf.2011.nov,NOV.vbdsf.teen$vbdsf.2012.nov,+
        NOV.vbdsf.teen$vbdsf.2013.nov,NOV.vbdsf.teen$vbdsf.2014.nov,NOV.vbdsf.teen$vbdsf.2015.nov,+
        NOV.vbdsf.teen$vbdsf.2016.nov,NOV.vbdsf.teen$vbdsf.2017.nov,NOV.vbdsf.teen$vbdsf.2018.nov),
  max(NOV.vddsf.ought$vddsf.2007.nov,NOV.vddsf.ought$vddsf.2008.nov,NOV.vddsf.ought$vddsf.2009.nov,+
        NOV.vddsf.teen$vddsf.2010.nov,NOV.vddsf.teen$vddsf.2011.nov,NOV.vddsf.teen$vddsf.2012.nov,+
        NOV.vddsf.teen$vddsf.2013.nov,NOV.vddsf.teen$vddsf.2014.nov,NOV.vddsf.teen$vddsf.2015.nov,+
        NOV.vddsf.teen$vddsf.2016.nov,NOV.vddsf.teen$vddsf.2017.nov,NOV.vddsf.teen$vddsf.2018.nov)
)

# december
DEC.nbdsf.ought <- vector('list', 3)
DEC.nddsf.ought <- vector('list', 3)
DEC.vbdsf.ought <- vector('list', 3)
DEC.vddsf.ought <- vector('list', 3)
names(DEC.nbdsf.ought) <- 7:9
names(DEC.nddsf.ought) <- 7:9
names(DEC.vbdsf.ought) <- 7:9
names(DEC.vddsf.ought) <- 7:9
for (i in 7:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nbdsf.ought[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nddsf") [,5,8]
  DEC.nddsf.ought[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vbdsf.ought[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vddsf") [,5,8]
  DEC.vddsf.ought[[as.character(i)]] <- max(vddsf)
}
names(DEC.nbdsf.ought) <- sprintf("nbdsf.200%s.dec", names(DEC.nbdsf.ought))
names(DEC.nddsf.ought) <- sprintf("nddsf.200%s.dec", names(DEC.nddsf.ought))
names(DEC.vbdsf.ought) <- sprintf("vbdsf.200%s.dec", names(DEC.vbdsf.ought))
names(DEC.vddsf.ought) <- sprintf("vddsf.200%s.dec", names(DEC.vddsf.ought))

DEC.nbdsf.teen <- vector('list', 9)
DEC.nddsf.teen <- vector('list', 9)
DEC.vbdsf.teen <- vector('list', 9)
DEC.vddsf.teen <- vector('list', 9)
names(DEC.nbdsf.teen) <- 10:18
names(DEC.nddsf.teen) <- 10:18
names(DEC.vbdsf.teen) <- 10:18
names(DEC.vddsf.teen) <- 10:18
for (i in 10:18)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nbdsf.teen[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nddsf") [,5,8]
  DEC.nddsf.teen[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vbdsf.teen[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vddsf") [,5,8]
  DEC.vddsf.teen[[as.character(i)]] <- max(vddsf)
}
names(DEC.nbdsf.teen) <- sprintf("nbdsf.20%s.dec", names(DEC.nbdsf.teen))
names(DEC.nddsf.teen) <- sprintf("nddsf.20%s.dec", names(DEC.nddsf.teen))
names(DEC.vbdsf.teen) <- sprintf("vbdsf.20%s.dec", names(DEC.vbdsf.teen))
names(DEC.vddsf.teen) <- sprintf("vddsf.20%s.dec", names(DEC.vddsf.teen))

DEC.max.irrad <- sum(
  max(DEC.nbdsf.ought$nbdsf.2007.dec,DEC.nbdsf.ought$nbdsf.2008.dec,DEC.nbdsf.ought$nbdsf.2009.dec,+
        DEC.nbdsf.teen$nbdsf.2010.dec,DEC.nbdsf.teen$nbdsf.2011.dec,DEC.nbdsf.teen$nbdsf.2012.dec,+
        DEC.nbdsf.teen$nbdsf.2013.dec,DEC.nbdsf.teen$nbdsf.2014.dec,DEC.nbdsf.teen$nbdsf.2015.dec,+
        DEC.nbdsf.teen$nbdsf.2016.dec,DEC.nbdsf.teen$nbdsf.2017.dec,DEC.nbdsf.teen$nbdsf.2018.dec),
  max(DEC.nddsf.ought$nddsf.2007.dec,DEC.nddsf.ought$nddsf.2008.dec,DEC.nddsf.ought$nddsf.2009.dec,+
        DEC.nddsf.teen$nddsf.2010.dec,DEC.nddsf.teen$nddsf.2011.dec,DEC.nddsf.teen$nddsf.2012.dec,+
        DEC.nddsf.teen$nddsf.2013.dec,DEC.nddsf.teen$nddsf.2014.dec,DEC.nddsf.teen$nddsf.2015.dec,+
        DEC.nddsf.teen$nddsf.2016.dec,DEC.nddsf.teen$nddsf.2017.dec,DEC.nddsf.teen$nddsf.2018.dec),
  max(DEC.vbdsf.ought$vbdsf.2007.dec,DEC.vbdsf.ought$vbdsf.2008.dec,DEC.vbdsf.ought$vbdsf.2009.dec,+
        DEC.vbdsf.teen$vbdsf.2010.dec,DEC.vbdsf.teen$vbdsf.2011.dec,DEC.vbdsf.teen$vbdsf.2012.dec,+
        DEC.vbdsf.teen$vbdsf.2013.dec,DEC.vbdsf.teen$vbdsf.2014.dec,DEC.vbdsf.teen$vbdsf.2015.dec,+
        DEC.vbdsf.teen$vbdsf.2016.dec,DEC.vbdsf.teen$vbdsf.2017.dec,DEC.vbdsf.teen$vbdsf.2018.dec),
  max(DEC.vddsf.ought$vddsf.2007.dec,DEC.vddsf.ought$vddsf.2008.dec,DEC.vddsf.ought$vddsf.2009.dec,+
        DEC.vddsf.teen$vddsf.2010.dec,DEC.vddsf.teen$vddsf.2011.dec,DEC.vddsf.teen$vddsf.2012.dec,+
        DEC.vddsf.teen$vddsf.2013.dec,DEC.vddsf.teen$vddsf.2014.dec,DEC.vddsf.teen$vddsf.2015.dec,+
        DEC.vddsf.teen$vddsf.2016.dec,DEC.vddsf.teen$vddsf.2017.dec,DEC.vddsf.teen$vddsf.2018.dec)
)

irrad.max.by.month <- c(JAN.max.irrad,FEB.max.irrad,MAR.max.irrad,APR.max.irrad,MAY.max.irrad,+
                          JUN.max.irrad,JUL.max.irrad,AUG.max.irrad,SEP.max.irrad,OCT.max.irrad,+
                          NOV.max.irrad,DEC.max.irrad)

plot(irrad.max.by.month, ylab='max irradiance [W/m^2]',xlab='month')
################################
# Saturation Vapor Pressure (es) [kPa]
# calculated from mean temperature
################################
JAN.es.mean <- (6.116441 * 10 ^ ((7.591386 * JAN.tmp) / (JAN.tmp + 240.7263))) / 10
FEB.es.mean <- (6.116441 * 10 ^ ((7.591386 * FEB.tmp) / (FEB.tmp + 240.7263))) / 10
MAR.es.mean <- (6.116441 * 10 ^ ((7.591386 * MAR.tmp) / (MAR.tmp + 240.7263))) / 10
APR.es.mean <- (6.116441 * 10 ^ ((7.591386 * APR.tmp) / (APR.tmp + 240.7263))) / 10
MAY.es.mean <- (6.116441 * 10 ^ ((7.591386 * MAY.tmp) / (MAY.tmp + 240.7263))) / 10
JUN.es.mean <- (6.116441 * 10 ^ ((7.591386 * JUN.tmp) / (JUN.tmp + 240.7263))) / 10
JUL.es.mean <- (6.116441 * 10 ^ ((7.591386 * JUL.tmp) / (JUL.tmp + 240.7263))) / 10
AUG.es.mean <- (6.116441 * 10 ^ ((7.591386 * AUG.tmp) / (AUG.tmp + 240.7263))) / 10
SEP.es.mean <- (6.116441 * 10 ^ ((7.591386 * SEP.tmp) / (SEP.tmp + 240.7263))) / 10
OCT.es.mean <- (6.116441 * 10 ^ ((7.591386 * OCT.tmp) / (OCT.tmp + 240.7263))) / 10
NOV.es.mean <- (6.116441 * 10 ^ ((7.591386 * NOV.tmp) / (NOV.tmp + 240.7263))) / 10
DEC.es.mean <- (6.116441 * 10 ^ ((7.591386 * DEC.tmp) / (DEC.tmp + 240.7263))) / 10

es.mean.by.month <- c(JAN.es.mean,FEB.es.mean,MAR.es.mean,APR.es.mean,MAY.es.mean,JUN.es.mean,+
                        JUL.es.mean,AUG.es.mean,SEP.es.mean,OCT.es.mean,NOV.es.mean,DEC.es.mean)

plot(es.mean.by.month,ylab='saturation vapor pressure (es) [kPa]',xlab='month')
################################
# Ambient Vapor Pressure
# pres = pressure [Pa]
# sh = specific humidity = Qair [kgH2O/kgAIR]
################################
# january
JAN.pres.ought <- vector('list', 3)
JAN.qair.ought <- vector('list', 3)
names(JAN.pres.ought) <- 7:9
names(JAN.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "pres") [,5,8]
  JAN.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "sh") [,5,8]
  JAN.qair.ought[[as.character(i)]] <- mean(qair)
}
names(JAN.pres.ought) <- sprintf("pres.200%s.jan", names(JAN.pres.ought))
names(JAN.qair.ought) <- sprintf("qair.200%s.jan", names(JAN.qair.ought))

JAN.pres.teen <- vector('list', 10)
JAN.qair.teen <- vector('list', 10)
names(JAN.pres.teen) <- 10:19
names(JAN.qair.teen) <- 10:19
for (i in 10:19)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "pres") [,5,8]
  JAN.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "sh") [,5,8]
  JAN.qair.teen[[as.character(i)]] <- mean(qair)
}
names(JAN.pres.teen) <- sprintf("pres.20%s.jan", names(JAN.pres.teen))
names(JAN.qair.teen) <- sprintf("qair.20%s.jan", names(JAN.qair.teen))

JAN.mean.pres <- mean(JAN.pres.ought$pres.2007.jan,JAN.pres.ought$pres.2008.jan,JAN.pres.ought$pres.2009.jan,+
                        JAN.pres.teen$pres.2010.jan,JAN.pres.teen$pres.2011.jan,JAN.pres.teen$pres.2012.jan,+
                        JAN.pres.teen$pres.2013.jan,JAN.pres.teen$pres.2014.jan,JAN.pres.teen$pres.2015.jan,+
                        JAN.pres.teen$pres.2016.jan,JAN.pres.teen$pres.2017.jan,JAN.pres.teen$pres.2018.jan,JAN.pres.teen$pres.2019.jan)
JAN.mean.qair <- mean(JAN.qair.ought$qair.2007.jan,JAN.qair.ought$qair.2008.jan,JAN.qair.ought$qair.2009.jan,+
                        JAN.qair.teen$qair.2010.jan,JAN.qair.teen$qair.2011.jan,JAN.qair.teen$qair.2012.jan,+
                        JAN.qair.teen$qair.2013.jan,JAN.qair.teen$qair.2014.jan,JAN.qair.teen$qair.2015.jan,+
                        JAN.qair.teen$qair.2016.jan,JAN.qair.teen$qair.2017.jan,JAN.qair.teen$qair.2018.jan,JAN.qair.teen$qair.2019.jan)
JAN.ea <- (JAN.mean.pres * JAN.mean.qair / (0.378 * JAN.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# february
FEB.pres.ought <- vector('list', 3)
FEB.qair.ought <- vector('list', 3)
names(FEB.pres.ought) <- 7:9
names(FEB.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "pres") [,5,8]
  FEB.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "sh") [,5,8]
  FEB.qair.ought[[as.character(i)]] <- mean(qair)
}
names(FEB.pres.ought) <- sprintf("pres.200%s.feb", names(FEB.pres.ought))
names(FEB.qair.ought) <- sprintf("qair.200%s.feb", names(FEB.qair.ought))

FEB.pres.teen <- vector('list', 10)
FEB.qair.teen <- vector('list', 10)
names(FEB.pres.teen) <- 10:19
names(FEB.qair.teen) <- 10:19
for (i in 10:19)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "pres") [,5,8]
  FEB.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "sh") [,5,8]
  FEB.qair.teen[[as.character(i)]] <- mean(qair)
}
names(FEB.pres.teen) <- sprintf("pres.20%s.feb", names(FEB.pres.teen))
names(FEB.qair.teen) <- sprintf("qair.20%s.feb", names(FEB.qair.teen))

FEB.mean.pres <- mean(FEB.pres.ought$pres.2007.feb,FEB.pres.ought$pres.2008.feb,FEB.pres.ought$pres.2009.feb,+
                        FEB.pres.teen$pres.2010.feb,FEB.pres.teen$pres.2011.feb,FEB.pres.teen$pres.2012.feb,+
                        FEB.pres.teen$pres.2013.feb,FEB.pres.teen$pres.2014.feb,FEB.pres.teen$pres.2015.feb,+
                        FEB.pres.teen$pres.2016.feb,FEB.pres.teen$pres.2017.feb,FEB.pres.teen$pres.2018.feb,FEB.pres.teen$pres.2019.feb)
FEB.mean.qair <- mean(FEB.qair.ought$qair.2007.feb,FEB.qair.ought$qair.2008.feb,FEB.qair.ought$qair.2009.feb,+
                        FEB.qair.teen$qair.2010.feb,FEB.qair.teen$qair.2011.feb,FEB.qair.teen$qair.2012.feb,+
                        FEB.qair.teen$qair.2013.feb,FEB.qair.teen$qair.2014.feb,FEB.qair.teen$qair.2015.feb,+
                        FEB.qair.teen$qair.2016.feb,FEB.qair.teen$qair.2017.feb,FEB.qair.teen$qair.2018.feb,FEB.qair.teen$qair.2019.feb)
FEB.ea <- (FEB.mean.pres * FEB.mean.qair / (0.378 * FEB.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# march
MAR.pres.ought <- vector('list', 3)
MAR.qair.ought <- vector('list', 3)
names(MAR.pres.ought) <- 7:9
names(MAR.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "pres") [,5,8]
  MAR.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "sh") [,5,8]
  MAR.qair.ought[[as.character(i)]] <- mean(qair)
}
names(MAR.pres.ought) <- sprintf("pres.200%s.mar", names(MAR.pres.ought))
names(MAR.qair.ought) <- sprintf("qair.200%s.mar", names(MAR.qair.ought))

MAR.pres.teen <- vector('list', 10)
MAR.qair.teen <- vector('list', 10)
names(MAR.pres.teen) <- 10:19
names(MAR.qair.teen) <- 10:19
for (i in 10:19)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "pres") [,5,8]
  MAR.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "sh") [,5,8]
  MAR.qair.teen[[as.character(i)]] <- mean(qair)
}
names(MAR.pres.teen) <- sprintf("pres.20%s.mar", names(MAR.pres.teen))
names(MAR.qair.teen) <- sprintf("qair.20%s.mar", names(MAR.qair.teen))

MAR.mean.pres <- mean(MAR.pres.ought$pres.2007.mar,MAR.pres.ought$pres.2008.mar,MAR.pres.ought$pres.2009.mar,+
                        MAR.pres.teen$pres.2010.mar,MAR.pres.teen$pres.2011.mar,MAR.pres.teen$pres.2012.mar,+
                        MAR.pres.teen$pres.2013.mar,MAR.pres.teen$pres.2014.mar,MAR.pres.teen$pres.2015.mar,+
                        MAR.pres.teen$pres.2016.mar,MAR.pres.teen$pres.2017.mar,MAR.pres.teen$pres.2018.mar,MAR.pres.teen$pres.2019.mar)
MAR.mean.qair <- mean(MAR.qair.ought$qair.2007.mar,MAR.qair.ought$qair.2008.mar,MAR.qair.ought$qair.2009.mar,+
                        MAR.qair.teen$qair.2010.mar,MAR.qair.teen$qair.2011.mar,MAR.qair.teen$qair.2012.mar,+
                        MAR.qair.teen$qair.2013.mar,MAR.qair.teen$qair.2014.mar,MAR.qair.teen$qair.2015.mar,+
                        MAR.qair.teen$qair.2016.mar,MAR.qair.teen$qair.2017.mar,MAR.qair.teen$qair.2018.mar,MAR.qair.teen$qair.2019.mar)
MAR.ea <- (MAR.mean.pres * MAR.mean.qair / (0.378 * MAR.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# april
APR.pres.ought <- vector('list', 3)
APR.qair.ought <- vector('list', 3)
names(APR.pres.ought) <- 7:9
names(APR.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "pres") [,5,8]
  APR.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "sh") [,5,8]
  APR.qair.ought[[as.character(i)]] <- mean(qair)
}
names(APR.pres.ought) <- sprintf("pres.200%s.apr", names(APR.pres.ought))
names(APR.qair.ought) <- sprintf("qair.200%s.apr", names(APR.qair.ought))

APR.pres.teen <- vector('list', 10)
APR.qair.teen <- vector('list', 10)
names(APR.pres.teen) <- 10:19
names(APR.qair.teen) <- 10:19
for (i in 10:19)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "pres") [,5,8]
  APR.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "sh") [,5,8]
  APR.qair.teen[[as.character(i)]] <- mean(qair)
}
names(APR.pres.teen) <- sprintf("pres.20%s.apr", names(APR.pres.teen))
names(APR.qair.teen) <- sprintf("qair.20%s.apr", names(APR.qair.teen))

APR.mean.pres <- mean(APR.pres.ought$pres.2007.apr,APR.pres.ought$pres.2008.apr,APR.pres.ought$pres.2009.apr,+
                        APR.pres.teen$pres.2010.apr,APR.pres.teen$pres.2011.apr,APR.pres.teen$pres.2012.apr,+
                        APR.pres.teen$pres.2013.apr,APR.pres.teen$pres.2014.apr,APR.pres.teen$pres.2015.apr,+
                        APR.pres.teen$pres.2016.apr,APR.pres.teen$pres.2017.apr,APR.pres.teen$pres.2018.apr,APR.pres.teen$pres.2019.apr)
APR.mean.qair <- mean(APR.qair.ought$qair.2007.apr,APR.qair.ought$qair.2008.apr,APR.qair.ought$qair.2009.apr,+
                        APR.qair.teen$qair.2010.apr,APR.qair.teen$qair.2011.apr,APR.qair.teen$qair.2012.apr,+
                        APR.qair.teen$qair.2013.apr,APR.qair.teen$qair.2014.apr,APR.qair.teen$qair.2015.apr,+
                        APR.qair.teen$qair.2016.apr,APR.qair.teen$qair.2017.apr,APR.qair.teen$qair.2018.apr,APR.qair.teen$qair.2019.apr)
APR.ea <- (APR.mean.pres * APR.mean.qair / (0.378 * APR.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# may
MAY.pres.ought <- vector('list', 3)
MAY.qair.ought <- vector('list', 3)
names(MAY.pres.ought) <- 7:9
names(MAY.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "pres") [,5,8]
  MAY.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "sh") [,5,8]
  MAY.qair.ought[[as.character(i)]] <- mean(qair)
}
names(MAY.pres.ought) <- sprintf("pres.200%s.may", names(MAY.pres.ought))
names(MAY.qair.ought) <- sprintf("qair.200%s.may", names(MAY.qair.ought))

MAY.pres.teen <- vector('list', 9)
MAY.qair.teen <- vector('list', 9)
names(MAY.pres.teen) <- 10:18
names(MAY.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "pres") [,5,8]
  MAY.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "sh") [,5,8]
  MAY.qair.teen[[as.character(i)]] <- mean(qair)
}
names(MAY.pres.teen) <- sprintf("pres.20%s.may", names(MAY.pres.teen))
names(MAY.qair.teen) <- sprintf("qair.20%s.may", names(MAY.qair.teen))

MAY.mean.pres <- mean(MAY.pres.ought$pres.2007.may,MAY.pres.ought$pres.2008.may,MAY.pres.ought$pres.2009.may,+
                        MAY.pres.teen$pres.2010.may,MAY.pres.teen$pres.2011.may,MAY.pres.teen$pres.2012.may,+
                        MAY.pres.teen$pres.2013.may,MAY.pres.teen$pres.2014.may,MAY.pres.teen$pres.2015.may,+
                        MAY.pres.teen$pres.2016.may,MAY.pres.teen$pres.2017.may,MAY.pres.teen$pres.2018.may)
MAY.mean.qair <- mean(MAY.qair.ought$qair.2007.may,MAY.qair.ought$qair.2008.may,MAY.qair.ought$qair.2009.may,+
                        MAY.qair.teen$qair.2010.may,MAY.qair.teen$qair.2011.may,MAY.qair.teen$qair.2012.may,+
                        MAY.qair.teen$qair.2013.may,MAY.qair.teen$qair.2014.may,MAY.qair.teen$qair.2015.may,+
                        MAY.qair.teen$qair.2016.may,MAY.qair.teen$qair.2017.may,MAY.qair.teen$qair.2018.may)
MAY.ea <- (MAY.mean.pres * MAY.mean.qair / (0.378 * MAY.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# june
JUN.pres.ought <- vector('list', 3)
JUN.qair.ought <- vector('list', 3)
names(JUN.pres.ought) <- 7:9
names(JUN.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "pres") [,5,8]
  JUN.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "sh") [,5,8]
  JUN.qair.ought[[as.character(i)]] <- mean(qair)
}
names(JUN.pres.ought) <- sprintf("pres.200%s.jun", names(JUN.pres.ought))
names(JUN.qair.ought) <- sprintf("qair.200%s.jun", names(JUN.qair.ought))

JUN.pres.teen <- vector('list', 9)
JUN.qair.teen <- vector('list', 9)
names(JUN.pres.teen) <- 10:18
names(JUN.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "pres") [,5,8]
  JUN.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "sh") [,5,8]
  JUN.qair.teen[[as.character(i)]] <- mean(qair)
}
names(JUN.pres.teen) <- sprintf("pres.20%s.jun", names(JUN.pres.teen))
names(JUN.qair.teen) <- sprintf("qair.20%s.jun", names(JUN.qair.teen))

JUN.mean.pres <- mean(JUN.pres.ought$pres.2007.jun,JUN.pres.ought$pres.2008.jun,JUN.pres.ought$pres.2009.jun,+
                        JUN.pres.teen$pres.2010.jun,JUN.pres.teen$pres.2011.jun,JUN.pres.teen$pres.2012.jun,+
                        JUN.pres.teen$pres.2013.jun,JUN.pres.teen$pres.2014.jun,JUN.pres.teen$pres.2015.jun,+
                        JUN.pres.teen$pres.2016.jun,JUN.pres.teen$pres.2017.jun,JUN.pres.teen$pres.2018.jun)
JUN.mean.qair <- mean(JUN.qair.ought$qair.2007.jun,JUN.qair.ought$qair.2008.jun,JUN.qair.ought$qair.2009.jun,+
                        JUN.qair.teen$qair.2010.jun,JUN.qair.teen$qair.2011.jun,JUN.qair.teen$qair.2012.jun,+
                        JUN.qair.teen$qair.2013.jun,JUN.qair.teen$qair.2014.jun,JUN.qair.teen$qair.2015.jun,+
                        JUN.qair.teen$qair.2016.jun,JUN.qair.teen$qair.2017.jun,JUN.qair.teen$qair.2018.jun)
JUN.ea <- (JUN.mean.pres * JUN.mean.qair / (0.378 * JUN.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# july
JUL.pres.ought <- vector('list', 3)
JUL.qair.ought <- vector('list', 3)
names(JUL.pres.ought) <- 7:9
names(JUL.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "pres") [,5,8]
  JUL.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "sh") [,5,8]
  JUL.qair.ought[[as.character(i)]] <- mean(qair)
}
names(JUL.pres.ought) <- sprintf("pres.200%s.jul", names(JUL.pres.ought))
names(JUL.qair.ought) <- sprintf("qair.200%s.jul", names(JUL.qair.ought))

JUL.pres.teen <- vector('list', 9)
JUL.qair.teen <- vector('list', 9)
names(JUL.pres.teen) <- 10:18
names(JUL.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "pres") [,5,8]
  JUL.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "sh") [,5,8]
  JUL.qair.teen[[as.character(i)]] <- mean(qair)
}
names(JUL.pres.teen) <- sprintf("pres.20%s.jul", names(JUL.pres.teen))
names(JUL.qair.teen) <- sprintf("qair.20%s.jul", names(JUL.qair.teen))

JUL.mean.pres <- mean(JUL.pres.ought$pres.2007.jul,JUL.pres.ought$pres.2008.jul,JUL.pres.ought$pres.2009.jul,+
                        JUL.pres.teen$pres.2010.jul,JUL.pres.teen$pres.2011.jul,JUL.pres.teen$pres.2012.jul,+
                        JUL.pres.teen$pres.2013.jul,JUL.pres.teen$pres.2014.jul,JUL.pres.teen$pres.2015.jul,+
                        JUL.pres.teen$pres.2016.jul,JUL.pres.teen$pres.2017.jul,JUL.pres.teen$pres.2018.jul)
JUL.mean.qair <- mean(JUL.qair.ought$qair.2007.jul,JUL.qair.ought$qair.2008.jul,JUL.qair.ought$qair.2009.jul,+
                        JUL.qair.teen$qair.2010.jul,JUL.qair.teen$qair.2011.jul,JUL.qair.teen$qair.2012.jul,+
                        JUL.qair.teen$qair.2013.jul,JUL.qair.teen$qair.2014.jul,JUL.qair.teen$qair.2015.jul,+
                        JUL.qair.teen$qair.2016.jul,JUL.qair.teen$qair.2017.jul,JUL.qair.teen$qair.2018.jul)
JUL.ea <- (JUL.mean.pres * JUL.mean.qair / (0.378 * JUL.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# august
AUG.pres.ought <- vector('list', 3)
AUG.qair.ought <- vector('list', 3)
names(AUG.pres.ought) <- 7:9
names(AUG.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "pres") [,5,8]
  AUG.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "sh") [,5,8]
  AUG.qair.ought[[as.character(i)]] <- mean(qair)
}
names(AUG.pres.ought) <- sprintf("pres.200%s.aug", names(AUG.pres.ought))
names(AUG.qair.ought) <- sprintf("qair.200%s.aug", names(AUG.qair.ought))

AUG.pres.teen <- vector('list', 9)
AUG.qair.teen <- vector('list', 9)
names(AUG.pres.teen) <- 10:18
names(AUG.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "pres") [,5,8]
  AUG.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "sh") [,5,8]
  AUG.qair.teen[[as.character(i)]] <- mean(qair)
}
names(AUG.pres.teen) <- sprintf("pres.20%s.aug", names(AUG.pres.teen))
names(AUG.qair.teen) <- sprintf("qair.20%s.aug", names(AUG.qair.teen))

AUG.mean.pres <- mean(AUG.pres.ought$pres.2007.aug,AUG.pres.ought$pres.2008.aug,AUG.pres.ought$pres.2009.aug,+
                        AUG.pres.teen$pres.2010.aug,AUG.pres.teen$pres.2011.aug,AUG.pres.teen$pres.2012.aug,+
                        AUG.pres.teen$pres.2013.aug,AUG.pres.teen$pres.2014.aug,AUG.pres.teen$pres.2015.aug,+
                        AUG.pres.teen$pres.2016.aug,AUG.pres.teen$pres.2017.aug,AUG.pres.teen$pres.2018.aug)
AUG.mean.qair <- mean(AUG.qair.ought$qair.2007.aug,AUG.qair.ought$qair.2008.aug,AUG.qair.ought$qair.2009.aug,+
                        AUG.qair.teen$qair.2010.aug,AUG.qair.teen$qair.2011.aug,AUG.qair.teen$qair.2012.aug,+
                        AUG.qair.teen$qair.2013.aug,AUG.qair.teen$qair.2014.aug,AUG.qair.teen$qair.2015.aug,+
                        AUG.qair.teen$qair.2016.aug,AUG.qair.teen$qair.2017.aug,AUG.qair.teen$qair.2018.aug)
AUG.ea <- (AUG.mean.pres * AUG.mean.qair / (0.378 * AUG.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# september
SEP.pres.ought <- vector('list', 3)
SEP.qair.ought <- vector('list', 3)
names(SEP.pres.ought) <- 7:9
names(SEP.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "pres") [,5,8]
  SEP.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "sh") [,5,8]
  SEP.qair.ought[[as.character(i)]] <- mean(qair)
}
names(SEP.pres.ought) <- sprintf("pres.200%s.sep", names(SEP.pres.ought))
names(SEP.qair.ought) <- sprintf("qair.200%s.sep", names(SEP.qair.ought))

SEP.pres.teen <- vector('list', 9)
SEP.qair.teen <- vector('list', 9)
names(SEP.pres.teen) <- 10:18
names(SEP.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "pres") [,5,8]
  SEP.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "sh") [,5,8]
  SEP.qair.teen[[as.character(i)]] <- mean(qair)
}
names(SEP.pres.teen) <- sprintf("pres.20%s.sep", names(SEP.pres.teen))
names(SEP.qair.teen) <- sprintf("qair.20%s.sep", names(SEP.qair.teen))

SEP.mean.pres <- mean(SEP.pres.ought$pres.2007.sep,SEP.pres.ought$pres.2008.sep,SEP.pres.ought$pres.2009.sep,+
                        SEP.pres.teen$pres.2010.sep,SEP.pres.teen$pres.2011.sep,SEP.pres.teen$pres.2012.sep,+
                        SEP.pres.teen$pres.2013.sep,SEP.pres.teen$pres.2014.sep,SEP.pres.teen$pres.2015.sep,+
                        SEP.pres.teen$pres.2016.sep,SEP.pres.teen$pres.2017.sep,SEP.pres.teen$pres.2018.sep)
SEP.mean.qair <- mean(SEP.qair.ought$qair.2007.sep,SEP.qair.ought$qair.2008.sep,SEP.qair.ought$qair.2009.sep,+
                        SEP.qair.teen$qair.2010.sep,SEP.qair.teen$qair.2011.sep,SEP.qair.teen$qair.2012.sep,+
                        SEP.qair.teen$qair.2013.sep,SEP.qair.teen$qair.2014.sep,SEP.qair.teen$qair.2015.sep,+
                        SEP.qair.teen$qair.2016.sep,SEP.qair.teen$qair.2017.sep,SEP.qair.teen$qair.2018.sep)
SEP.ea <- (SEP.mean.pres * SEP.mean.qair / (0.378 * SEP.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# october
OCT.pres.ought <- vector('list', 3)
OCT.qair.ought <- vector('list', 3)
names(OCT.pres.ought) <- 7:9
names(OCT.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "pres") [,5,8]
  OCT.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "sh") [,5,8]
  OCT.qair.ought[[as.character(i)]] <- mean(qair)
}
names(OCT.pres.ought) <- sprintf("pres.200%s.oct", names(OCT.pres.ought))
names(OCT.qair.ought) <- sprintf("qair.200%s.oct", names(OCT.qair.ought))

OCT.pres.teen <- vector('list', 9)
OCT.qair.teen <- vector('list', 9)
names(OCT.pres.teen) <- 10:18
names(OCT.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "pres") [,5,8]
  OCT.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "sh") [,5,8]
  OCT.qair.teen[[as.character(i)]] <- mean(qair)
}
names(OCT.pres.teen) <- sprintf("pres.20%s.oct", names(OCT.pres.teen))
names(OCT.qair.teen) <- sprintf("qair.20%s.oct", names(OCT.qair.teen))

OCT.mean.pres <- mean(OCT.pres.ought$pres.2007.oct,OCT.pres.ought$pres.2008.oct,OCT.pres.ought$pres.2009.oct,+
                        OCT.pres.teen$pres.2010.oct,OCT.pres.teen$pres.2011.oct,OCT.pres.teen$pres.2012.oct,+
                        OCT.pres.teen$pres.2013.oct,OCT.pres.teen$pres.2014.oct,OCT.pres.teen$pres.2015.oct,+
                        OCT.pres.teen$pres.2016.oct,OCT.pres.teen$pres.2017.oct,OCT.pres.teen$pres.2018.oct)
OCT.mean.qair <- mean(OCT.qair.ought$qair.2007.oct,OCT.qair.ought$qair.2008.oct,OCT.qair.ought$qair.2009.oct,+
                        OCT.qair.teen$qair.2010.oct,OCT.qair.teen$qair.2011.oct,OCT.qair.teen$qair.2012.oct,+
                        OCT.qair.teen$qair.2013.oct,OCT.qair.teen$qair.2014.oct,OCT.qair.teen$qair.2015.oct,+
                        OCT.qair.teen$qair.2016.oct,OCT.qair.teen$qair.2017.oct,OCT.qair.teen$qair.2018.oct)
OCT.ea <- (OCT.mean.pres * OCT.mean.qair / (0.378 * OCT.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# november
NOV.pres.ought <- vector('list', 3)
NOV.qair.ought <- vector('list', 3)
names(NOV.pres.ought) <- 7:9
names(NOV.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "pres") [,5,8]
  NOV.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "sh") [,5,8]
  NOV.qair.ought[[as.character(i)]] <- mean(qair)
}
names(NOV.pres.ought) <- sprintf("pres.200%s.nov", names(NOV.pres.ought))
names(NOV.qair.ought) <- sprintf("qair.200%s.nov", names(NOV.qair.ought))

NOV.pres.teen <- vector('list', 9)
NOV.qair.teen <- vector('list', 9)
names(NOV.pres.teen) <- 10:18
names(NOV.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "pres") [,5,8]
  NOV.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "sh") [,5,8]
  NOV.qair.teen[[as.character(i)]] <- mean(qair)
}
names(NOV.pres.teen) <- sprintf("pres.20%s.nov", names(NOV.pres.teen))
names(NOV.qair.teen) <- sprintf("qair.20%s.nov", names(NOV.qair.teen))

NOV.mean.pres <- mean(NOV.pres.ought$pres.2007.nov,NOV.pres.ought$pres.2008.nov,NOV.pres.ought$pres.2009.nov,+
                        NOV.pres.teen$pres.2010.nov,NOV.pres.teen$pres.2011.nov,NOV.pres.teen$pres.2012.nov,+
                        NOV.pres.teen$pres.2013.nov,NOV.pres.teen$pres.2014.nov,NOV.pres.teen$pres.2015.nov,+
                        NOV.pres.teen$pres.2016.nov,NOV.pres.teen$pres.2017.nov,NOV.pres.teen$pres.2018.nov)
NOV.mean.qair <- mean(NOV.qair.ought$qair.2007.nov,NOV.qair.ought$qair.2008.nov,NOV.qair.ought$qair.2009.nov,+
                        NOV.qair.teen$qair.2010.nov,NOV.qair.teen$qair.2011.nov,NOV.qair.teen$qair.2012.nov,+
                        NOV.qair.teen$qair.2013.nov,NOV.qair.teen$qair.2014.nov,NOV.qair.teen$qair.2015.nov,+
                        NOV.qair.teen$qair.2016.nov,NOV.qair.teen$qair.2017.nov,NOV.qair.teen$qair.2018.nov)
NOV.ea <- (NOV.mean.pres * NOV.mean.qair / (0.378 * NOV.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

# december
DEC.pres.ought <- vector('list', 3)
DEC.qair.ought <- vector('list', 3)
names(DEC.pres.ought) <- 7:9
names(DEC.qair.ought) <- 7:9
for (i in 7:9)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "pres") [,5,8]
  DEC.pres.ought[[as.character(i)]] <- mean(pres)/100
  #Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "sh") [,5,8]
  DEC.qair.ought[[as.character(i)]] <- mean(qair)
}
names(DEC.pres.ought) <- sprintf("pres.200%s.dec", names(DEC.pres.ought))
names(DEC.qair.ought) <- sprintf("qair.200%s.dec", names(DEC.qair.ought))

DEC.pres.teen <- vector('list', 9)
DEC.qair.teen <- vector('list', 9)
names(DEC.pres.teen) <- 10:18
names(DEC.qair.teen) <- 10:18
for (i in 10:18)
{
  pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "pres") [,5,8]
  DEC.pres.teen[[as.character(i)]] <- mean(pres)/100#Convert to millibars for calculation
  qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "sh") [,5,8]
  DEC.qair.teen[[as.character(i)]] <- mean(qair)
}
names(DEC.pres.teen) <- sprintf("pres.20%s.dec", names(DEC.pres.teen))
names(DEC.qair.teen) <- sprintf("qair.20%s.dec", names(DEC.qair.teen))

DEC.mean.pres <- mean(DEC.pres.ought$pres.2007.dec,DEC.pres.ought$pres.2008.dec,DEC.pres.ought$pres.2009.dec,+
                        DEC.pres.teen$pres.2010.dec,DEC.pres.teen$pres.2011.dec,DEC.pres.teen$pres.2012.dec,+
                        DEC.pres.teen$pres.2013.dec,DEC.pres.teen$pres.2014.dec,DEC.pres.teen$pres.2015.dec,+
                        DEC.pres.teen$pres.2016.dec,DEC.pres.teen$pres.2017.dec,DEC.pres.teen$pres.2018.dec)
DEC.mean.qair <- mean(DEC.qair.ought$qair.2007.dec,DEC.qair.ought$qair.2008.dec,DEC.qair.ought$qair.2009.dec,+
                        DEC.qair.teen$qair.2010.dec,DEC.qair.teen$qair.2011.dec,DEC.qair.teen$qair.2012.dec,+
                        DEC.qair.teen$qair.2013.dec,DEC.qair.teen$qair.2014.dec,DEC.qair.teen$qair.2015.dec,+
                        DEC.qair.teen$qair.2016.dec,DEC.qair.teen$qair.2017.dec,DEC.qair.teen$qair.2018.dec)
DEC.ea <- (DEC.mean.pres * DEC.mean.qair / (0.378 * DEC.mean.qair + 0.622)) / 10#Converts to kPa for TROLL

ea.mean.by.month <- c(JAN.ea,FEB.ea,MAR.ea,APR.ea,MAY.ea,JUN.ea,JUL.ea,AUG.ea,SEP.ea,OCT.ea,NOV.ea,DEC.ea)

plot(ea.mean.by.month,ylab='ambient vapor pressure mean [kPa]',xlab='month')

################################
# Vapor Pressure Deficit
# VPD_monthly_means = 24hr monthly means
################################
JAN.vpd.mean <- JAN.es.mean-JAN.ea
FEB.vpd.mean <- FEB.es.mean-FEB.ea
MAR.vpd.mean <- MAR.es.mean-MAR.ea
APR.vpd.mean <- APR.es.mean-APR.ea
MAY.vpd.mean <- MAY.es.mean-MAY.ea
JUN.vpd.mean <- JUN.es.mean-JUN.ea
JUL.vpd.mean <- JUL.es.mean-JUL.ea
AUG.vpd.mean <- AUG.es.mean-AUG.ea
SEP.vpd.mean <- SEP.es.mean-SEP.ea
OCT.vpd.mean <- OCT.es.mean-OCT.ea
NOV.vpd.mean <- NOV.es.mean-NOV.ea
DEC.vpd.mean <- DEC.es.mean-DEC.ea

vpd.mean.by.month <- c(JAN.vpd.mean,FEB.vpd.mean,MAR.vpd.mean,APR.vpd.mean,MAY.vpd.mean,JUN.vpd.mean,+
                         JUL.vpd.mean,AUG.vpd.mean,SEP.vpd.mean,OCT.vpd.mean,NOV.vpd.mean,DEC.vpd.mean)

plot(vpd.mean.by.month,xlab='month',ylab='VPD mean [kPa]')

################################
# VPD_monthly_max = maximum observed VPD in month
# VPD monthly max...
################################

JAN.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[1]) / (tmp.by.month.max[1] + 240.7263))) / 10
FEB.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[2]) / (tmp.by.month.max[2] + 240.7263))) / 10
MAR.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[3]) / (tmp.by.month.max[3] + 240.7263))) / 10
APR.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[4]) / (tmp.by.month.max[4] + 240.7263))) / 10
MAY.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[5]) / (tmp.by.month.max[5] + 240.7263))) / 10
JUN.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[6]) / (tmp.by.month.max[6] + 240.7263))) / 10
JUL.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[7]) / (tmp.by.month.max[7] + 240.7263))) / 10
AUG.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[8]) / (tmp.by.month.max[8] + 240.7263))) / 10
SEP.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[9]) / (tmp.by.month.max[9] + 240.7263))) / 10
OCT.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[10]) / (tmp.by.month.max[10] + 240.7263))) / 10
NOV.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[11]) / (tmp.by.month.max[11] + 240.7263))) / 10
DEC.es.max <- (6.116441 * 10 ^ ((7.591386 * tmp.by.month.max[12]) / (tmp.by.month.max[12] + 240.7263))) / 10

JAN.vpd.max <- JAN.es.max-JAN.ea
FEB.vpd.max <- FEB.es.max-FEB.ea
MAR.vpd.max <- MAR.es.max-MAR.ea
APR.vpd.max <- APR.es.max-APR.ea
MAY.vpd.max <- MAY.es.max-MAY.ea
JUN.vpd.max <- JUN.es.max-JUN.ea
JUL.vpd.max <- JUL.es.max-JUL.ea
AUG.vpd.max <- AUG.es.max-AUG.ea
SEP.vpd.max <- SEP.es.max-SEP.ea
OCT.vpd.max <- OCT.es.max-OCT.ea
NOV.vpd.max <- NOV.es.max-NOV.ea
DEC.vpd.max <- DEC.es.max-DEC.ea

vpd.max.by.month <- c(JAN.vpd.max,FEB.vpd.max,MAR.vpd.max,APR.vpd.max,MAY.vpd.max,JUN.vpd.max,+
                        JUL.vpd.max,AUG.vpd.max,SEP.vpd.max,OCT.vpd.max,NOV.vpd.max,DEC.vpd.max)

plot(vpd.max.by.month, xlab="month",ylab="Maximum VPD [kPa]")

################################
# VPD_day_monthly_means = mean daytime VPD, daytime will be where irradiance >10
# VPD daylight means...
################################
# january
JAN.daylight.vpd.ought <- vector("list", 3)
names(JAN.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  JAN.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "pres") [,5,8]
  JAN.pres <- JAN.pres/100 #Convert to millibars for calculation
  JAN.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "sh") [,5,8]
  JAN.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "nddsf") [,5,8]
  JAN.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "vddsf") [,5,8]
  JAN.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJAN.h5", i), "tmp") [,5,8]
  JAN.tmp <- data.frame(JAN.tmp - 273.15)
  JAN.ea <- (JAN.pres * JAN.qair / (0.378 * JAN.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JAN.es <- 6.116441 * 10 ^ ((7.591386 * JAN.tmp / (JAN.tmp + 240.7263))) / 10
  
  JAN.daily.vpd.raw.ought <- data.frame(cbind(JAN.ea,JAN.es,JAN.nbdsf,JAN.nddsf,JAN.vbdsf,JAN.vddsf))
  JAN.daily.vpd.raw.ought <- JAN.daily.vpd.raw.ought %>% mutate(total_irrad = JAN.nbdsf + JAN.nddsf + JAN.vbdsf + JAN.vddsf)
  JAN.ea.daylight.ought <- mean(JAN.daily.vpd.raw.ought$JAN.ea)
  JAN.es.daylight.ought <- mean(JAN.daily.vpd.raw.ought$JAN.tmp...273.15)
  
  JAN.daylight.vpd.ought[[as.character(i)]] <- JAN.es.daylight.ought-JAN.ea.daylight.ought
}
names(JAN.daylight.vpd.ought) <- sprintf("vpd.day.200%s.jan", names(JAN.daylight.vpd.ought))

JAN.daylight.vpd.teen <- vector("list", 10)
names(JAN.daylight.vpd.teen) <- 10:19
for (i in 10:19)
{
  JAN.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "pres") [,5,8]
  JAN.pres <- JAN.pres/100 #Convert to millibars for calculation
  JAN.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "sh") [,5,8]
  JAN.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nbdsf") [,5,8]
  JAN.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "nddsf") [,5,8]
  JAN.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vbdsf") [,5,8]
  JAN.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "vddsf") [,5,8]
  JAN.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJAN.h5", i), "tmp") [,5,8]
  JAN.tmp <- data.frame(JAN.tmp - 273.15)
  JAN.ea <- (JAN.pres * JAN.qair / (0.378 * JAN.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JAN.es <- 6.116441 * 10 ^ ((7.591386 * JAN.tmp / (JAN.tmp + 240.7263))) / 10
  
  JAN.daily.vpd.raw.teen <- data.frame(cbind(JAN.ea,JAN.es,JAN.nbdsf,JAN.nddsf,JAN.vbdsf,JAN.vddsf))
  JAN.daily.vpd.raw.teen <- JAN.daily.vpd.raw.teen %>% mutate(total_irrad = JAN.nbdsf + JAN.nddsf + JAN.vbdsf + JAN.vddsf)
  JAN.ea.daylight.teen <- mean(JAN.daily.vpd.raw.teen$JAN.ea)
  JAN.es.daylight.teen <- mean(JAN.daily.vpd.raw.teen$JAN.tmp...273.15)
  
  JAN.daylight.vpd.teen[[as.character(i)]] <- JAN.es.daylight.teen-JAN.ea.daylight.teen
}
names(JAN.daylight.vpd.teen) <- sprintf("vpd.day.20%s.jan", names(JAN.daylight.vpd.teen))

JAN.daylight.vpd.mean <- mean(JAN.daylight.vpd.ought$vpd.day.2007.jan,JAN.daylight.vpd.ought$vpd.day.2008.jan,+
                             JAN.daylight.vpd.ought$vpd.day.2009.jan,JAN.daylight.vpd.teen$vpd.day.2010.jan,+
                             JAN.daylight.vpd.teen$vpd.day.2011.jan,JAN.daylight.vpd.teen$vpd.day.2012.jan,+
                             JAN.daylight.vpd.teen$vpd.day.2013.jan,JAN.daylight.vpd.teen$vpd.day.2014.jan,+
                             JAN.daylight.vpd.teen$vpd.day.2015.jan,JAN.daylight.vpd.teen$vpd.day.2016.jan,+
                             JAN.daylight.vpd.teen$vpd.day.2017.jan,JAN.daylight.vpd.teen$vpd.day.2018.jan,+
                             JAN.daylight.vpd.teen$vpd.day.2019.jan)
# february
FEB.daylight.vpd.ought <- vector("list", 3)
names(FEB.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  FEB.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "pres") [,5,8]
  FEB.pres <- FEB.pres/100 #Convert to millibars for calculation
  FEB.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "sh") [,5,8]
  FEB.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "nddsf") [,5,8]
  FEB.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "vddsf") [,5,8]
  FEB.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dFEB.h5", i), "tmp") [,5,8]
  FEB.tmp <- data.frame(FEB.tmp - 273.15)
  FEB.ea <- (FEB.pres * FEB.qair / (0.378 * FEB.qair + 0.622)) / 10 #Convert to kPa for TROLL
  FEB.es <- 6.116441 * 10 ^ ((7.591386 * FEB.tmp / (FEB.tmp + 240.7263))) / 10
  
  FEB.daily.vpd.raw.ought <- data.frame(cbind(FEB.ea,FEB.es,FEB.nbdsf,FEB.nddsf,FEB.vbdsf,FEB.vddsf))
  FEB.daily.vpd.raw.ought <- FEB.daily.vpd.raw.ought %>% mutate(total_irrad = FEB.nbdsf + FEB.nddsf + FEB.vbdsf + FEB.vddsf)
  FEB.ea.daylight.ought <- mean(FEB.daily.vpd.raw.ought$FEB.ea)
  FEB.es.daylight.ought <- mean(FEB.daily.vpd.raw.ought$FEB.tmp...273.15)
  
  FEB.daylight.vpd.ought[[as.character(i)]] <- FEB.es.daylight.ought-FEB.ea.daylight.ought
}
names(FEB.daylight.vpd.ought) <- sprintf("vpd.day.200%s.feb", names(FEB.daylight.vpd.ought))

FEB.daylight.vpd.teen <- vector("list", 10)
names(FEB.daylight.vpd.teen) <- 10:19
for (i in 10:19)
{
  FEB.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "pres") [,5,8]
  FEB.pres <- FEB.pres/100 #Convert to millibars for calculation
  FEB.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "sh") [,5,8]
  FEB.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nbdsf") [,5,8]
  FEB.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "nddsf") [,5,8]
  FEB.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vbdsf") [,5,8]
  FEB.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "vddsf") [,5,8]
  FEB.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dFEB.h5", i), "tmp") [,5,8]
  FEB.tmp <- data.frame(FEB.tmp - 273.15)
  FEB.ea <- (FEB.pres * FEB.qair / (0.378 * FEB.qair + 0.622)) / 10 #Convert to kPa for TROLL
  FEB.es <- 6.116441 * 10 ^ ((7.591386 * FEB.tmp / (FEB.tmp + 240.7263))) / 10
  
  FEB.daily.vpd.raw.teen <- data.frame(cbind(FEB.ea,FEB.es,FEB.nbdsf,FEB.nddsf,FEB.vbdsf,FEB.vddsf))
  FEB.daily.vpd.raw.teen <- FEB.daily.vpd.raw.teen %>% mutate(total_irrad = FEB.nbdsf + FEB.nddsf + FEB.vbdsf + FEB.vddsf)
  FEB.ea.daylight.teen <- mean(FEB.daily.vpd.raw.teen$FEB.ea)
  FEB.es.daylight.teen <- mean(FEB.daily.vpd.raw.teen$FEB.tmp...273.15)
  
  FEB.daylight.vpd.teen[[as.character(i)]] <- FEB.es.daylight.teen-FEB.ea.daylight.teen
}
names(FEB.daylight.vpd.teen) <- sprintf("vpd.day.20%s.feb", names(FEB.daylight.vpd.teen))

FEB.daylight.vpd.mean <- mean(FEB.daylight.vpd.ought$vpd.day.2007.feb,FEB.daylight.vpd.ought$vpd.day.2008.feb,+
                                FEB.daylight.vpd.ought$vpd.day.2009.feb,FEB.daylight.vpd.teen$vpd.day.2010.feb,+
                                FEB.daylight.vpd.teen$vpd.day.2011.feb,FEB.daylight.vpd.teen$vpd.day.2012.feb,+
                                FEB.daylight.vpd.teen$vpd.day.2013.feb,FEB.daylight.vpd.teen$vpd.day.2014.feb,+
                                FEB.daylight.vpd.teen$vpd.day.2015.feb,FEB.daylight.vpd.teen$vpd.day.2016.feb,+
                                FEB.daylight.vpd.teen$vpd.day.2017.feb,FEB.daylight.vpd.teen$vpd.day.2018.feb,+
                                FEB.daylight.vpd.teen$vpd.day.2019.feb)

# march
MAR.daylight.vpd.ought <- vector("list", 3)
names(MAR.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  MAR.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "pres") [,5,8]
  MAR.pres <- MAR.pres/100 #Convert to millibars for calculation
  MAR.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "sh") [,5,8]
  MAR.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "nddsf") [,5,8]
  MAR.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "vddsf") [,5,8]
  MAR.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAR.h5", i), "tmp") [,5,8]
  MAR.tmp <- data.frame(MAR.tmp - 273.15)
  MAR.ea <- (MAR.pres * MAR.qair / (0.378 * MAR.qair + 0.622)) / 10 #Convert to kPa for TROLL
  MAR.es <- 6.116441 * 10 ^ ((7.591386 * MAR.tmp / (MAR.tmp + 240.7263))) / 10
  
  MAR.daily.vpd.raw.ought <- data.frame(cbind(MAR.ea,MAR.es,MAR.nbdsf,MAR.nddsf,MAR.vbdsf,MAR.vddsf))
  MAR.daily.vpd.raw.ought <- MAR.daily.vpd.raw.ought %>% mutate(total_irrad = MAR.nbdsf + MAR.nddsf + MAR.vbdsf + MAR.vddsf)
  MAR.ea.daylight.ought <- mean(MAR.daily.vpd.raw.ought$MAR.ea)
  MAR.es.daylight.ought <- mean(MAR.daily.vpd.raw.ought$MAR.tmp...273.15)
  
  MAR.daylight.vpd.ought[[as.character(i)]] <- MAR.es.daylight.ought-MAR.ea.daylight.ought
}
names(MAR.daylight.vpd.ought) <- sprintf("vpd.day.200%s.mar", names(MAR.daylight.vpd.ought))

MAR.daylight.vpd.teen <- vector("list", 10)
names(MAR.daylight.vpd.teen) <- 10:19
for (i in 10:19)
{
  MAR.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "pres") [,5,8]
  MAR.pres <- MAR.pres/100 #Convert to millibars for calculation
  MAR.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "sh") [,5,8]
  MAR.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nbdsf") [,5,8]
  MAR.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "nddsf") [,5,8]
  MAR.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vbdsf") [,5,8]
  MAR.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "vddsf") [,5,8]
  MAR.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAR.h5", i), "tmp") [,5,8]
  MAR.tmp <- data.frame(MAR.tmp - 273.15)
  MAR.ea <- (MAR.pres * MAR.qair / (0.378 * MAR.qair + 0.622)) / 10 #Convert to kPa for TROLL
  MAR.es <- 6.116441 * 10 ^ ((7.591386 * MAR.tmp / (MAR.tmp + 240.7263))) / 10
  
  MAR.daily.vpd.raw.teen <- data.frame(cbind(MAR.ea,MAR.es,MAR.nbdsf,MAR.nddsf,MAR.vbdsf,MAR.vddsf))
  MAR.daily.vpd.raw.teen <- MAR.daily.vpd.raw.teen %>% mutate(total_irrad = MAR.nbdsf + MAR.nddsf + MAR.vbdsf + MAR.vddsf)
  MAR.ea.daylight.teen <- mean(MAR.daily.vpd.raw.teen$MAR.ea)
  MAR.es.daylight.teen <- mean(MAR.daily.vpd.raw.teen$MAR.tmp...273.15)
  
  MAR.daylight.vpd.teen[[as.character(i)]] <- MAR.es.daylight.teen-MAR.ea.daylight.teen
}
names(MAR.daylight.vpd.teen) <- sprintf("vpd.day.20%s.mar", names(MAR.daylight.vpd.teen))

MAR.daylight.vpd.mean <- mean(MAR.daylight.vpd.ought$vpd.day.2007.mar,MAR.daylight.vpd.ought$vpd.day.2008.mar,+
                                MAR.daylight.vpd.ought$vpd.day.2009.mar,MAR.daylight.vpd.teen$vpd.day.2010.mar,+
                                MAR.daylight.vpd.teen$vpd.day.2011.mar,MAR.daylight.vpd.teen$vpd.day.2012.mar,+
                                MAR.daylight.vpd.teen$vpd.day.2013.mar,MAR.daylight.vpd.teen$vpd.day.2014.mar,+
                                MAR.daylight.vpd.teen$vpd.day.2015.mar,MAR.daylight.vpd.teen$vpd.day.2016.mar,+
                                MAR.daylight.vpd.teen$vpd.day.2017.mar,MAR.daylight.vpd.teen$vpd.day.2018.mar,+
                                MAR.daylight.vpd.teen$vpd.day.2019.mar)

# april
APR.daylight.vpd.ought <- vector("list", 3)
names(APR.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  APR.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "pres") [,5,8]
  APR.pres <- APR.pres/100 #Convert to millibars for calculation
  APR.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "sh") [,5,8]
  APR.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "nddsf") [,5,8]
  APR.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "vddsf") [,5,8]
  APR.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAPR.h5", i), "tmp") [,5,8]
  APR.tmp <- data.frame(APR.tmp - 273.15)
  APR.ea <- (APR.pres * APR.qair / (0.378 * APR.qair + 0.622)) / 10 #Convert to kPa for TROLL
  APR.es <- 6.116441 * 10 ^ ((7.591386 * APR.tmp / (APR.tmp + 240.7263))) / 10
  
  APR.daily.vpd.raw.ought <- data.frame(cbind(APR.ea,APR.es,APR.nbdsf,APR.nddsf,APR.vbdsf,APR.vddsf))
  APR.daily.vpd.raw.ought <- APR.daily.vpd.raw.ought %>% mutate(total_irrad = APR.nbdsf + APR.nddsf + APR.vbdsf + APR.vddsf)
  APR.ea.daylight.ought <- mean(APR.daily.vpd.raw.ought$APR.ea)
  APR.es.daylight.ought <- mean(APR.daily.vpd.raw.ought$APR.tmp...273.15)
  
  APR.daylight.vpd.ought[[as.character(i)]] <- APR.es.daylight.ought-APR.ea.daylight.ought
}
names(APR.daylight.vpd.ought) <- sprintf("vpd.day.200%s.apr", names(APR.daylight.vpd.ought))

APR.daylight.vpd.teen <- vector("list", 10)
names(APR.daylight.vpd.teen) <- 10:19
for (i in 10:19)
{
  APR.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "pres") [,5,8]
  APR.pres <- APR.pres/100 #Convert to millibars for calculation
  APR.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "sh") [,5,8]
  APR.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nbdsf") [,5,8]
  APR.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "nddsf") [,5,8]
  APR.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vbdsf") [,5,8]
  APR.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "vddsf") [,5,8]
  APR.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAPR.h5", i), "tmp") [,5,8]
  APR.tmp <- data.frame(APR.tmp - 273.15)
  APR.ea <- (APR.pres * APR.qair / (0.378 * APR.qair + 0.622)) / 10 #Convert to kPa for TROLL
  APR.es <- 6.116441 * 10 ^ ((7.591386 * APR.tmp / (APR.tmp + 240.7263))) / 10
  
  APR.daily.vpd.raw.teen <- data.frame(cbind(APR.ea,APR.es,APR.nbdsf,APR.nddsf,APR.vbdsf,APR.vddsf))
  APR.daily.vpd.raw.teen <- APR.daily.vpd.raw.teen %>% mutate(total_irrad = APR.nbdsf + APR.nddsf + APR.vbdsf + APR.vddsf)
  APR.ea.daylight.teen <- mean(APR.daily.vpd.raw.teen$APR.ea)
  APR.es.daylight.teen <- mean(APR.daily.vpd.raw.teen$APR.tmp...273.15)
  
  APR.daylight.vpd.teen[[as.character(i)]] <- APR.es.daylight.teen-APR.ea.daylight.teen
}
names(APR.daylight.vpd.teen) <- sprintf("vpd.day.20%s.apr", names(APR.daylight.vpd.teen))

APR.daylight.vpd.mean <- mean(APR.daylight.vpd.ought$vpd.day.2007.apr,APR.daylight.vpd.ought$vpd.day.2008.apr,+
                                APR.daylight.vpd.ought$vpd.day.2009.apr,APR.daylight.vpd.teen$vpd.day.2010.apr,+
                                APR.daylight.vpd.teen$vpd.day.2011.apr,APR.daylight.vpd.teen$vpd.day.2012.apr,+
                                APR.daylight.vpd.teen$vpd.day.2013.apr,APR.daylight.vpd.teen$vpd.day.2014.apr,+
                                APR.daylight.vpd.teen$vpd.day.2015.apr,APR.daylight.vpd.teen$vpd.day.2016.apr,+
                                APR.daylight.vpd.teen$vpd.day.2017.apr,APR.daylight.vpd.teen$vpd.day.2018.apr,+
                                APR.daylight.vpd.teen$vpd.day.2019.apr)

# may
MAY.daylight.vpd.ought <- vector("list", 3)
names(MAY.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  MAY.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "pres") [,5,8]
  MAY.pres <- MAY.pres/100 #Convert to millibars for calculation
  MAY.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "sh") [,5,8]
  MAY.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "nddsf") [,5,8]
  MAY.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "vddsf") [,5,8]
  MAY.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dMAY.h5", i), "tmp") [,5,8]
  MAY.tmp <- data.frame(MAY.tmp - 273.15)
  MAY.ea <- (MAY.pres * MAY.qair / (0.378 * MAY.qair + 0.622)) / 10 #Convert to kPa for TROLL
  MAY.es <- 6.116441 * 10 ^ ((7.591386 * MAY.tmp / (MAY.tmp + 240.7263))) / 10
  
  MAY.daily.vpd.raw.ought <- data.frame(cbind(MAY.ea,MAY.es,MAY.nbdsf,MAY.nddsf,MAY.vbdsf,MAY.vddsf))
  MAY.daily.vpd.raw.ought <- MAY.daily.vpd.raw.ought %>% mutate(total_irrad = MAY.nbdsf + MAY.nddsf + MAY.vbdsf + MAY.vddsf)
  MAY.ea.daylight.ought <- mean(MAY.daily.vpd.raw.ought$MAY.ea)
  MAY.es.daylight.ought <- mean(MAY.daily.vpd.raw.ought$MAY.tmp...273.15)
  
  MAY.daylight.vpd.ought[[as.character(i)]] <- MAY.es.daylight.ought-MAY.ea.daylight.ought
}
names(MAY.daylight.vpd.ought) <- sprintf("vpd.day.200%s.may", names(MAY.daylight.vpd.ought))

MAY.daylight.vpd.teen <- vector("list", 9)
names(MAY.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  MAY.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "pres") [,5,8]
  MAY.pres <- MAY.pres/100 #Convert to millibars for calculation
  MAY.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "sh") [,5,8]
  MAY.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nbdsf") [,5,8]
  MAY.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "nddsf") [,5,8]
  MAY.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vbdsf") [,5,8]
  MAY.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "vddsf") [,5,8]
  MAY.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dMAY.h5", i), "tmp") [,5,8]
  MAY.tmp <- data.frame(MAY.tmp - 273.15)
  MAY.ea <- (MAY.pres * MAY.qair / (0.378 * MAY.qair + 0.622)) / 10 #Convert to kPa for TROLL
  MAY.es <- 6.116441 * 10 ^ ((7.591386 * MAY.tmp / (MAY.tmp + 240.7263))) / 10
  
  MAY.daily.vpd.raw.teen <- data.frame(cbind(MAY.ea,MAY.es,MAY.nbdsf,MAY.nddsf,MAY.vbdsf,MAY.vddsf))
  MAY.daily.vpd.raw.teen <- MAY.daily.vpd.raw.teen %>% mutate(total_irrad = MAY.nbdsf + MAY.nddsf + MAY.vbdsf + MAY.vddsf)
  MAY.ea.daylight.teen <- mean(MAY.daily.vpd.raw.teen$MAY.ea)
  MAY.es.daylight.teen <- mean(MAY.daily.vpd.raw.teen$MAY.tmp...273.15)
  
  MAY.daylight.vpd.teen[[as.character(i)]] <- MAY.es.daylight.teen-MAY.ea.daylight.teen
}
names(MAY.daylight.vpd.teen) <- sprintf("vpd.day.20%s.may", names(MAY.daylight.vpd.teen))

MAY.daylight.vpd.mean <- mean(MAY.daylight.vpd.ought$vpd.day.2007.may,MAY.daylight.vpd.ought$vpd.day.2008.may,+
                                MAY.daylight.vpd.ought$vpd.day.2009.may,MAY.daylight.vpd.teen$vpd.day.2010.may,+
                                MAY.daylight.vpd.teen$vpd.day.2011.may,MAY.daylight.vpd.teen$vpd.day.2012.may,+
                                MAY.daylight.vpd.teen$vpd.day.2013.may,MAY.daylight.vpd.teen$vpd.day.2014.may,+
                                MAY.daylight.vpd.teen$vpd.day.2015.may,MAY.daylight.vpd.teen$vpd.day.2016.may,+
                                MAY.daylight.vpd.teen$vpd.day.2017.may,MAY.daylight.vpd.teen$vpd.day.2018.may)

# june
JUN.daylight.vpd.ought <- vector("list", 3)
names(JUN.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  JUN.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "pres") [,5,8]
  JUN.pres <- JUN.pres/100 #Convert to millibars for calculation
  JUN.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "sh") [,5,8]
  JUN.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "nddsf") [,5,8]
  JUN.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "vddsf") [,5,8]
  JUN.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUN.h5", i), "tmp") [,5,8]
  JUN.tmp <- data.frame(JUN.tmp - 273.15)
  JUN.ea <- (JUN.pres * JUN.qair / (0.378 * JUN.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JUN.es <- 6.116441 * 10 ^ ((7.591386 * JUN.tmp / (JUN.tmp + 240.7263))) / 10
  
  JUN.daily.vpd.raw.ought <- data.frame(cbind(JUN.ea,JUN.es,JUN.nbdsf,JUN.nddsf,JUN.vbdsf,JUN.vddsf))
  JUN.daily.vpd.raw.ought <- JUN.daily.vpd.raw.ought %>% mutate(total_irrad = JUN.nbdsf + JUN.nddsf + JUN.vbdsf + JUN.vddsf)
  JUN.ea.daylight.ought <- mean(JUN.daily.vpd.raw.ought$JUN.ea)
  JUN.es.daylight.ought <- mean(JUN.daily.vpd.raw.ought$JUN.tmp...273.15)
  
  JUN.daylight.vpd.ought[[as.character(i)]] <- JUN.es.daylight.ought-JUN.ea.daylight.ought
}
names(JUN.daylight.vpd.ought) <- sprintf("vpd.day.200%s.jun", names(JUN.daylight.vpd.ought))

JUN.daylight.vpd.teen <- vector("list", 9)
names(JUN.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  JUN.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "pres") [,5,8]
  JUN.pres <- JUN.pres/100 #Convert to millibars for calculation
  JUN.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "sh") [,5,8]
  JUN.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nbdsf") [,5,8]
  JUN.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "nddsf") [,5,8]
  JUN.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vbdsf") [,5,8]
  JUN.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "vddsf") [,5,8]
  JUN.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUN.h5", i), "tmp") [,5,8]
  JUN.tmp <- data.frame(JUN.tmp - 273.15)
  JUN.ea <- (JUN.pres * JUN.qair / (0.378 * JUN.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JUN.es <- 6.116441 * 10 ^ ((7.591386 * JUN.tmp / (JUN.tmp + 240.7263))) / 10
  
  JUN.daily.vpd.raw.teen <- data.frame(cbind(JUN.ea,JUN.es,JUN.nbdsf,JUN.nddsf,JUN.vbdsf,JUN.vddsf))
  JUN.daily.vpd.raw.teen <- JUN.daily.vpd.raw.teen %>% mutate(total_irrad = JUN.nbdsf + JUN.nddsf + JUN.vbdsf + JUN.vddsf)
  JUN.ea.daylight.teen <- mean(JUN.daily.vpd.raw.teen$JUN.ea)
  JUN.es.daylight.teen <- mean(JUN.daily.vpd.raw.teen$JUN.tmp...273.15)
  
  JUN.daylight.vpd.teen[[as.character(i)]] <- JUN.es.daylight.teen-JUN.ea.daylight.teen
}
names(JUN.daylight.vpd.teen) <- sprintf("vpd.day.20%s.jun", names(JUN.daylight.vpd.teen))

JUN.daylight.vpd.mean <- mean(JUN.daylight.vpd.ought$vpd.day.2007.jun,JUN.daylight.vpd.ought$vpd.day.2008.jun,+
                                JUN.daylight.vpd.ought$vpd.day.2009.jun,JUN.daylight.vpd.teen$vpd.day.2010.jun,+
                                JUN.daylight.vpd.teen$vpd.day.2011.jun,JUN.daylight.vpd.teen$vpd.day.2012.jun,+
                                JUN.daylight.vpd.teen$vpd.day.2013.jun,JUN.daylight.vpd.teen$vpd.day.2014.jun,+
                                JUN.daylight.vpd.teen$vpd.day.2015.jun,JUN.daylight.vpd.teen$vpd.day.2016.jun,+
                                JUN.daylight.vpd.teen$vpd.day.2017.jun,JUN.daylight.vpd.teen$vpd.day.2018.jun)

# july
JUL.daylight.vpd.ought <- vector("list", 3)
names(JUL.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  JUL.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "pres") [,5,8]
  JUL.pres <- JUL.pres/100 #Convert to millibars for calculation
  JUL.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "sh") [,5,8]
  JUL.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "nddsf") [,5,8]
  JUL.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "vddsf") [,5,8]
  JUL.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dJUL.h5", i), "tmp") [,5,8]
  JUL.tmp <- data.frame(JUL.tmp - 273.15)
  JUL.ea <- (JUL.pres * JUL.qair / (0.378 * JUL.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JUL.es <- 6.116441 * 10 ^ ((7.591386 * JUL.tmp / (JUL.tmp + 240.7263))) / 10
  
  JUL.daily.vpd.raw.ought <- data.frame(cbind(JUL.ea,JUL.es,JUL.nbdsf,JUL.nddsf,JUL.vbdsf,JUL.vddsf))
  JUL.daily.vpd.raw.ought <- JUL.daily.vpd.raw.ought %>% mutate(total_irrad = JUL.nbdsf + JUL.nddsf + JUL.vbdsf + JUL.vddsf)
  JUL.ea.daylight.ought <- mean(JUL.daily.vpd.raw.ought$JUL.ea)
  JUL.es.daylight.ought <- mean(JUL.daily.vpd.raw.ought$JUL.tmp...273.15)
  
  JUL.daylight.vpd.ought[[as.character(i)]] <- JUL.es.daylight.ought-JUL.ea.daylight.ought
}
names(JUL.daylight.vpd.ought) <- sprintf("vpd.day.200%s.jul", names(JUL.daylight.vpd.ought))

JUL.daylight.vpd.teen <- vector("list", 9)
names(JUL.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  JUL.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "pres") [,5,8]
  JUL.pres <- JUL.pres/100 #Convert to millibars for calculation
  JUL.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "sh") [,5,8]
  JUL.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nbdsf") [,5,8]
  JUL.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "nddsf") [,5,8]
  JUL.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vbdsf") [,5,8]
  JUL.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "vddsf") [,5,8]
  JUL.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dJUL.h5", i), "tmp") [,5,8]
  JUL.tmp <- data.frame(JUL.tmp - 273.15)
  JUL.ea <- (JUL.pres * JUL.qair / (0.378 * JUL.qair + 0.622)) / 10 #Convert to kPa for TROLL
  JUL.es <- 6.116441 * 10 ^ ((7.591386 * JUL.tmp / (JUL.tmp + 240.7263))) / 10
  
  JUL.daily.vpd.raw.teen <- data.frame(cbind(JUL.ea,JUL.es,JUL.nbdsf,JUL.nddsf,JUL.vbdsf,JUL.vddsf))
  JUL.daily.vpd.raw.teen <- JUL.daily.vpd.raw.teen %>% mutate(total_irrad = JUL.nbdsf + JUL.nddsf + JUL.vbdsf + JUL.vddsf)
  JUL.ea.daylight.teen <- mean(JUL.daily.vpd.raw.teen$JUL.ea)
  JUL.es.daylight.teen <- mean(JUL.daily.vpd.raw.teen$JUL.tmp...273.15)
  
  JUL.daylight.vpd.teen[[as.character(i)]] <- JUL.es.daylight.teen-JUL.ea.daylight.teen
}
names(JUL.daylight.vpd.teen) <- sprintf("vpd.day.20%s.jul", names(JUL.daylight.vpd.teen))

JUL.daylight.vpd.mean <- mean(JUL.daylight.vpd.ought$vpd.day.2007.jul,JUL.daylight.vpd.ought$vpd.day.2008.jul,+
                                JUL.daylight.vpd.ought$vpd.day.2009.jul,JUL.daylight.vpd.teen$vpd.day.2010.jul,+
                                JUL.daylight.vpd.teen$vpd.day.2011.jul,JUL.daylight.vpd.teen$vpd.day.2012.jul,+
                                JUL.daylight.vpd.teen$vpd.day.2013.jul,JUL.daylight.vpd.teen$vpd.day.2014.jul,+
                                JUL.daylight.vpd.teen$vpd.day.2015.jul,JUL.daylight.vpd.teen$vpd.day.2016.jul,+
                                JUL.daylight.vpd.teen$vpd.day.2017.jul,JUL.daylight.vpd.teen$vpd.day.2018.jul)

# august
AUG.daylight.vpd.ought <- vector("list", 3)
names(AUG.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  AUG.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "pres") [,5,8]
  AUG.pres <- AUG.pres/100 #Convert to millibars for calculation
  AUG.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "sh") [,5,8]
  AUG.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "nddsf") [,5,8]
  AUG.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "vddsf") [,5,8]
  AUG.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dAUG.h5", i), "tmp") [,5,8]
  AUG.tmp <- data.frame(AUG.tmp - 273.15)
  AUG.ea <- (AUG.pres * AUG.qair / (0.378 * AUG.qair + 0.622)) / 10 #Convert to kPa for TROLL
  AUG.es <- 6.116441 * 10 ^ ((7.591386 * AUG.tmp / (AUG.tmp + 240.7263))) / 10
  
  AUG.daily.vpd.raw.ought <- data.frame(cbind(AUG.ea,AUG.es,AUG.nbdsf,AUG.nddsf,AUG.vbdsf,AUG.vddsf))
  AUG.daily.vpd.raw.ought <- AUG.daily.vpd.raw.ought %>% mutate(total_irrad = AUG.nbdsf + AUG.nddsf + AUG.vbdsf + AUG.vddsf)
  AUG.ea.daylight.ought <- mean(AUG.daily.vpd.raw.ought$AUG.ea)
  AUG.es.daylight.ought <- mean(AUG.daily.vpd.raw.ought$AUG.tmp...273.15)
  
  AUG.daylight.vpd.ought[[as.character(i)]] <- AUG.es.daylight.ought-AUG.ea.daylight.ought
}
names(AUG.daylight.vpd.ought) <- sprintf("vpd.day.200%s.aug", names(AUG.daylight.vpd.ought))

AUG.daylight.vpd.teen <- vector("list", 9)
names(AUG.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  AUG.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "pres") [,5,8]
  AUG.pres <- AUG.pres/100 #Convert to millibars for calculation
  AUG.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "sh") [,5,8]
  AUG.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nbdsf") [,5,8]
  AUG.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "nddsf") [,5,8]
  AUG.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vbdsf") [,5,8]
  AUG.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "vddsf") [,5,8]
  AUG.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dAUG.h5", i), "tmp") [,5,8]
  AUG.tmp <- data.frame(AUG.tmp - 273.15)
  AUG.ea <- (AUG.pres * AUG.qair / (0.378 * AUG.qair + 0.622)) / 10 #Convert to kPa for TROLL
  AUG.es <- 6.116441 * 10 ^ ((7.591386 * AUG.tmp / (AUG.tmp + 240.7263))) / 10
  
  AUG.daily.vpd.raw.teen <- data.frame(cbind(AUG.ea,AUG.es,AUG.nbdsf,AUG.nddsf,AUG.vbdsf,AUG.vddsf))
  AUG.daily.vpd.raw.teen <- AUG.daily.vpd.raw.teen %>% mutate(total_irrad = AUG.nbdsf + AUG.nddsf + AUG.vbdsf + AUG.vddsf)
  AUG.ea.daylight.teen <- mean(AUG.daily.vpd.raw.teen$AUG.ea)
  AUG.es.daylight.teen <- mean(AUG.daily.vpd.raw.teen$AUG.tmp...273.15)
  
  AUG.daylight.vpd.teen[[as.character(i)]] <- AUG.es.daylight.teen-AUG.ea.daylight.teen
}
names(AUG.daylight.vpd.teen) <- sprintf("vpd.day.20%s.aug", names(AUG.daylight.vpd.teen))

AUG.daylight.vpd.mean <- mean(AUG.daylight.vpd.ought$vpd.day.2007.aug,AUG.daylight.vpd.ought$vpd.day.2008.aug,+
                                AUG.daylight.vpd.ought$vpd.day.2009.aug,AUG.daylight.vpd.teen$vpd.day.2010.aug,+
                                AUG.daylight.vpd.teen$vpd.day.2011.aug,AUG.daylight.vpd.teen$vpd.day.2012.aug,+
                                AUG.daylight.vpd.teen$vpd.day.2013.aug,AUG.daylight.vpd.teen$vpd.day.2014.aug,+
                                AUG.daylight.vpd.teen$vpd.day.2015.aug,AUG.daylight.vpd.teen$vpd.day.2016.aug,+
                                AUG.daylight.vpd.teen$vpd.day.2017.aug,AUG.daylight.vpd.teen$vpd.day.2018.aug)

# september
SEP.daylight.vpd.ought <- vector("list", 3)
names(SEP.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  SEP.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "pres") [,5,8]
  SEP.pres <- SEP.pres/100 #Convert to millibars for calculation
  SEP.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "sh") [,5,8]
  SEP.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "nddsf") [,5,8]
  SEP.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "vddsf") [,5,8]
  SEP.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dSEP.h5", i), "tmp") [,5,8]
  SEP.tmp <- data.frame(SEP.tmp - 273.15)
  SEP.ea <- (SEP.pres * SEP.qair / (0.378 * SEP.qair + 0.622)) / 10 #Convert to kPa for TROLL
  SEP.es <- 6.116441 * 10 ^ ((7.591386 * SEP.tmp / (SEP.tmp + 240.7263))) / 10
  
  SEP.daily.vpd.raw.ought <- data.frame(cbind(SEP.ea,SEP.es,SEP.nbdsf,SEP.nddsf,SEP.vbdsf,SEP.vddsf))
  SEP.daily.vpd.raw.ought <- SEP.daily.vpd.raw.ought %>% mutate(total_irrad = SEP.nbdsf + SEP.nddsf + SEP.vbdsf + SEP.vddsf)
  SEP.ea.daylight.ought <- mean(SEP.daily.vpd.raw.ought$SEP.ea)
  SEP.es.daylight.ought <- mean(SEP.daily.vpd.raw.ought$SEP.tmp...273.15)
  
  SEP.daylight.vpd.ought[[as.character(i)]] <- SEP.es.daylight.ought-SEP.ea.daylight.ought
}
names(SEP.daylight.vpd.ought) <- sprintf("vpd.day.200%s.sep", names(SEP.daylight.vpd.ought))

SEP.daylight.vpd.teen <- vector("list", 9)
names(SEP.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  SEP.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "pres") [,5,8]
  SEP.pres <- SEP.pres/100 #Convert to millibars for calculation
  SEP.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "sh") [,5,8]
  SEP.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nbdsf") [,5,8]
  SEP.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "nddsf") [,5,8]
  SEP.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vbdsf") [,5,8]
  SEP.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "vddsf") [,5,8]
  SEP.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dSEP.h5", i), "tmp") [,5,8]
  SEP.tmp <- data.frame(SEP.tmp - 273.15)
  SEP.ea <- (SEP.pres * SEP.qair / (0.378 * SEP.qair + 0.622)) / 10 #Convert to kPa for TROLL
  SEP.es <- 6.116441 * 10 ^ ((7.591386 * SEP.tmp / (SEP.tmp + 240.7263))) / 10
  
  SEP.daily.vpd.raw.teen <- data.frame(cbind(SEP.ea,SEP.es,SEP.nbdsf,SEP.nddsf,SEP.vbdsf,SEP.vddsf))
  SEP.daily.vpd.raw.teen <- SEP.daily.vpd.raw.teen %>% mutate(total_irrad = SEP.nbdsf + SEP.nddsf + SEP.vbdsf + SEP.vddsf)
  SEP.ea.daylight.teen <- mean(SEP.daily.vpd.raw.teen$SEP.ea)
  SEP.es.daylight.teen <- mean(SEP.daily.vpd.raw.teen$SEP.tmp...273.15)
  
  SEP.daylight.vpd.teen[[as.character(i)]] <- SEP.es.daylight.teen-SEP.ea.daylight.teen
}
names(SEP.daylight.vpd.teen) <- sprintf("vpd.day.20%s.sep", names(SEP.daylight.vpd.teen))

SEP.daylight.vpd.mean <- mean(SEP.daylight.vpd.ought$vpd.day.2007.sep,SEP.daylight.vpd.ought$vpd.day.2008.sep,+
                                SEP.daylight.vpd.ought$vpd.day.2009.sep,SEP.daylight.vpd.teen$vpd.day.2010.sep,+
                                SEP.daylight.vpd.teen$vpd.day.2011.sep,SEP.daylight.vpd.teen$vpd.day.2012.sep,+
                                SEP.daylight.vpd.teen$vpd.day.2013.sep,SEP.daylight.vpd.teen$vpd.day.2014.sep,+
                                SEP.daylight.vpd.teen$vpd.day.2015.sep,SEP.daylight.vpd.teen$vpd.day.2016.sep,+
                                SEP.daylight.vpd.teen$vpd.day.2017.sep,SEP.daylight.vpd.teen$vpd.day.2018.sep)

# october
OCT.daylight.vpd.ought <- vector("list", 3)
names(OCT.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  OCT.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "pres") [,5,8]
  OCT.pres <- OCT.pres/100 #Convert to millibars for calculation
  OCT.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "sh") [,5,8]
  OCT.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "nddsf") [,5,8]
  OCT.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "vddsf") [,5,8]
  OCT.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dOCT.h5", i), "tmp") [,5,8]
  OCT.tmp <- data.frame(OCT.tmp - 273.15)
  OCT.ea <- (OCT.pres * OCT.qair / (0.378 * OCT.qair + 0.622)) / 10 #Convert to kPa for TROLL
  OCT.es <- 6.116441 * 10 ^ ((7.591386 * OCT.tmp / (OCT.tmp + 240.7263))) / 10
  
  OCT.daily.vpd.raw.ought <- data.frame(cbind(OCT.ea,OCT.es,OCT.nbdsf,OCT.nddsf,OCT.vbdsf,OCT.vddsf))
  OCT.daily.vpd.raw.ought <- OCT.daily.vpd.raw.ought %>% mutate(total_irrad = OCT.nbdsf + OCT.nddsf + OCT.vbdsf + OCT.vddsf)
  OCT.ea.daylight.ought <- mean(OCT.daily.vpd.raw.ought$OCT.ea)
  OCT.es.daylight.ought <- mean(OCT.daily.vpd.raw.ought$OCT.tmp...273.15)
  
  OCT.daylight.vpd.ought[[as.character(i)]] <- OCT.es.daylight.ought-OCT.ea.daylight.ought
}
names(OCT.daylight.vpd.ought) <- sprintf("vpd.day.200%s.oct", names(OCT.daylight.vpd.ought))

OCT.daylight.vpd.teen <- vector("list", 9)
names(OCT.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  OCT.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "pres") [,5,8]
  OCT.pres <- OCT.pres/100 #Convert to millibars for calculation
  OCT.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "sh") [,5,8]
  OCT.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nbdsf") [,5,8]
  OCT.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "nddsf") [,5,8]
  OCT.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vbdsf") [,5,8]
  OCT.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "vddsf") [,5,8]
  OCT.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dOCT.h5", i), "tmp") [,5,8]
  OCT.tmp <- data.frame(OCT.tmp - 273.15)
  OCT.ea <- (OCT.pres * OCT.qair / (0.378 * OCT.qair + 0.622)) / 10 #Convert to kPa for TROLL
  OCT.es <- 6.116441 * 10 ^ ((7.591386 * OCT.tmp / (OCT.tmp + 240.7263))) / 10
  
  OCT.daily.vpd.raw.teen <- data.frame(cbind(OCT.ea,OCT.es,OCT.nbdsf,OCT.nddsf,OCT.vbdsf,OCT.vddsf))
  OCT.daily.vpd.raw.teen <- OCT.daily.vpd.raw.teen %>% mutate(total_irrad = OCT.nbdsf + OCT.nddsf + OCT.vbdsf + OCT.vddsf)
  OCT.ea.daylight.teen <- mean(OCT.daily.vpd.raw.teen$OCT.ea)
  OCT.es.daylight.teen <- mean(OCT.daily.vpd.raw.teen$OCT.tmp...273.15)
  
  OCT.daylight.vpd.teen[[as.character(i)]] <- OCT.es.daylight.teen-OCT.ea.daylight.teen
}
names(OCT.daylight.vpd.teen) <- sprintf("vpd.day.20%s.oct", names(OCT.daylight.vpd.teen))

OCT.daylight.vpd.mean <- mean(OCT.daylight.vpd.ought$vpd.day.2007.oct,OCT.daylight.vpd.ought$vpd.day.2008.oct,+
                                OCT.daylight.vpd.ought$vpd.day.2009.oct,OCT.daylight.vpd.teen$vpd.day.2010.oct,+
                                OCT.daylight.vpd.teen$vpd.day.2011.oct,OCT.daylight.vpd.teen$vpd.day.2012.oct,+
                                OCT.daylight.vpd.teen$vpd.day.2013.oct,OCT.daylight.vpd.teen$vpd.day.2014.oct,+
                                OCT.daylight.vpd.teen$vpd.day.2015.oct,OCT.daylight.vpd.teen$vpd.day.2016.oct,+
                                OCT.daylight.vpd.teen$vpd.day.2017.oct,OCT.daylight.vpd.teen$vpd.day.2018.oct)

# november
NOV.daylight.vpd.ought <- vector("list", 3)
names(NOV.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  NOV.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "pres") [,5,8]
  NOV.pres <- NOV.pres/100 #Convert to millibars for calculation
  NOV.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "sh") [,5,8]
  NOV.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "nddsf") [,5,8]
  NOV.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "vddsf") [,5,8]
  NOV.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dNOV.h5", i), "tmp") [,5,8]
  NOV.tmp <- data.frame(NOV.tmp - 273.15)
  NOV.ea <- (NOV.pres * NOV.qair / (0.378 * NOV.qair + 0.622)) / 10 #Convert to kPa for TROLL
  NOV.es <- 6.116441 * 10 ^ ((7.591386 * NOV.tmp / (NOV.tmp + 240.7263))) / 10
  
  NOV.daily.vpd.raw.ought <- data.frame(cbind(NOV.ea,NOV.es,NOV.nbdsf,NOV.nddsf,NOV.vbdsf,NOV.vddsf))
  NOV.daily.vpd.raw.ought <- NOV.daily.vpd.raw.ought %>% mutate(total_irrad = NOV.nbdsf + NOV.nddsf + NOV.vbdsf + NOV.vddsf)
  NOV.ea.daylight.ought <- mean(NOV.daily.vpd.raw.ought$NOV.ea)
  NOV.es.daylight.ought <- mean(NOV.daily.vpd.raw.ought$NOV.tmp...273.15)
  
  NOV.daylight.vpd.ought[[as.character(i)]] <- NOV.es.daylight.ought-NOV.ea.daylight.ought
}
names(NOV.daylight.vpd.ought) <- sprintf("vpd.day.200%s.nov", names(NOV.daylight.vpd.ought))

NOV.daylight.vpd.teen <- vector("list", 9)
names(NOV.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  NOV.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "pres") [,5,8]
  NOV.pres <- NOV.pres/100 #Convert to millibars for calculation
  NOV.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "sh") [,5,8]
  NOV.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nbdsf") [,5,8]
  NOV.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "nddsf") [,5,8]
  NOV.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vbdsf") [,5,8]
  NOV.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "vddsf") [,5,8]
  NOV.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dNOV.h5", i), "tmp") [,5,8]
  NOV.tmp <- data.frame(NOV.tmp - 273.15)
  NOV.ea <- (NOV.pres * NOV.qair / (0.378 * NOV.qair + 0.622)) / 10 #Convert to kPa for TROLL
  NOV.es <- 6.116441 * 10 ^ ((7.591386 * NOV.tmp / (NOV.tmp + 240.7263))) / 10
  
  NOV.daily.vpd.raw.teen <- data.frame(cbind(NOV.ea,NOV.es,NOV.nbdsf,NOV.nddsf,NOV.vbdsf,NOV.vddsf))
  NOV.daily.vpd.raw.teen <- NOV.daily.vpd.raw.teen %>% mutate(total_irrad = NOV.nbdsf + NOV.nddsf + NOV.vbdsf + NOV.vddsf)
  NOV.ea.daylight.teen <- mean(NOV.daily.vpd.raw.teen$NOV.ea)
  NOV.es.daylight.teen <- mean(NOV.daily.vpd.raw.teen$NOV.tmp...273.15)
  
  NOV.daylight.vpd.teen[[as.character(i)]] <- NOV.es.daylight.teen-NOV.ea.daylight.teen
}
names(NOV.daylight.vpd.teen) <- sprintf("vpd.day.20%s.nov", names(NOV.daylight.vpd.teen))

NOV.daylight.vpd.mean <- mean(NOV.daylight.vpd.ought$vpd.day.2007.nov,NOV.daylight.vpd.ought$vpd.day.2008.nov,+
                                NOV.daylight.vpd.ought$vpd.day.2009.nov,NOV.daylight.vpd.teen$vpd.day.2010.nov,+
                                NOV.daylight.vpd.teen$vpd.day.2011.nov,NOV.daylight.vpd.teen$vpd.day.2012.nov,+
                                NOV.daylight.vpd.teen$vpd.day.2013.nov,NOV.daylight.vpd.teen$vpd.day.2014.nov,+
                                NOV.daylight.vpd.teen$vpd.day.2015.nov,NOV.daylight.vpd.teen$vpd.day.2016.nov,+
                                NOV.daylight.vpd.teen$vpd.day.2017.nov,NOV.daylight.vpd.teen$vpd.day.2018.nov)

# december
DEC.daylight.vpd.ought <- vector("list", 3)
names(DEC.daylight.vpd.ought) <- 7:9
for (i in 7:9)
{
  DEC.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "pres") [,5,8]
  DEC.pres <- DEC.pres/100 #Convert to millibars for calculation
  DEC.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "sh") [,5,8]
  DEC.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "nddsf") [,5,8]
  DEC.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "vddsf") [,5,8]
  DEC.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_200%dDEC.h5", i), "tmp") [,5,8]
  DEC.tmp <- data.frame(DEC.tmp - 273.15)
  DEC.ea <- (DEC.pres * DEC.qair / (0.378 * DEC.qair + 0.622)) / 10 #Convert to kPa for TROLL
  DEC.es <- 6.116441 * 10 ^ ((7.591386 * DEC.tmp / (DEC.tmp + 240.7263))) / 10
  
  DEC.daily.vpd.raw.ought <- data.frame(cbind(DEC.ea,DEC.es,DEC.nbdsf,DEC.nddsf,DEC.vbdsf,DEC.vddsf))
  DEC.daily.vpd.raw.ought <- DEC.daily.vpd.raw.ought %>% mutate(total_irrad = DEC.nbdsf + DEC.nddsf + DEC.vbdsf + DEC.vddsf)
  DEC.ea.daylight.ought <- mean(DEC.daily.vpd.raw.ought$DEC.ea)
  DEC.es.daylight.ought <- mean(DEC.daily.vpd.raw.ought$DEC.tmp...273.15)
  
  DEC.daylight.vpd.ought[[as.character(i)]] <- DEC.es.daylight.ought-DEC.ea.daylight.ought
}
names(DEC.daylight.vpd.ought) <- sprintf("vpd.day.200%s.dec", names(DEC.daylight.vpd.ought))

DEC.daylight.vpd.teen <- vector("list", 9)
names(DEC.daylight.vpd.teen) <- 10:18
for (i in 10:18)
{
  DEC.pres <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "pres") [,5,8]
  DEC.pres <- DEC.pres/100 #Convert to millibars for calculation
  DEC.qair <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "sh") [,5,8]
  DEC.nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nbdsf") [,5,8]
  DEC.nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "nddsf") [,5,8]
  DEC.vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vbdsf") [,5,8]
  DEC.vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "vddsf") [,5,8]
  DEC.tmp <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_reanalysis/CR_20%dDEC.h5", i), "tmp") [,5,8]
  DEC.tmp <- data.frame(DEC.tmp - 273.15)
  DEC.ea <- (DEC.pres * DEC.qair / (0.378 * DEC.qair + 0.622)) / 10 #Convert to kPa for TROLL
  DEC.es <- 6.116441 * 10 ^ ((7.591386 * DEC.tmp / (DEC.tmp + 240.7263))) / 10
  
  DEC.daily.vpd.raw.teen <- data.frame(cbind(DEC.ea,DEC.es,DEC.nbdsf,DEC.nddsf,DEC.vbdsf,DEC.vddsf))
  DEC.daily.vpd.raw.teen <- DEC.daily.vpd.raw.teen %>% mutate(total_irrad = DEC.nbdsf + DEC.nddsf + DEC.vbdsf + DEC.vddsf)
  DEC.ea.daylight.teen <- mean(DEC.daily.vpd.raw.teen$DEC.ea)
  DEC.es.daylight.teen <- mean(DEC.daily.vpd.raw.teen$DEC.tmp...273.15)
  
  DEC.daylight.vpd.teen[[as.character(i)]] <- DEC.es.daylight.teen-DEC.ea.daylight.teen
}
names(DEC.daylight.vpd.teen) <- sprintf("vpd.day.20%s.dec", names(DEC.daylight.vpd.teen))

DEC.daylight.vpd.mean <- mean(DEC.daylight.vpd.ought$vpd.day.2007.dec,DEC.daylight.vpd.ought$vpd.day.2008.dec,+
                                DEC.daylight.vpd.ought$vpd.day.2009.dec,DEC.daylight.vpd.teen$vpd.day.2010.dec,+
                                DEC.daylight.vpd.teen$vpd.day.2011.dec,DEC.daylight.vpd.teen$vpd.day.2012.dec,+
                                DEC.daylight.vpd.teen$vpd.day.2013.dec,DEC.daylight.vpd.teen$vpd.day.2014.dec,+
                                DEC.daylight.vpd.teen$vpd.day.2015.dec,DEC.daylight.vpd.teen$vpd.day.2016.dec,+
                                DEC.daylight.vpd.teen$vpd.day.2017.dec,DEC.daylight.vpd.teen$vpd.day.2018.dec)

vpd.daylight.by.month <- c(JAN.daylight.vpd.mean,FEB.daylight.vpd.mean,MAR.daylight.vpd.mean,APR.daylight.vpd.mean,+
                             MAY.daylight.vpd.mean,JUN.daylight.vpd.mean,JUL.daylight.vpd.mean,AUG.daylight.vpd.mean,+
                             SEP.daylight.vpd.mean,OCT.daylight.vpd.mean,NOV.daylight.vpd.mean,DEC.daylight.vpd.mean)

plot(vpd.daylight.by.month,ylab='daytime VPD [kPa]',xlab='month')
################################

reanalysis_TROLL_climate <- rbind(tmp.by.month.mean,tmp.by.month.max,tmp.by.month.min,
                                    prate.by.month,wind.v.by.month,irrad.max.by.month,
                                    irrad.mean.by.month,es.mean.by.month,ea.mean.by.month,
                                    vpd.mean.by.month,vpd.daylight.by.month,vpd.max.by.month)
