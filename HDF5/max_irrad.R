# Use sed to change the months

JAN.nbdsf <- vector('list', 5)
JAN.nddsf <- vector('list', 5)
JAN.vbdsf <- vector('list', 5)
JAN.vddsf <- vector('list', 5)
names(JAN.nbdsf) <- 5:9
names(JAN.nddsf) <- 5:9
names(JAN.vbdsf) <- 5:9
names(JAN.vddsf) <- 5:9
for (i in 5:9)
{
  nbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_met/Horizontes_201%dJAN.h5", i), "nbdsf")
  JAN.nbdsf[[as.character(i)]] <- max(nbdsf)
  nddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_met/Horizontes_201%dJAN.h5", i), "nddsf")
  JAN.nddsf[[as.character(i)]] <- max(nddsf)
  vbdsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_met/Horizontes_201%dJAN.h5", i), "vbdsf")
  JAN.vbdsf[[as.character(i)]] <- max(vbdsf)
  vddsf <- h5read(sprintf("/Users/sethparker/Documents/Medvigy_Lab/CR_met/Horizontes_201%dJAN.h5", i), "vddsf")
  JAN.vddsf[[as.character(i)]] <- max(vddsf)
}
names(JAN.nbdsf) <- sprintf("nbdsf.201%s.jan", names(JAN.nbdsf))
names(JAN.nddsf) <- sprintf("nddsf.201%s.jan", names(JAN.nddsf))
names(JAN.vbdsf) <- sprintf("vbdsf.201%s.jan", names(JAN.vbdsf))
names(JAN.vddsf) <- sprintf("vddsf.201%s.jan", names(JAN.vddsf))

JAN.max.irrad <- sum(
  mean(JAN.nbdsf$nbdsf.2015.jan,JAN.nbdsf$nbdsf.2016.jan,JAN.nbdsf$nbdsf.2017.jan,JAN.nbdsf$nbdsf.2018.jan,JAN.nbdsf$nbdsf.2019.jan),
  mean(JAN.nddsf$nddsf.2015.jan,JAN.nddsf$nddsf.2016.jan,JAN.nddsf$nddsf.2017.jan,JAN.nddsf$nddsf.2018.jan,JAN.nddsf$nddsf.2019.jan),
  mean(JAN.vbdsf$vbdsf.2015.jan,JAN.vbdsf$vbdsf.2016.jan,JAN.vbdsf$vbdsf.2017.jan,JAN.vbdsf$vbdsf.2018.jan,JAN.vbdsf$vbdsf.2019.jan),
  mean(JAN.vddsf$vddsf.2015.jan,JAN.vddsf$vddsf.2016.jan,JAN.vddsf$vddsf.2017.jan,JAN.vddsf$vddsf.2018.jan,JAN.vddsf$vddsf.2019.jan)
)
