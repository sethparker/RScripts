################################
## SETH M PARKER
## UNIVERSITY OF NOTRE DAME
################################
library(ggplot2)
################################
# Output
  
num_sp <-   # Enter the number of species modeled
  
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
  geom_point(mapping = aes(x = final_pattern[,8], y = final_pattern[,9])) +
  theme_classic()+ xlab("Species")+ ylab("Leaf area")




