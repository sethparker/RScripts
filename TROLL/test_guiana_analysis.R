################################
# SETH M PARKER
# UNIVERSITY OF NOTRE DAME
################################

library(ggplot2)
library(dplyr)

output <- read.csv(file.choose())
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
  geom_line(mapping = aes(x = c(1:6000), y = litterfall[,164])) + 
  theme_classic()+ xlab("month") + ylab("litterfall per month")

# species distribution
ggplot(data = final_pattern) + 
  geom_bar(mapping = aes(x = final_pattern[,8])) +
  theme_classic()+ xlab("Species Distribution in year 500")+ ylab("Number of stems")

target_species <- c(14,17,32,47,62,126)
most_abundant <- final_pattern %>%
  filter(final_pattern[,8] %in% target_species)

most_abundant <- most_abundant %>% mutate(case_when(most_abundant[,8] == 14 ~ "Licania_heteromorpha", most_abundant[,8] == 17 ~ "Simaba_cedron", most_abundant[,8] == 32 ~ "Pouteria_guianensis", most_abundant[,8] == 47 ~ "Ocotea_argyrophylla", most_abundant[,8] == 62 ~ "Xylopia_nitida", most_abundant[,8] == 126 ~ "Protium_decandrum"))

ggplot(data = most_abundant) + 
  geom_bar(mapping = aes(x = most_abundant[,12])) + 
  theme_classic()+ xlab("Most Common Species in year 500")+ ylab("Number of stems")

# Distribution of a scarce tree Licarnia Cannella across the forest at year 500
plot(Licaria_cannella$row, Licaria_cannella$column)

#figure 6A
hist(merged_data$LMA, breaks = 100)

