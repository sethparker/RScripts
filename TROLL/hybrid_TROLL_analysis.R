################################
## SETH M PAARKER
## UNIVERSITY OF NOTRE DAME
################################
# Analysis of output from hybridized TROLL guiana/CR run

library(dplyr)
library(ggplot2)

output <- read.csv(file.choose())
litterfall <- read.csv(file.choose())
final_pattern <- read.csv(file.choose())

# dbh > 10cm per hectare
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,329])) + 
  theme_classic() + xlab("month") + ylab("number of trees >10cm dbh per hectare")

# dbh > 30cm per hectare
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,493])) + 
  theme_classic() + xlab("month") + ylab("number of trees >30cm dbh per hectare")

# total ba of trees > 10cm dbh
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,657])) + 
  theme_classic() + xlab("month") + ylab("total ba of trees >10cm dbh [m^2]")

# total NPP per timestep in MgC/ha
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,821])) + 
  theme_classic() + xlab("month") + ylab("NPP per month [MgC/ha]")

# total GPP per timestep in MgC/ha
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,985])) + 
  theme_classic()+ xlab("month") + ylab("GPP per month [MgC/ha]")

# total AGB per timestep
ggplot(data = output) + 
  geom_line(mapping = aes(x = output[,1], y = output[,1149])) + 
  theme_classic()+ xlab("month") + ylab("AGB")

# litterfall
ggplot(data = litterfall) + 
  geom_line(mapping = aes(x = c(1:5999), y = litterfall[,164])) + 
  theme_classic()+ xlab("month") + ylab("litterfall per month")

# species distribution
ggplot(data = final_pattern) + 
  geom_bar(mapping = aes(x = final_pattern[,8])) +
  theme_classic()+ xlab("Species Distribution in year 500")+ ylab("Number of stems")

#figure 6A
hist(merged_data$LMA, breaks = 100)
