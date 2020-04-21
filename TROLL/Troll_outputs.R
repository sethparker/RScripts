################################
## SETH M PARKER
## UNIVERSITY OF NOTRE DAME
################################
library(ggplot2)
################################
# Output
  
num_sp <- 12  # Enter the number of species modeled
  
  # Select TROLL output.csv
  output <- read.csv(file.choose(), header = FALSE)
  
  # dbh > 1cm per hectare
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,2+num_sp])) + 
    theme_classic() + xlab("month") + ylab("number of trees >1cm dbh per hectare")
  
  # dbh > 10cm per hectare
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,3+num_sp*2])) + 
    theme_classic() + xlab("month") + ylab("number of trees >10cm dbh per hectare")
  
  # dbh > 30cm per hectare
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,4+num_sp*3])) + 
    theme_classic() + xlab("month") + ylab("number of trees >30cm dbh per hectare")
  
  # total ba of trees > 10cm dbh
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,5+num_sp*4])) + 
    theme_classic() + xlab("month") + ylab("total ba of trees >10cm dbh [m^2]")
  
  # total NPP per timestep in MgC/ha
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,6+num_sp*5])) + 
    theme_classic() + xlab("month") + ylab("NPP per month [MgC/ha]")
  
  # total GPP per timestep in MgC/ha
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,7+num_sp*6])) + 
    theme_classic()+ xlab("month") + ylab("GPP per month [MgC/ha]")
  
  # total AGB per timestep
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,8+num_sp*7]/1000)) + 
    theme_classic()+ xlab("month") + ylab("AGB [Mg/ha]")

  # NPP / GPP
  ggplot(data = output) + 
    geom_line(mapping = aes(x = output[,1], y = output[,6+num_sp*5]/output[,7+num_sp*6])) + 
    theme_classic() + xlab("month") + ylab("NPP / GPP")

################################
# Final Pattern
  # Select TROLL final_pattern.csv
final_pattern <- read.csv(file.choose(), header = FALSE)

# species distribution
ggplot(data = final_pattern) + 
  geom_bar(mapping = aes(x = final_pattern[,8])) +
  theme_classic()+ xlab("Species Distribution in Final Month")+ ylab("Number of stems")

# species vs leaf area
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,8], y = final_pattern[,9]), position = "jitter") +
  theme_classic()+ xlab("Species")+ ylab("Leaf area")

# age vs height
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,3], y = final_pattern[,5]), position = "jitter") +
  theme_classic()+ xlab("Age")+ ylab("Height [m]")

# dbh vs height
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,4], y = final_pattern[,5]), position = "jitter") +
  theme_classic()+ xlab("dbh [m]")+ ylab("Height [m]")

# species vs height
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,8], y = final_pattern[,5]), position = "jitter") +
  theme_classic()+ xlab("Species")+ ylab("Height [m]")

# height vs cr. depth
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,5], y = final_pattern[,7]), position = "jitter") +
  theme_classic()+ xlab("height [m]")+ ylab("crown depth [m]")

# cr. rad vs leaf area
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,6], y = final_pattern[,9]), position = "jitter") +
  theme_classic()+ xlab("crown radius [m]")+ ylab("leaf area")

# species vs cr. radius
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,8], y = final_pattern[,6]), position = "jitter") +
  theme_classic()+ xlab("Species")+ ylab("crown radius [m]")

# cr. rad vs cr depth
ggplot(data = final_pattern) +
  geom_point(mapping = aes(x = final_pattern[,6], y = final_pattern[,7]), position = "jitter") +
  theme_classic()+ xlab("crown radius [m]")+ ylab("crown depth [m]")

# leaf area vs log GPP
plot(final_pattern[,9],log(final_pattern[,11]),xlab = "leaf area", ylab = "log GPP")

# dbh vs leaf area
plot(final_pattern[,4],final_pattern[,9], xlab = "dbh", ylab = "leaf area")



hist(log(final_pattern[final_pattern[,8]==6,11]))

# look at litterfall and all relationships in final_pat

# Litterfall

litter <- read.csv(file.choose(), header = FALSE)

# Total litterfall
ggplot(data = litter) +
  geom_point(mapping = aes(x = output[,1], y = litter[,num_sp+1]), position = "jitter") +
  theme_classic()+ xlab("Month")+ ylab("litterfall")

# Total excluding outliers (sp. 3 and 6)
  # less flexible script
ggplot(data = litter) +
  geom_line(mapping = aes(x = output[,1], y = litter[,1]+litter[,2]+litter[,4]+
                             litter[,5]+litter[,7]+litter[,8]+
                             litter[,9]+litter[,10]+litter[,11]+
                             litter[,12]), position = "jitter") +
  theme_classic()+ xlab("Month")+ ylab("litterfall, exlucing outliers")

# num_sp litter analysis
  # less flexible script
ggplot(data = litter) +
  geom_line(mapping = aes(x = output[,1], y = litter[,1], color = "red"), position = "jitter") +
  theme_classic()+ xlab("Month")+ ylab("litterfall")+
  geom_line(mapping = aes(x = output[,1], y = litter[,2], color = "blue"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,3], color = "green"))+ #spike
  geom_line(mapping = aes(x = output[,1], y = litter[,4], color = "orange"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,5], color = "purple"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,6], color = "black"))+ #spike
  geom_line(mapping = aes(x = output[,1], y = litter[,7], color = "pink"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,8], color = "gold"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,9], color = "navy"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,10], color = "aquamarine"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,11], color = "cornflowerblue"))+
  geom_line(mapping = aes(x = output[,1], y = litter[,12], color = "cadetblue"))+
  scale_color_discrete(name = "Species #", labels = c("1","2","3","4","5","6","7","8","9","10","11","12"))


